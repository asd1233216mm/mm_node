<template>
	<main id="sys_address_area">
		<mm_grid>
			<mm_col>
				<mm_view>
					<header class="arrow"><h5>地区</h5></header>
					<mm_body>
						<mm_form class="mm_filter">
							<h5><span>筛选条件</span></h5>
							<mm_list col="2">
								<mm_col><mm_input v-model="query.keyword" title="关键词" desc="用户名 / 手机号 / 邮箱 / 姓名" @blur="search()" /></mm_col>
							</mm_list>
						</mm_form>
						<div class="mm_action">
							<h5><span>操作</span></h5>
							<div class="">
								<mm_btn class="btn_primary-x" url="./address_area_form">添加</mm_btn>
								<mm_btn @click.native="show = true" class="btn_primary-x" v-bind:class="{ disabled: !selects }">批量修改</mm_btn>
							</div>
						</div>
						<mm_table type="2">
							<thead>
								<tr>
									<th scope="col" class="th_selected"><input type="checkbox" :checked="select_state" @click="select_all()" /></th>
									<th scope="col" class="th_id">#</th>
									<th scope="col" class="th_area"><mm_reverse title="名称" v-model="query.orderby" field="name" :func="search"></mm_reverse></th>
									<th scope="col" class="th_city"><span>城市</span></th>
									<th scope="col" class="th_onoff"><mm_reverse title="显示" v-model="query.orderby" field="show" :func="search"></mm_reverse></th>
									<th scope="col" class="th_handle">操作</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(o, idx) in list" :key="idx">
									<th scope="row"><input type="checkbox" :checked="select_has(o[field])" @click="select_change(o[field])" /></th>
									<th scope="row">{{ o[field] }}</th>
									<td>
										<span class="name">{{ o.name }}</span>
									</td>
									<td>
										<span class="name">{{ o.city }}</span>
									</td>
									<td>
										<span class="onOff">{{ show_group[o.show] }}</span>
									</td>
									<td>
										<mm_btn class="btn_primary" :url="'./address_area_form?area_id=' + o[field]">修改</mm_btn>
										<mm_btn class="btn_warning" @click.native="del_show(o, field)">删除</mm_btn>
									</td>
								</tr>
							</tbody>
						</mm_table>
					</mm_body>
					<footer>
						<mm_grid col="4" class="mm_data_count">
							<mm_col><mm_select v-model="query.size" :options="$to_size()" @change="search()" /></mm_col>
							<mm_col width="50">
								<mm_pager display="2" v-model="query.page" :count="count / query.size" :func="goTo" :icons="['首页', '上一页', '下一页', '尾页']"></mm_pager>
							</mm_col>
							<mm_col>
								<div class="right plr">
									<span class="fl">共 {{ count }} 条</span>
									<span>当前</span>
									<input class="pager_now" v-model.number="page_now" @blur="goTo(page_now)" @change="page_change" />
									<span>/{{ page_count }}页</span>
								</div>
							</mm_col>
						</mm_grid>
					</footer>
				</mm_view>
			</mm_col>
		</mm_grid>
		<mm_modal v-model="show" mask="true">
			<mm_view class="card bg_no">
				<header class="bg_white"><h5>批量修改</h5></header>
				<mm_body>
					<dl>
						
					</dl>
				</mm_body>
				<footer>
					<div class="mm_group">
						<button class="btn_default" type="reset" @click="show = false">取消</button>
						<button class="btn_primary" type="button" @click="set_bath()">提交</button>
					</div>
				</footer>
			</mm_view>
		</mm_modal>
	</main>
</template>

<script>
import mixin from '/src/mixins/page.js';

export default {
	mixins: [mixin],
	data() {
		return {
			// 列表请求地址
			url_get_list: '/apis/sys/address_area',
			url_del: '/apis/sys/address_area?method=del&',
			url_set: '/apis/sys/address_area?method=set&',
			field: 'area_id',
			query_set: {
				area_id: ''
			},
			// 查询条件
			query: {
				// 排序
				orderby: '',
				// 页码
				page: 1,
				// 页面大小
				size: 10,
				// 关键词
				keyword: ''
			},
			form: {},
			show_group:["否", "是"],
			// 视图模型
			vm: {}
		};
	},
	methods: {
		get_list_after(json, status) {
			if (json.list) {
				var arr = json.list.toArr('city_id');
				this.get_city(arr.join('|'), json.list);
			}
			return json.list;
		},
		
		/**
		 * 获取城市
		 * @param {String} city_id 城市ID
		 * @param {Array} list 列表
		 */
		get_city(city_id,list) {
			var _this = this;
			this.$get('/apis/sys/address_city?', { city_id }, function(json, status) {
				if (json.result) {
					var lt = json.result.list;
					for (var i = 0; i < list.length; i++) {
						var o = list[i];
						var obj = lt.getObj({ city_id: o.city_id });
						if (obj) {
							o.city = obj.name;
						}
					}
					var arr = json.list.toArr('father_id');
					this.get_father(arr.join('|'), json.list);
				}
			});
		},
		get_father(channel_id,list) {
			var _this = this;
			this.$get('~/apis/mall/product_channel?', { channel_id }, function(json) {
				if (json.result) {
					var lt = json.result.list;
					for (var i = 0; i < list.length; i++) {
						var o = list[i];
						var obj = lt.getObj({ city_id: o.father_id });
						if (obj) {
							o.father = obj.name;
						}
					}
					_this.list = list;
				}
			});
		}
	},
	created() {
		
	}
};
</script>

<style>
/* 页面 */
#sys_address_area {
}

/* 表单 */
#sys_address_area .mm_form {
}

/* 筛选栏栏 */
#sys_address_area .mm_filter {
}

/* 操作栏 */
#sys_address_area .mm_action {
}

/* 模态窗 */
#sys_address_area .mm_modal {
}

/* 表格 */
#sys_address_area .mm_table {
}

/* 数据统计 */
#sys_address_area .mm_data_count {
}
</style>

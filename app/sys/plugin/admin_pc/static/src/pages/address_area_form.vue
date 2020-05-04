<template>
	<main id="sys_address_area_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<header class="arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}地区</h5>
					</header>
					<dl>
						<dt>名称</dt>
						<dd><mm_input type="text" v-model="form.name" desc="由2-16个字符组成"></mm_input></dd>
						<dt>显示</dt>
						<dd><mm_switch v-model="form.show"></mm_switch></dd>
						<dt>顺序</dt>
						<dd><mm_select v-model="form.display" :options="to_kv()"></mm_select></dd>
						<dt>商户级别</dt>
						<dd><mm_select v-model="form.mc" :options="$to_kv(['', 1, 2, 3, 4, 5])"></mm_select></dd>
						<dt>个性签名</dt>
						<dd><textarea v-model="form.signature" placeholder="由2-16个字符组成"></textarea></dd>
					</dl>
					<footer>
						<div class="mm_group">
							<button class="btn_default" type="reset">重置</button>
							<button class="btn_primary" type="button" @click="submit()">提交</button>
						</div>
					</footer>
				</mm_form>
			</mm_col>
		</mm_grid>
	</main>
</template>

<script>
import mixin from '/src/mixins/page.js';

export default {
	mixins: [mixin],
	components: {},
	data() {
		return {
			url_submit: '/apis/sys/address_area?',
			url_get_obj: '/apis/sys/address_area',
			field: 'area_id',
			query: {
				area_id: 0
			},
			form: {
				// 地区名称
				name: '',
				// 是否可见
				show: 0,
				// 显示顺序
				display: 0,
				// 所属城市ID
				city_id: 0
			}
		};
	},
	methods: {}
};
</script>

<style>
/* 页面 */
#sys_address_area_form {
}

/* 表单 */
#sys_address_area_form .mm_form {
}

/* 筛选栏栏 */
#sys_address_area_form .mm_filter {
}

/* 操作栏 */
#sys_address_area_form .mm_action {
}

/* 模态窗 */
#sys_address_area_form .mm_modal {
}

/* 表格 */
#sys_address_area_form .mm_table {
}

/* 数据统计 */
#sys_address_area_form .mm_data_count {
}
</style>

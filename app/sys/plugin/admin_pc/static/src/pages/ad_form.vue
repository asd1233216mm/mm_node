<template>
	<main id="sys_ad_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<header class="arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}省份</h5>
					</header>
					<dl>
						<dt>头像</dt>
						<dd>
							<mm_upload_img width="10rem" height="10rem" name="avatar" type="text" v-model="form.avatar"></mm_upload_img>
						</dd>
						<dt>顺序</dt>
						<dd>
							<mm_number v-model="form.display"></mm_number>
						</dd>
						<dt>城市</dt>
						<dd>
							<mm_select v-model="form.city_id" :options="$to_kv(['',1,2,3,4,5])"></mm_select>
						</dd>
						<dt>投放地区</dt>
						<dd>
							<mm_select v-model="form.area_id" :options="$to_kv(['',1,2,3,4,5])"></mm_select>
						</dd>
						<dt>用户</dt>
						<dd>
							<mm_select v-model="form.user_id" :options="$to_kv(['',1,2,3,4,5])"></mm_select>
						</dd>
						<dt>访客数</dt>
						<dd>
							<mm_number v-model="form.times_user" :min="0" :max="2147483647"></mm_number>
						</dd>
						<dt>访客上限</dt>
						<dd>
							<mm_number v-model="form.times_max" :min="0" :max="2147483647"></mm_number>
						</dd>
						<dt>展现量</dt>
						<dd>
							<mm_number v-model="form.times_show" :min="0" :max="2147483647" ></mm_number>
						</dd>
						<dt>点击量</dt>
						<dd>
							<mm_number v-model="form.times_click" :min="0" :max="2147483647" ></mm_number>
						</dd>
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
				url_submit: "/apis/sys/address_province?",
				url_get_obj: "/apis/sys/address_province",
				field: "province_id",
				query: {
					"province_id": 0
				},
				form: {}
			}
		},
		methods: {

		}
	}
</script>

<style>
	/* 页面 */
	#sys_ad_form {}

	/* 表单 */
	#sys_ad_form .mm_form {}

	/* 筛选栏栏 */
	#sys_ad_form .mm_filter {}

	/* 操作栏 */
	#sys_ad_form .mm_action {}

	/* 模态窗 */
	#sys_ad_form .mm_modal {}

	/* 表格 */
	#sys_ad_form .mm_table {}

	/* 数据统计 */
	#sys_ad_form .mm_data_count {}
</style>

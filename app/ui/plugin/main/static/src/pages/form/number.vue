<template>
	<mm_page id="page_btn">
		<header>
			<mm_grid>
				<mm_col width="100">
					<mm_view url="/">
						<h3>
							<span>计数器</span>
							<span class="fr">&lt; 返回</span></router-link>
						</h3>
					</mm_view>
				</mm_col>
			</mm_grid>
		</header>
		<main>
			<mm_grid>
				<mm_col width="100">
					<mm_view class="pc">
						<h5 @click="$copy(code_1)">样式一</h5>
						<mm_number v-model="value" :min="min" :max="max" :num="num"></mm_number>
					</mm_view>

					<mm_view class="mobile">
						<h5 @click="$copy(code_2)">样式二</h5>
						<mm_number v-model="value" :min="min" :max="max" :num="num"></mm_number>
					</mm_view>

					<mm_view>
						{{ value }}
					</mm_view>
				</mm_col>
			</mm_grid>
		</main>
	</mm_page>
</template>

<script>
	export default {
		data() {
			return {
				value: 5,
				min: 5,
				max: 150,
				// 每次增减数
				num: 5,
				code_1: `
<mm_view class="pc">
<mm_number v-model="value" :min="min" :max="max" :num="num"></mm_number>
</mm_view>
`,
				code_2: `
<mm_view class="mobile">
<mm_number v-model="value" :min="min" :max="max" :num="num"></mm_number>
</mm_view>
`
			}
		}
	}
</script>

<style>
</style>

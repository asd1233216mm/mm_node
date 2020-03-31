const com = require('../../com/get_market.js');

var sql = $.mysql_admin('sys', __dirname);
sql.setConfig($.config.mysql);
sql.open();

/**
 * @description 定时任务函数
 */
exports.main = async function main() {
	// 实例化数据库操作类
	await com.get_market(sql.db());
};
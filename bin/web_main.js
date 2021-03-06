const Process_sub = require('mm_process/sub');
const startup = require('./web_startup.js');

var app = null;

// 实例化子进程通讯函数
$.process = new Process_sub({
	// 添加方法
	methods: {
		// 修改消息接收方法
		async message(data, server) {
			if (data === 'server') {
				//处理与客户端的连接
				server.on('connection', function (socket) {
					//交给http服务来处理
					app.emit('connection', socket);
				});
			} else {
				this.message_handle(data)
			}
		},
		async init(config){
			var { port, host, channel_id, runPath } = config.server;
			$.channel = {
				id: channel_id,
				pid: this.process.pid
			};
			$.runPath = runPath;
			
			// 在初始化的时候才加载http服务
			app = startup(config).listen(port, host);
			
			// $.log.success('子进程', 'PID:' + process.pid + ' 端口:' + port + ' 初始化成功!');
			console.log(`  频道${channel_id} -> 端口: ${port}  进程ID: ${$.channel.pid}`.yellow);
		}
	}
});

﻿<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>网站后台管理模版</title>
		<link rel="stylesheet" type="text/css" href="../../static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="../../static/admin/css/admin.css" />
	</head>

	<body>
		<div class="page-content-wrap clearfix">
				<form class="layui-form">
					<div class="layui-tab">
						<ul class="layui-tab-title">
						  <li><a href="danye-list.html">图片列表</a></li>
						  <li class="layui-this">图片管理</li>
						</ul>
						<div class="layui-tab-content">
						  <div class="layui-tab-item"></div>
							<div class="layui-tab-item layui-show">
								<div class="layui-form-item">
								  <label class="layui-form-label">图片名称：</label>
								  <div class="layui-input-block">
										<inp图片ut type="text" name="name" required lay-verify="required" placeholder="请输入文章名称" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">选择模板：</label>
									<div class="layui-input-block">
										<select name="category" lay-verify="required">
											<option value="">请选择模板</option>
											<option value="1">article.html</option>
											<option value="2">list.html</option>
											<option value="2">page.html</option>
										</select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">图像上传：</label>
									<div class="layui-input-block">
										<input type="file" name="file（可随便定义）" class="layui-upload-file">
									</div>
								</div>
								
								<div class="layui-form-item layui-form-text">
								  <label class="layui-form-label">图片内容：</label>
								  <div class="layui-input-block">
										<textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor"></textarea>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">关键字：</label>
									<div class="layui-input-block">
										<input type="text" name="laiyuan" placeholder="请输入关键字" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">描述：</label>
									<div class="layui-input-block">
										<textarea placeholder="请输入内容" class="layui-textarea"></textarea>
									</div>
								</div>
							</div>
							<div class="layui-tab-item">
								
							</div>
						</div>
					</div>
					<div class="layui-form-item" style="padding-left: 10px;">
						<div class="layui-input-block">
							<button class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">立即提交</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>
		</div>
		<script type="text/javascript">
			var SCOPE = {
				static: '/static',
				index: '/admin/category/index.html',
				add: 'add.html',
				save: '/admin/category/save.html',
				edit: 'add.html',
				updateEdit: '/admin/category/updateedit.html',
				status: '/admin/category/updatestatus.html',
				del: '/admin/category/del.html',
				delAll: '/admin/category/deleteall.html',
				listOrderAll: '/admin/category/listorderall.html'
			}
		</script>
		<script src="../../static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
		<script>
			
			layui.use(['form', 'jquery', 'laydate', 'layer', 'laypage', 'dialog', 'element', 'upload', 'layedit'], function() {
				var form = layui.form(),
					layer = layui.layer,
					$ = layui.jquery,
					laypage = layui.laypage,
					laydate = layui.laydate,
					layedit = layui.layedit,
					element = layui.element(),
					dialog = layui.dialog;

				//获取当前iframe的name值
				var iframeObj = $(window.frameElement).attr('name');
				//创建一个编辑器
				var editIndex = layedit.build('LAY_demo_editor', {
					tool: ['strong' //加粗
						, 'italic' //斜体
						, 'underline' //下划线
						, 'del' //删除线
						, '|' //分割线
						, 'left' //左对齐
						, 'center' //居中对齐
						, 'right' //右对齐
						, 'link' //超链接
						, 'unlink' //清除链接
						, 'image' //插入图片
					],
					height: 100
				})
				//全选
				form.on('checkbox(allChoose)', function(data) {
					var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
					child.each(function(index, item) {
						item.checked = data.elem.checked;
					});
					form.render('checkbox');
				});
				form.render();

				layui.upload({
					url: '上传接口url',
					success: function(res) {
						console.log(res); //上传成功返回值，必须为json格式
					}
				});
			});
		</script>
	</body>

</html>
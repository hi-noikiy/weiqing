<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 0) ? (include $this->template('common/header', TEMPLATE_INCLUDEPATH)) : (include template('common/header', TEMPLATE_INCLUDEPATH));?>
<link href="./resource/css/app.css" rel="stylesheet">
<link href="./resource/css/edit.css" rel="stylesheet">
<link href="./resource/css/reset.css" rel="stylesheet">
<?php  if($do == 'page') { ?>
	<ul class="nav nav-tabs">
		<li class="active"><a href="<?php  echo url('site/editor/page', array('multiid' => $multiid))?>">专题管理</a></li>
		<li><a href="<?php  echo url('site/editor/design', array('multiid' => $multiid))?>">添加专题页面</a></li>
	</ul>
	<div class="clearfix">
		<div class="panel panel-default">
			<div class="panel-heading">
				微页面
			</div>
			<div class="table-responsive panel-body">
				<table class="table table-hover">
					<thead class="navbar-inner">
					<tr>
						<th>名称</th>
						<th style="width:200px;">关键字</th>
						<th style="width:210px;">创建时间</th>
						<th style="width:250px;">操作</th>
					</tr>
					</thead>
					<tbody>
						<?php  if(is_array($list)) { foreach($list as $page) { ?>
						<tr>
							<td><?php  echo $page['title'];?></td>
							<td><?php  echo $page['params'][0]['property'][0]['params']['keyword'];?></td>
							<td><?php  echo date('Y-m-d H:i', $page['createtime'])?></td>
							<td style="position:relative;">
								<a href="<?php  echo url('site/editor/design', array('id' => $page['id'], 'multiid' => $multiid))?>">编辑</a>
								&nbsp;-&nbsp;
								<span><a class="js-clip" href="javascript:;" data-url="<?php  echo murl('home/page', array('id' => $page['id']), true ,true)?>">复制链接</a></span>
								&nbsp;-&nbsp;
								<a href="<?php  echo url('site/editor/del', array('id' => $page['id'], 'multiid' => $multiid))?>" onclick="if(!confirm('确定删除该微页面吗？')) return false;">删除</a>
							</td>
						</tr>
						<?php  } } ?>
					</tbody>
				</table>
			</div>
		</div>
		<?php  echo $pager;?>
	</div>
<?php  } else if($do == 'design') { ?>
	<ul class="nav nav-tabs">
		<li><a href="<?php  echo url('site/editor/page', array('multiid' => $multiid))?>">专题管理</a></li>
		<li class="active"><a href="<?php  echo url('site/editor/design', array('multiid' => $multiid, 'id' => $id))?>"><?php  if(empty($id)) { ?>添加专题页面<?php  } else { ?>编辑专题页面<?php  } ?></a></li>
	</ul>
	<form action="" method="post" class="form-horizontal" id="design">
		<input type="hidden" name="multiid" value="<?php  echo $multiid;?>" />
		<input type="hidden" name="id" value="<?php  echo $id;?>" />
		<div class="app clearfix" ng-controller="MainCtrl" ng-cloak>
			<input type="hidden" name="wapeditor[params]" id="wapeditor-params" value="{{submit.params}}" />
			<input type="hidden" name="wapeditor[html]" id="wapeditor-html" value="{{submit.html}}" />
			<input type="hidden" name="wapeditor[multipage]" id="wapeditor-multipage" value="{{submit.multipage}}" />
			<div class="app-region">
				<div class="panel">
					<div class="panel-body">
						<label class="text-center col-sm-1">基础</label>
						<ul class="app-add-filed clearfix">
							<li ng-repeat="m in modules" ng-if="m.isbase == true" ng-click="addItem(m['id'])"><a id="{{m['id']}}" class="btn btn-default" href="#" ng-bind="m['name']"></a></li>
						</ul>
						<label class="text-center col-sm-1">组件</label>
						<ul class="app-add-filed clearfix">
							<li ng-repeat="m in modules" ng-if="!m.issystem && !m.isbase" ng-click="addItem(m['id'])"><a id="{{m['id']}}" class="btn btn-default" href="#" ng-bind="m['name']"></a></li>
						</ul>
						<div class="js-editor-submit-div">
							<button type="button" class="btn btn-primary js-editor-submit multi-submit">上架</button>
						</div>
					</div>
				</div>		
			</div>
			<div we7-multipage></div>
			<div class="app-header"><div class="app-header-content"></div></div>
			<div class="app-preview">
				<div class="app-content" ng-style="{'background-color' : activeModules[0].params.bgColor, 'height' : activeModules[0].params.pageHeight+'px'}">
					<div class="modules" ng-style="{'height' : activeModules[0].params.pageHeight+'px'}" we7-edit-key-map>
						<div ng-if="module['id']" id="module-{{module.index}}" name="{{module.id}}" index="{{module.index}}" ng-class="{'js-sorttable' : !module.issystem && !module.isbase}" ng-repeat="module in activeModules"	ng-style="{'border' : module.issystem ? 'none' : ''}">
							<div ng-init="displayPanel = ('widget-'+(module['id'].toLowerCase())+'-display.html')" ng-include="displayPanel" ng-mousedown="editItem(module.index)"></div>
						</div>
					</div>
				</div>
				
			</div>
			<div class="app-side">
				<div ng-init="editorPanel = ('widget-'+(activeItem['id'].toLowerCase())+'-editor.html'.toLowerCase())" ng-show="activeItem.id == editorid" ng-repeat="editorid in editors" ng-include="editorPanel" id="editor{{editorid}}" class="editor"></div>
				<div ng-show="activeItem['id'] && activeItem['id'] != 'header'" we7-style></div>
			</div>
			<div class="app-footer"><div we7-pagelength></div></div>
		</div>
		<?php  echo tpl_ueditor('')?>
		<script type="text/javascript">
			$(function(){
				$('.modules').click(function(){
					return false;
				});
				require(['underscore', 'bootstrap', 'jquery.ui', 'hammer', 'datetimepicker'], function() {
					var allPages = <?php echo !empty($page['params']) ? $page['params'] : 'null'?>;
					var multipage = <?php echo !empty($page['multipage']) ? $page['multipage'] : 'null'?>;
					angular.module('specialApp').value('config',{ 
						'allPages' : allPages,	
						'multipage' : multipage
					});
					angular.bootstrap(document, ['specialApp']);
				});
			});
		</script>
	</form>
<?php  } else if($do == 'quickmenu') { ?>
	<ul class="nav nav-tabs">
		<?php  if($type == '4') { ?><li><a href="<?php  echo url('site/editor/uc')?>">会员中心</a></li><?php  } else { ?><li><a href="<?php  echo url('site/multi')?>">返回微站管理</a></li><?php  } ?>
		<li class="active"><a href="<?php  echo url('site/editor/quickmenu', array('multiid' => $multiid))?>">快捷菜单</a></li>
	</ul>
	<form action="" method="post">
		<div class="shopNav" id="quickmenu" ng-controller="MainCtrl">
			<div class="well clearfix">
				<div class="shopNav-info col-sm-8">
					<h3>快捷导航</h3>
					<div>微站的各个页面可以通过导航串联起来。通过精心设置的导航，方便访问者在页面或是栏目间快速切换，引导访问者前往您期望的页面。</div>
				</div>
				<div class="shopNav-switch col-sm-4 text-right">
					<input type="checkbox" name="status" value="1" <?php  if(!empty($page['status'])) { ?>checked="checked"<?php  } ?> />
				</div>
			</div>
			<input type="hidden" name="multiid" value="<?php  echo $multiid;?>" />
			<input type="hidden" name="type" value="<?php  echo $type;?>" />
			<input type="hidden" name="wapeditor[params]" id="wapeditor-params" value="{{submit.params}}"/>
			<input type="hidden" name="wapeditor[html]" id="wapeditor-html" value="{{submit.html}}"/>
			<div class="app clearfix">
				<div class="app-preview">
					<div class="app-header"></div>
					<div class="app-content">
						<div class="modules">
							<div class="title">
								<h1><span>[页面标题]</span></h1>
							</div>
						</div>
						<div class="nav-menu" style="display:none;">
							<div class="js-quickmenu nav-menu-wx clearfix" ng-class="{0 : 'has-nav-0', 1 : 'has-nav-1', 2: 'has-nav-2', 3: 'has-nav-3', 4 : 'has-nav-3'}[activeItem.menus.length]" ng-if="activeItem.navStyle == 1">
								<div class="nav-home text-center">
									<a href="<?php  echo $_W['siteroot'];?>app/index.php?i=<?php  echo $_W['uniacid'];?>&j=<?php  echo $_W['acid'];?>&t=<?php  echo $multiid;?>"><i class="fa fa-home"></i></a>
								</div>
								<ul class="nav-group">
									<li class="nav-group-item" ng-if="$index < 3" ng-repeat="menu in activeItem.menus">
										<a ng-if="menu.submenus.length == 0" href="{{menu.url}}">
											{{menu.title}}
										</a>
										<a ng-if="menu.submenus.length > 0" href="javascript:void();" data-toggle="dropdown">
											<i class="fa fa-minus-circle"></i>
											{{menu.title}}
										</a>
										<dl ng-if="menu.submenus.length > 0">
											<dd>
												<a href="{{submenu.url}}" ng-repeat="submenu in menu.submenus">{{submenu.title}}</a>
											</dd>
										</dl>
									</li>
								</ul>
							</div>
							<div class="js-quickmenu nav-menu-app has-nav-0" ng-if="activeItem.navStyle == 2" ng-class="{0 : 'has-nav-0', 1 : 'has-nav-1', 2: 'has-nav-2', 3: 'has-nav-3', 4: 'has-nav-4', 5: 'has-nav-5'}[activeItem.menus.length]" ng-style="{'background-color' : activeItem.bgColor}">
								<ul class="nav-group clearfix">
									<li class="nav-group-item" ng-repeat="menu in activeItem.menus">
										<a href="{{menu.url}}" style="background-position: center 2px" ng-style="{'background-image': menu.image ? 'url('+menu.image+')' : ''}">
											<i ng-hide="menu.image" class="fa" ng-style="{'color' : menu.icon.color}" js-onclass-name="{{menu.hovericon.name}}" js-onclass-color="{{menu.hovericon.color}}" ng-class="menu.icon.name"></i>
											<span ng-style="{'color' : menu.icon.color}" js-onclass-color="{{menu.hovericon.color}}">{{menu.title}}</span>
										</a>
									</li>
								</ul>
							</div>
							<div class="js-quickmenu nav-menu-cart" ng-if="activeItem.navStyle == 3" ng-class="{0 : 'has-nav-0', 1 : 'has-nav-1', 2: 'has-nav-2', 3: 'has-nav-3', 4: 'has-nav-4'}[activeItem.menus.length]" ng-style="{'background-color' : activeItem.bgColor}">
								<ul class="nav-group clearfix">
									<li class="nav-group-item">
										<a href="{{activeItem.menus[0].url}}" ng-style="{'background-image': activeItem.menus[0].image ? 'url('+activeItem.menus[0].image+')' : ''}">
											<i ng-hide="activeItem.menus[0].image" class="fa" ng-style="{'color' : activeItem.menus[0].icon.color}"
											ng-class="activeItem.menus[0].icon.name">
											</i>
										</a>
									</li>
									<li ng-if="activeItem.menus[2]" class="nav-group-item">
										<a href="{{activeItem.menus[1].url}}" ng-style="{'background-image': activeItem.menus[1].image ? 'url('+activeItem.menus[1].image+')' : ''}">
											<i ng-hide="activeItem.menus[1].image" class="fa" ng-style="{'color' : activeItem.menus[1].icon.color}" ng-class="activeItem.menus[1].icon.name"></i>
										</a>
									</li>
									<li class="nav-home nav-group-item">
										<a href="{{activeItem.extend[0].url}}" ng-style="{'background-image': activeItem.extend[0].image ? 'url('+activeItem.extend[0].image+')' : ''}">
											<i ng-hide="activeItem.extend[0].image" class="fa" ng-style="{'color' : activeItem.extend[0].icon.color}" ng-class="activeItem.extend[0].icon.name"></i>
										</a>
									</li>
									<li class="nav-group-item" ng-if="activeItem.menus[1]">
										<a ng-if="!activeItem.menus[2]" href="{{activeItem.menus[1].url}}" ng-style="{'background-image': activeItem.menus[1].image ? 'url('+activeItem.menus[1].image+')' : ''}">
											<i ng-hide="activeItem.menus[1].image" class="fa" ng-style="{'color' : activeItem.menus[1].icon.color}" ng-class="activeItem.menus[1].icon.name"></i>
										</a>
										<a ng-if="activeItem.menus[2]" href="{{activeItem.menus[2].url}}" ng-style="{'background-image': activeItem.menus[2].image ? 'url('+activeItem.menus[2].image+')' : ''}">
											<i ng-hide="activeItem.menus[2].image" class="fa" ng-style="{'color' : activeItem.menus[2].icon.color}" ng-class="activeItem.menus[2].icon.name"></i>
										</a>
									</li>
									<li ng-if="activeItem.menus[3]" class="nav-group-item">
										<a href="{{activeItem.menus[3].url}}" ng-style="{'background-image': activeItem.menus[3].image ? 'url('+activeItem.menus[3].image+')' : ''}">
											<i ng-hide="activeItem.menus[3].image" class="fa" ng-style="{'color' : activeItem.menus[3].icon.color}" ng-class="activeItem.menus[3].icon.name"></i>
										</a>
									</li>
								</ul>
							</div>
							<div class="js-quickmenu nav-menu-path rotate-nav has-nav-4" ng-if="activeItem.navStyle == 4">
								<div class="nav-group">
									<div class="nav-group-item on" ng-repeat="menu in activeItem.menus">
										<a href="{{menu.url}}" ng-style="{'background-image': menu.image ? 'url('+menu.image+')' : ''}">
											<i ng-hide="menu.image" class="fa" ng-style="{'color' : menu.icon.color}" ng-class="menu.icon.name"></i>
										</a>
									</div>
								</div>
								<div class="nav-home nav-group-item js-quickmenu-toggle">
									<a href="javascript:;" style="background-image:url(./resource/images/app/centerbtn.png);"></a>
								</div>
							</div>
							<div class="js-quickmenu nav-menu-sides rotate-nav has-nav-4" ng-if="activeItem.navStyle == 5">
								<div class="nav-group">
									<div class="nav-group-item on" ng-repeat="menu in activeItem.menus">
										<a href="{{menu.url}}" ng-style="{'background-image': menu.image ? 'url('+menu.image+')' : ''}">
											<i ng-hide="menu.image" class="fa" ng-style="{'color' : menu.icon.color}" ng-class="menu.icon.name"></i>
										</a>
									</div>
								</div>
								<div class="main-nav">
									<div class="nav-group-item pull-left">
										<a href="{{activeItem.extend[0].url}}" ng-style="{'background-image': activeItem.extend[0].image ? 'url('+activeItem.extend[0].image+')' : ''}">
											<i ng-hide="activeItem.extend[0].image" class="fa" ng-style="{'color' : activeItem.extend[0].icon.color}" ng-class="activeItem.extend[0].icon.name"></i>
										</a>
									</div>
									<div class="nav-home nav-group-item js-quickmenu-toggle">
										<a href="javascript:;" style="background-image:url(./resource/images/app/centerbtn.png);"></a>
									</div>
									<div class="nav-group-item pull-right">
										<a href="{{activeItem.extend[1].url}}" ng-style="{'background-image': activeItem.extend[1].image ? 'url('+activeItem.extend[1].image+')' : ''}">
											<i ng-hide="activeItem.extend[1].image" class="fa" ng-style="{'color' : activeItem.extend[1].icon.color}" ng-class="activeItem.extend[1].icon.name"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="app-side">
					<?php  if($type == '2') { ?>
					<div class="panel panel-default" style="margin-bottom:15px; padding-bottom:0;">
						<div class="panel-body">
							<div>将导航应用在以下页面:</div>
							<div style="margin:10px 0;">
								<label class="checkbox-inline">
									<input type="checkbox" name="position" ng-model="activeItem.position.homepage" /> 微站主页
								</label>
								<label class="checkbox-inline">
									<input type="checkbox" name="position" ng-model="activeItem.position.page" /> 微页面
								</label>
								<label class="checkbox-inline">
									<input type="checkbox" name="position" ng-model="activeItem.position.article" /> 文章及分类
								</label>
							</div>
							<div>将导航隐藏在以下模块: <a ng-click="showSearchModules()" href="javascript:;">选择模块</a></div>
							<div>
								<div class="form-control-static">
									<label class="label label-warning" ng-show="!hasIgnoreModules">未设置，将在全部模块中显示</label>
									<label style="margin-right:5px;" class="label label-success" ng-show="hasIgnoreModules" ng-repeat="module in activeItem.ignoreModules">{{module.title}}</label>
								</div>
							</div>
						</div>
					</div>
					<?php  } ?>
					<div class="app-shopNav-edit" style="display:none;">
						<div class="arrow-left"></div>
						<div class="inner">
							<div class="panel panel-default form-horizontal">
								<div class="panel-body">
									<div class="shopNav-edit-header clearfix">
										<div class="pull-right">
											<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#shop-nav-modal">修改模板</button>
										</div>
										<div>当前模板: 微信公众号自定义菜单模板</div>
									</div>
									<!--微信公众号自定义菜单模板:shopNav-wx-->
									<div class="shopNav-wx" ng-show="activeItem.navStyle == 1">
										<div class="card" ng-init="$parentIndex = $index" ng-repeat="menu in activeItem.menus">
											<div class="btns">
												<a href="javascript:;" ng-click="removeMenu(menu)"><i class="fa fa-times"></i></a>
											</div>
											<div class="nav-region">
												<div class="first-nav">
													<h3>一级导航</h3>
													<div class="alert">
														<div class="form-group">
															<label class="control-label col-xs-3">标题</label>
															<div class="col-xs-9">
																<input type="text" class="form-control" name="" value="" ng-model="menu.title" />
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-xs-3">链接到</label>
															<div class="col-xs-9 ">
																<div we7-linker we7-my-url="menu.url" we7-my-title="menu.title"></div>
															</div>
														</div>
													</div>
												</div>
												<div class="second-nav">
													<h4>二级导航</h4>
													<div class="alert" ng-repeat="submenu in menu.submenus">
														<div class="del">
															<a href="javascript:;" ng-click="removeSubMenu($parentIndex, submenu)"><i class="fa fa-times"></i></a>
														</div>
														<div class="form-group">
															<label class="control-label col-xs-3">标题</label>
															<div class="col-xs-9">
																<input type="text" class="form-control" name="" ng-model="submenu.title">
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-xs-3">链接到</label>
															<div class="col-xs-9 ">
																<div we7-linker we7-my-url="submenu.url" we7-my-title="submenu.title"></div>
															</div>
														</div>
													</div>
													<div ng-show="menu.submenus.length < 5" ng-click="menu.submenus.length >= 5 ? '' : addSubMenu(menu);" class="add-shopNav">+ 添加二级导航</div>
													<!--最多可添加5个-->
												</div>
											</div>
										</div>
										<div ng-show="activeItem.menus.length < 3" class="add-shopNav text-center" ng-click="activeItem.menus.length >= 3 ? '' : addMenu();">+添加一级导航</div>
										<!--最多添加三个导航-->
									</div>
									<!--end微信公众号自定义菜单模板-->
									<!--APP导航样式:shopNav-app-->
									<div class="shopNav-app" ng-show="activeItem.navStyle == 2">
										<div class="form-group" style="border-bottom:1px solid #e5e5e5; padding:0 0 15px 0; margin:10px 0 0 0;">
											<label class="col-xs-3 control-label">页面颜色</label>
											<div class="col-xs-9 ">
												<div we7-colorpicker we7-my-color="activeItem.bgColor" we7-my-default-color="'#2B2D30'"></div>
											</div>
										</div>
										<div class="card" ng-repeat="menu in activeItem.menus">
											<div class="btns">
												<a href="javascript:;" ng-click="removeMenu(menu)"><i class="fa fa-times"></i></a>
											</div>
											<div class="nav-img-group">
												<div class="clearfix">
													<div class="nav-img-normal pull-left">
														<p>普通：</p>
														<div we7-iconer we7-my-image="menu.image" we7-my-icon="menu.icon" we7-my-icon-color="menu.icon.color">选择</div>
													</div>
													<div class="nav-img-highlight pull-left">
														<p>高亮：</p>
														<div we7-iconer we7-my-image="menu.hoverimage" we7-my-icon="menu.hovericon">选择</div>
													</div>
												</div>
												<div class="help-block">图片尺寸要求：不大于128*100像素，支持PNG格式</div>
											</div>
											<div class="form-group">
												<label class="control-label col-xs-3">标题</label>
												<div class="col-xs-9">
													<input type="text" class="form-control" name="" ng-model="menu.title">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-xs-3">链接到</label>
												<div class="col-xs-9 ">
													<div we7-linker we7-my-url="menu.url" we7-my-title="menu.title"></div>
												</div>
											</div>
										</div>
										<div class="add-shopNav text-center" ng-show="activeItem.menus.length < 5" ng-click="activeItem.menus.length >= 5 ? '' : addMenu();">+添加导航</div>
									</div>
									<!--end APP导航样式-->
									<!--带购物车导航模板-->
									<div class="shopNav-cart" ng-show="activeItem.navStyle == 3">
										<div class="form-group" style="border-bottom:1px solid #e5e5e5; padding:0 0 15px 0; margin:0 0 10px 0;">
											<label class="col-xs-3 control-label">页面颜色</label>
											<div class="col-xs-9">
												<div we7-colorpicker we7-my-color="activeItem.bgColor" we7-my-default-color="'#2B2D30'"></div>
											</div>
										</div>
										<p>添加中间主图标</p>
										<div class="card">
											<div class="nav-img-group">
												<div class="clearfix">
													<div class="nav-img-normal pull-left">
														<p>普通：</p>
														<div we7-iconer we7-my-image="activeItem.extend[0].image" we7-my-icon="activeItem.extend[0].icon" we7-my-icon-color="activeItem.extend[0].icon.color">选择</div>
													</div>
													<div class="nav-img-highlight pull-left">
														<p>高亮：</p>
														<div we7-iconer we7-my-image="activeItem.extend[0].hoverimage" we7-my-icon="activeItem.extend[0].hovericon">选择</div>
													</div>
												</div>
												<div class="help-block">图片尺寸要求：不大于128*100像素，支持PNG格式</div>
											</div>
											<div class="form-group">
												<label class="control-label col-xs-3">链接到</label>
												<div class="col-xs-9 "><div we7-linker we7-my-url="activeItem.extend[0].url" we7-my-title="activeItem.extend[0].title"></div></div>
											</div>
										</div>
										<p>添加两侧图标</p>
										<div class="help-block">此导航模板建议您用两个或者四个自定义图标效果图最佳哦！</div>
										<div class="card" ng-repeat="menu in activeItem.menus">
											<div class="nav-img-group">
												<div class="btns">
													<a href="javascript:;" ng-click="removeMenu(menu)"><i class="fa fa-times"></i></a>
												</div>
												<div class="clearfix">
													<div class="nav-img-normal pull-left">
														<p>普通：</p>
														<div we7-iconer we7-my-image="menu.image" we7-my-icon="menu.icon" we7-my-icon-color="menu.icon.color">选择</div>
													</div>
													<div class="nav-img-highlight pull-left">
														<p>高亮：</p>
														<div we7-iconer we7-my-image="menu.hoverimage" we7-my-icon="menu.hovericon">选择</div>
													</div>
												</div>
												<div class="help-block">图片尺寸要求：不大于128*100像素，支持PNG格式</div>
											</div>
											<div class="form-group">
												<label class="control-label col-xs-3">链接到</label>
												<div class="col-xs-9 ">
													<div we7-linker we7-my-url="menu.url" we7-my-title="menu.title"></div>
												</div>
											</div>
										</div>
										<div class="add-shopNav text-center" ng-show="activeItem.menus.length < 4" ng-click="activeItem.menus.length >= 4 ? '' : addMenu();">+添加导航</div>
									</div>
									<!--end 带购物车导航模板-->
									<!--Path展开形式导航模板-->
									<div class="shopNav-path" ng-show="activeItem.navStyle == 4">
										<form class="form-horizontal" action="" method="post">
											<p class="help-block">此导航模板建议您用三个自定义图标效果最佳哦！</p>
											<div class="card" ng-repeat="menu in activeItem.menus">
												<div class="btns"><a href="javascript:;" ng-click="removeMenu(menu)"><i class="fa fa-times"></i></a></div>
												<div class="nav-img-group">
													<div class="clearfix">
														<div class="nav-img-normal pull-left">
															<p>普通：</p>
															<div we7-iconer we7-my-image="menu.image" we7-my-icon="menu.icon" we7-my-icon-color="menu.icon.color">选择</div>
														</div>
													</div>
													<div class="help-block">图片尺寸要求：不大于128*100像素，支持PNG格式</div>
												</div>
												<div class="form-group">
													<label class="control-label col-xs-3">链接到</label>
													<div class="col-xs-9 "><div we7-linker we7-my-url="menu.url" we7-my-title="menu.title"></div></div>
												</div>
											</div>
											<div class="add-shopNav text-center" ng-show="activeItem.menus.length < 4" ng-click="activeItem.menus.length >= 4 ? '' : addMenu();">+添加导航</div>
											<!--最多可添加4个-->
										</form>
									</div>
									<!--end Path展开形式导航模板-->
									<!--两侧展开导航模板-->
									<div class="shopNav-sides" ng-show="activeItem.navStyle == 5">
										<form class="form-horizontal" action="" method="post">
											<p>添加两侧一级图标</p>
											<div class="card">
												<div class="nav-img-group">
													<div class="clearfix">
														<div class="nav-img-normal pull-left">
															<p>普通：</p>
															<div we7-iconer we7-my-image="activeItem.extend[0].image" we7-my-icon="activeItem.extend[0].icon" we7-my-icon-color="activeItem.extend[0].icon.color">选择</div>
														</div>
													</div>
													<div class="help-block">图片尺寸要求：不大于128*100像素，支持PNG格式</div>
												</div>
												<div class="form-group">
													<label class="control-label col-xs-3">链接到</label>
													<div class="col-xs-9 ">
														<div we7-linker we7-my-url="activeItem.extend[0].url" we7-my-title="activeItem.extend[0].title"></div>
													</div>
												</div>
											</div>
											<div class="card">
												<div class="nav-img-group">
													<div class="clearfix">
														<div class="nav-img-normal pull-left">
															<p>普通：</p>
															<div we7-iconer we7-my-image="activeItem.extend[1].image" we7-my-icon="activeItem.extend[1].icon" we7-my-icon-color="activeItem.extend[1].icon.color">选择</div>
														</div>
													</div>
													<div class="help-block">图片尺寸要求：不大于128*100像素，支持PNG格式</div>
												</div>
												<div class="form-group">
													<label class="control-label col-xs-3">链接到</label>
													<div class="col-xs-9 ">
														<div we7-linker we7-my-url="activeItem.extend[1].url" we7-my-title="activeItem.extend[1].title"></div>
													</div>
												</div>
											</div>
											<p>添加中间二级标题</p>
											<p class="help-block">此导航模板建议您用四个自定义图标效果最佳哦！</p>
											<div class="card" ng-repeat="menu in activeItem.menus">
												<div class="btns">
													<a href="javascript:;" ng-click="removeMenu(menu)"><i class="fa fa-times"></i></a>
												</div>
												<div class="nav-img-group">
													<div class="clearfix">
														<div class="nav-img-normal pull-left">
															<p>普通：</p>
															<div we7-iconer we7-my-image="menu.image" we7-my-icon="menu.icon" we7-my-icon-color="menu.icon.color">选择</div>
														</div>
													</div>
													<div class="help-block">图片尺寸要求：不大于128*100像素，支持PNG格式</div>
												</div>
												<div class="form-group">
													<label class="control-label col-xs-3">链接到</label>
													<div class="col-xs-9 ">
														<div we7-linker we7-my-url="menu.url" we7-my-title="menu.title"></div>
													</div>
												</div>
											</div>
											<div class="add-shopNav text-center" ng-show="activeItem.menus.length < 4" ng-click="activeItem.menus.length >= 4 ? '' : addMenu();">+添加导航</div>
											<!--最多可添加4个-->
										</form>
									</div>
									<!--end 两侧展开导航模板-->
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="shop-preview col-xs-12 col-sm-9 col-lg-10">
					<div class="text-center alert alert-warning">
						<a class="btn btn-primary js-editor-submit" href="javascript:;">保存</a>
					</div>
				</div>
				<!--选择导航模板模态框-->
				<div class="modal fade" id="shop-nav-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">选择导航模板</h4>
							</div>
							<div class="modal-body clearfix">
								<div class="alert">
									<label class="radio-inline">
										<input type="radio" name="nav_style" value="1" ng-checked="activeItem.navStyle == 1">
										微信公众号自定义菜单样式
									</label>
									<div class="wx-example"></div>
								</div>
								<div class="alert">
									<label class="radio-inline">
										<input type="radio" name="nav_style" value="2" ng-checked="activeItem.navStyle == 2">
										APP导航模板1（图标及底色都可配置）
									</label>
									<div class="app-example"></div>
								</div>
								<div class="alert">
									<label class="radio-inline">
										<input type="radio" name="nav_style" value="3" ng-checked="activeItem.navStyle == 3">
										APP导航模板2
									</label>
									<div class="cart-example"></div>
								</div>
								<div class="col-xs-6" style="padding-left:0;">
									<div class="alert">
										<label class="radio-inline">
											<input type="radio" name="nav_style" value="4" ng-checked="activeItem.navStyle == 4">
											Path展开形式导航
										</label>
										<div class="path-example"></div>
									</div>
								</div>
								<div class="col-xs-6" style="padding-right:0;">
									<div class="alert">
										<label class="radio-inline">
											<input type="radio" name="nav_style" value="5">
											两侧展开形式导航
										</label>
										<div class="sides-example"></div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="selectNavStyle()">确定</button>
							</div>
						</div>
					</div>
				</div>
				<!--选择模块模态框-->
				<div class="modal fade" id="shop-modules-modal" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title">选择忽略模块</h4>
							</div>
							<div class="modal-body clearfix">
								<table class="table table-hover">
									<thead class="navbar-inner">
										<tr>
											<th style="width:70%;">标题</th>
											<th style="width:30%; text-align:right"></th>
										</tr>
									</thead>
									<tbody>
										<?php  if(is_array($modules)) { foreach($modules as $m) { ?>
										<tr>
											<td><?php  echo $m['title'];?>(<?php  echo $m['name'];?>)</td>
											<td>
												<a class="btn btn-default js-btn-select" ng-class="{'btn-primary' : activeItem.ignoreModules['<?php  echo $m['name'];?>']}" js-name="<?php  echo $m['name'];?>" js-title="<?php  echo $m['title'];?>" onclick="$(this).toggleClass('btn-primary');$(this).html($(this).hasClass('btn-primary') ? '取消' : '选取')">选取</a>
											</td>
										</tr>
										<?php  } } ?>
									</tbody>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		$(function(){
			require(['underscore', 'bootstrap.switch'], function() {
				$(":checkbox[name='status']").bootstrapSwitch();
				var activeItem = <?php echo !empty($page['params']) ? $page['params'] : 'null'?>;
				angular.module('quickMenuApp').value('config', {
					'activeItem' : activeItem,
				});
				angular.bootstrap(document, ['quickMenuApp']);
			});
			$('.app-content').click(function(){
				return false;
			});
		});
	</script>
<?php  } else if($do == 'uc') { ?>
	<ul class="nav nav-tabs">
		<li class="active"><a href="javascript:;">修改模板</a></li>
	</ul>

	<!--会员主页-->
	<form action="" method="post" class="form-horizontal">
	<input type="hidden" name="multiid" value="<?php  echo $multiid;?>" />
	<input type="hidden" name="id" value="<?php  echo $id;?>" />
	<div class="usercenter" ng-controller="MainCtrl" ng-cloak style = "display: flex;  justify-content:  flex-start ; min-width:1000px; flex-wrap: wrap;">
		<div class="app clearfix" style = "min-width: 360px; width:360px;">
			<input type="hidden" name="wapeditor[params]" id="wapeditor-params" value="{{submit.params}}" />
			<input type="hidden" name="wapeditor[html]" id="wapeditor-html" value="{{submit.html}}" />
			<input type="hidden" name="wapeditor[nav]" id="wapeditor-nav" value="{{activeMenus}}" />
			<div class="app-header"><div class="app-header-content"></div></div>
			<div class="app-preview">
				<div class="app-content" >
					<div class="app-usercenter" >
						<div class="inner">
							<div class="content">
							<!-- 此处为模板加载 -->
								<iframe src="<?php  echo murl('themes/default/deindex', array('styleid'=>$_GPC['styleid']), true, true)?>" frameborder="0" style="width:100%;height:565px"></iframe>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div  style = "width: 60%;">
				<div class="right">
					<div class="title">
						<div class="page">页面</div>
						<div class="zujian">组件</div>
					</div>
					<div  class="list1">
						<ul>
							<li class="active" data-source = "<?php  echo murl('themes/default/deindex', array('styleid'=>$_GPC['styleid']), true, true)?>">
								<div class="name">首页</div>
								<div class="set">
									<form class="form-horizontal">
										<div class="form-group">
											<label for="inputEmail1" class="col-sm-2 control-label">触发关键字</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="inputEmail1" placeholder="用户触发关键字，系统回复此页面的图文链接">
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail1" class="col-sm-2 control-label">封面</label>
											<div class="col-sm-6">
												<?php  echo tpl_form_field_image('backimage');?>
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail1" class="col-sm-2 control-label">页面描述</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="inputEmail1" placeholder="图文链接的描述">
											</div>
										</div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">背景图</label>
					                        <div class="col-sm-6">
					                        	<?php  echo tpl_form_field_image('backimage');?>
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">组件一</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="链接">
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">组件二</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="链接">
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">组件三</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题">
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">组件四</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题">
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">组件五</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题">
					                        </div>
					                   </div>
					                   <input type="submit" name="" value="提交">
					                   <input type="hidden" name="token" value="$_W['token']">
					                </form>
								</div>
							</li>
							<li class="" data-source ="<?php  echo murl('themes/default/yangpian', array('styleid'=>$_GPC['styleid']), true, true)?>">
								<div class="name">样片展示</div>
								<div class="set">
									<form class="form-horizontal">
					                    <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">标题一</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题一">
					                        </div>
					                    </div>
					                    <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">标题二</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题二">
					                        </div>
					                    </div>
					                    <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">图片一</label>
					                        <div class="col-sm-6">
					                        	<?php  echo tpl_form_field_image('image1');?>
					                        </div>
					                    </div>
					                    <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">图片二</label>
					                        <div class="col-sm-6">
					                        	<?php  echo tpl_form_field_image('image2');?>
					                        </div>
					                    </div>
					                    <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">图片三</label>
					                        <div class="col-sm-6">
					                        	<?php  echo tpl_form_field_image('image3');?>
					                        </div>
					                    </div>
					                    <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">图片四</label>
					                        <div class="col-sm-6">
					                        	<?php  echo tpl_form_field_image('image4');?>
					                        </div>
					                    </div>
					                </form>
								</div>
							</li>
							<li class="" data-source = "<?php  echo murl('themes/default/product', array('styleid'=>$_GPC['styleid']), true, true)?>">
								<div class="name">产品中心</div>
								<div class="set">
									<form class="form-horizontal">
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">产品一</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题">
						                       	<div class="col-sm-6">
						                        	<?php  echo tpl_form_field_image('product1');?>
						                        </div>
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">产品二</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题">
						                       	<div class="col-sm-6">
						                        	<?php  echo tpl_form_field_image('product2');?>
						                        </div>
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">产品三</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题">
						                       	<div class="col-sm-6">
						                        	<?php  echo tpl_form_field_image('product3');?>
						                        </div>
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">产品四</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题">
						                       	<div class="col-sm-6">
						                        	<?php  echo tpl_form_field_image('product4');?>
						                        </div>
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">产品五</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题">
						                       	<div class="col-sm-6">
						                        	<?php  echo tpl_form_field_image('product5');?>
						                        </div>
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">产品六</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题">
						                       	<div class="col-sm-6">
						                        	<?php  echo tpl_form_field_image('product6');?>
						                        </div>
					                        </div>
					                   </div>
					                </form>
								</div>
							</li>
							<li class="" data-source = "<?php  echo murl('themes/default/about', array('styleid'=>$_GPC['styleid']), true, true)?>">
								<div class="name">关于我们</div>
								<div class="set">
									<form class="form-horizontal">
										<div class="form-group">
					                        <div class="col-sm-10">
						                        <?php  echo tpl_ueditor('aboutus');?>
					                        </div>
					                   </div>
					                </form>
								</div>
							</li>

							<li class="" data-source = "<?php  echo murl('themes/default/xilie', array('styleid'=>$_GPC['styleid']), true, true)?>">
								<div class="name">样品系列列表一</div>
								<div class="set">
									<form class="form-horizontal">
										<div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">系列名称</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题">
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">添加左边图片列表</label>
					                        <div class="col-sm-10">
					                        	<?php  echo tpl_ueditor('leftimage1');?>
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">添加右边图片列表</label>
					                        <div class="col-sm-10">
					                        	<?php  echo tpl_ueditor('rightimage1_1');?>
					                        </div>
					                   </div>
					                </form>
								</div>
							</li>
							<li class="" data-source = "<?php  echo murl('themes/default/xilie', array('styleid'=>$_GPC['styleid']), true, true)?>">
								<div class="name">样品系列列表二</div>
								<div class="set">
									<form class="form-horizontal">
										<div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">系列名称</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题">
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">添加左边图片列表</label>
					                        <div class="col-sm-10">
					                        	<?php  echo tpl_ueditor('leftimage2');?>
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">添加右边图片列表</label>
					                        <div class="col-sm-10">
					                        	<?php  echo tpl_ueditor('rightimage2_1');?>
					                        </div>
					                   </div>
					                </form>
								</div>
							</li>
							<li class="" data-source = "<?php  echo murl('themes/default/xilie', array('styleid'=>$_GPC['styleid']), true, true)?>">
								<div class="name">样品系列列表三</div>
								<div class="set">
									<form class="form-horizontal">
										<div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">系列名称</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题">
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">添加左边图片列表</label>
					                        <div class="col-sm-10">
					                        	<?php  echo tpl_ueditor('leftimage3');?>
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">添加右边图片列表</label>
					                        <div class="col-sm-10">
					                        	<?php  echo tpl_ueditor('rightimage3_1');?>
					                        </div>
					                   </div>
					                </form>
								</div>
							</li>
							<li class="" data-source = "<?php  echo murl('themes/default/xilie', array('styleid'=>$_GPC['styleid']), true, true)?>">
								<div class="name">样品系列列表四</div>
								<div class="set">
									<form class="form-horizontal">
										<div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">系列名称</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="标题">
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">添加左边图片列表</label>
					                        <div class="col-sm-10">
					                        	<?php  echo tpl_ueditor('leftimage4');?>
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">添加右边图片列表</label>
					                        <div class="col-sm-10">
					                        	<?php  echo tpl_ueditor('rightimage4_1');?>
					                        </div>
					                   </div>
					                </form>
								</div>
							</li>
							<li class="" data-source = "<?php  echo murl('themes/default/product_detail', array('styleid'=>$_GPC['styleid']), true, true)?>">
								<div class="name">产品详情一</div>
								<div class="set">
									<form class="form-horizontal">
										<div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">产品名称</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="产品名称">
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">产品介绍</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="第一条">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="第二条">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="第三条">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="第四条">
					                        </div>
					                   </div>
					                </form>
								</div>
							</li>
							<li class="" data-source = "<?php  echo murl('themes/default/product_detail', array('styleid'=>$_GPC['styleid']), true, true)?>">
								<div class="name">产品详情二</div>
								<div class="set">
									<form class="form-horizontal">
										<div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">产品名称</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="产品名称">
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">产品介绍</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="第一条">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="第二条">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="第三条">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="第四条">
					                        </div>
					                   </div>
					                </form>
								</div>
							</li>
							<li class="" data-source = "<?php  echo murl('themes/default/product_detail', array('styleid'=>$_GPC['styleid']), true, true)?>">
								<div class="name">产品详情三</div>
								<div class="set">
									<form class="form-horizontal">
										<div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">产品名称</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="产品名称">
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">产品介绍</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="第一条">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="第二条">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="第三条">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="第四条">
					                        </div>
					                   </div>
					                </form>
								</div>
							</li>
							<li class="" data-source = "<?php  echo murl('themes/default/product_detail', array('styleid'=>$_GPC['styleid']), true, true)?>">
								<div class="name">产品详情四</div>
								<div class="set">
									<form class="form-horizontal">
										<div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">产品名称</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="产品名称">
					                        </div>
					                   </div>
					                   <div class="form-group">
					                        <label for="inputEmail1" class="col-sm-2 control-label">产品介绍</label>
					                        <div class="col-sm-10">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="第一条">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="第二条">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="第三条">
					                        	<input type="text" class="form-control" id="inputEmail1" placeholder="第四条">
					                        </div>
					                   </div>
					                </form>
								</div>
							</li>
						</ul>
					</div>
				</div>
				
                    <!-- <?php  if(is_array($site_navs)) { foreach($site_navs as $init) { ?>
    				  <div class="form-group">
    					<label class="col-sm-2 control-label"><?php  echo $init['name'];?></label>
    					<div class="col-sm-10">
    					   <input type="text" class="form-control" placeholder="<?php  echo $init['name'];?>">
    					</div>
    				  </div>
                    <?php  } } ?>
				  <div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
					  <button type="submit" class="btn btn-default">Sign in</button>
					</div>
				  </div> -->
			</div>

	</div>

	</form>
	<?php  echo tpl_ueditor('')?>
	<script type="text/javascript">
		$(function(){
			$('.app-preview').click(function(){
				return false;
			});
			require(['underscore', 'bootstrap', 'jquery.ui', 'hammer', 'datetimepicker'], function(_) {
				var activeModules = <?php echo !empty($page['params']) ? $page['params'] : 'null'?>;
				var activeMenus = <?php echo !empty($navs) ? json_encode($navs) : 'null'?>;
				var siteroot = "<?php  echo $_W['siteroot']?>";
				angular.module('userCenterApp').value('config',{ 
					'activeModules' : activeModules,
					'activeMenus' : activeMenus,
					'siteroot' : siteroot
				});
				angular.bootstrap(document, ['userCenterApp']);
			});
		});
		function onclickiu(){
			window.location.href="   ";
		}
		// 切换
		$(".list1 .name").click(function() {
			var li = $(this).parent('li');
			var url = li.attr('data-source');
			$('.content iframe').attr('src', url);
			li.addClass('active');
			li.siblings('li').removeClass('active');
			// li.find('.set').css({"display":"block"});
			// li.siblings('li').find('.set').css({"display":"none"});
		});

		// 添加
		var pd1 = $("#product-detail-1");
		var pd2 = $("#product-detail-2");
		var pd3 = $("#product-detail-3");
		var pd4 = $("#product-detail-4");

		var ap1 = $("#addproduct1");
		var ap2 = $("#addproduct2");
		var ap3 = $("#addproduct3");
		var ap4 = $("#addproduct4");

		add(ap1,pd1);
		add(ap2,pd2);
		add(ap3,pd3);
		add(ap4,pd4);

		function add(e1,e2){

			var count = 4;
			e1.click(function() {
				count++;
				var html = '<div><label for="">第' + count + '条:</label><input type="text">	</div>';
				e2.append(html);
			});
		}

		// 折叠
		$(".title1").each(function(index, el) {
			$(this).click(function() {
				// $(this).siblings('.addimg').animate({height: "auto"}, 500);
				$(this).siblings('.addimg').height("auto");
				// var aa = $(this).parent('div').siblings('div').find('.addimg');
				// aa.animate({height: "0", overflow: "hidden"}, 500);
				$(this).parent('div').siblings('div').find('.addimg').height(0).css({"overflow":"hidden"});
			});
		});
	</script>
<?php  } ?>
<div class="shop-preview col-xs-12 col-sm-9 col-lg-10" style="position:fixed;top:85%;left:17%;width:20%;">
	<div class="text-center alert alert-warning">
		<a class="btn btn-primary js-editor-submit" href="javascript:;">保存</a>
		<a class="btn btn-primary js-editor-submit" href="javascript:;">修改</a>
	</div>
</div>
<?php (!empty($this) && $this instanceof WeModuleSite || 0) ? (include $this->template("Common/footer", TEMPLATE_INCLUDEPATH)) : (include template("Common/footer", TEMPLATE_INCLUDEPATH));?>

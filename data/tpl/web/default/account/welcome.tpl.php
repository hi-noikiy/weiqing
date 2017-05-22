<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 0) ? (include $this->template('common/header-base', TEMPLATE_INCLUDEPATH)) : (include template('common/header-base', TEMPLATE_INCLUDEPATH));?>
<div class="home">
	<div class="content clearfix">
		<div id="head">
			<div class="logo" <?php  if(!empty($copyright['flogo'])) { ?>style="background:url('<?php  echo tomedia($copyright['flogo']);?>') no-repeat;"<?php  } ?>></div>
			<div class="advertisement">
				<?php  if(!empty($copyright['notice'])) { ?>
					<?php  echo $copyright['notice'];?>
				<?php  } else { ?>
					再小的品牌，也有自己的微擎
				<?php  } ?>
			</div>
			<div class="btns">
				<a href="<?php  echo url('user/login');?>" class="btn btn-primary btn-lg"><i class="fa fa-user"></i> 立即登录</a>
				<?php  if(!empty($settings['register']['open'])) { ?>
				<a href="<?php  echo url('user/register');?>" class="btn btn-primary btn-lg"><i class="fa fa-user-plus"></i> 我要加入</a>
				<?php  } ?>
			</div>
		</div>
		<div id="banner" class="carousel slide" data-ride="carousel">
			<div class="carousel-indicators"><i class="fa fa-angle-double-down"></i></div>
			<div class="carousel-inner" role="listbox">
				<?php  if(!empty($copyright['slides'])) { ?>
					<?php  $i = 1;?>
					<?php  if(is_array($copyright['slides'])) { foreach($copyright['slides'] as $slide) { ?>
						<div class="item <?php  if($i == 1) { ?>active<?php  } ?>" style="background-image:url(<?php  echo tomedia($slide);?>);"></div>
						<?php  $i++;?>
					<?php  } } ?>
				<?php  } ?>
			</div>
		</div>

		<div class="con container">
			<div class="panel panel-default">
				<h4>系统功能介绍</h4>
				<div class="panel-body">
					<div class="row system-info">
						<div class="col-xs-3">
							<div class="icon"><i class="fa fa-tablet"></i></div>
							<h6>微网站、微场景</h6>
						</div>
						<div class="col-xs-3">
							<div class="icon"><i class="fa fa-bullseye"></i></div>
							<h6>微信营销解决方案</h6>
						</div>
						<div class="col-xs-3">
							<div class="icon"><i class="fa fa-life-ring"></i></div>
							<h6>微信账号集中一站管理</h6>
						</div>
						<div class="col-xs-3">
							<div class="icon"><i class="fa fa-sitemap"></i></div>
							<h6>强大的商家运营管理平台</h6>
						</div>
					</div>
				</div>
			</div>
			<?php  if(!empty($news) || !empty($notices)) { ?>
				<div class="panel panel-default">
					<h4>系统公告</h4>
					<div class="panel-body">
						<div class="row system-announcement">
							<div class="col-xs-6">
								<ul class="list-unstyled">
									<?php  if(is_array($news)) { foreach($news as $new) { ?>
										<li><span class="style-1">新闻</span><a href="<?php  echo url('article/news-show/detail', array('id' => $new['id']));?>"><?php  echo $new['title'];?></a></li>
									<?php  } } ?>
								</ul>
							</div>
							<div class="col-xs-6">
								<ul class="list-unstyled">
									<?php  if(is_array($notices)) { foreach($notices as $notice) { ?>
										<li><span class="style-2">公告</span><a href="<?php  echo url('article/notice-show/detail', array('id' => $notice['id']));?>"><?php  echo $notice['title'];?></a></li>
									<?php  } } ?>
								</ul>
							</div>
						</div>
					</div>
				</div>
			<?php  } ?>
			<div class="panel panel-default">
				<h4>功能模块介绍</h4>
				<div class="panel-body">
					<div class="row module-info">
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/01.png">
							</div>
							<h6>微现场</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/02.png">
							</div>
							<h6>微旅游</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/03.png">
							</div>
							<h6>微外卖</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/04.png">
							</div>
							<h6>微商城</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/05.png">
							</div>
							<h6>微汽车</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/06.png">
							</div>
							<h6>微房产</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/08.png">
							</div>
							<h6>微点菜</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/09.png">
							</div>
							<h6>微喜帖</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/11.png">
							</div>
							<h6>微网站</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/12.png">
							</div>
							<h6>微投票</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/13.png">
							</div>
							<h6>微信自定义菜单</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/14.png">
							</div>
							<h6>微信会员卡</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/15.png">
							</div>
							<h6>微信营销活动</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/17.png">
							</div>
							<h6>微信优惠券活动</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/18.png">
							</div>
							<h6>微信LBS位置回复</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/19.png">
							</div>
							<h6>微相册</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/20.png">
							</div>
							<h6>微订单</h6>
						</div>
						<div class="col-xs-2">
							<div class="icon">
								<img src="resource/images/module/21.png">
							</div>
							<h6>微统计</h6>
						</div>
					</div>

				</div>
			</div>
			<div class="contact panel panel-default">
				<h4>联系我们</h4>
				<div class="panel-body">
					<div class="map col-xs-5" style="height:150px;">
						<div class="img" style="width:100%; height:150px; border:#ccc solid 1px;" id="baidumap"></div>
					</div>
					<div class="info col-xs-7">
						<p>联系人：<?php  echo $copyright['person'];?></p>
						<p>Q&nbsp;&nbsp;&nbsp;&nbsp; Q：<?php  echo $copyright['qq'];?></p>
						<p>手&nbsp;&nbsp;&nbsp;机：<?php  echo $copyright['phone'];?></p>
						<p>公&nbsp;&nbsp;&nbsp;司：<?php  echo $copyright['company'];?></p>
						<p>地&nbsp;&nbsp;&nbsp;址：<?php  echo $copyright['address'];?></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="center-block footer" role="footer">
		<div class="text-center">
			<?php  if(empty($copyright['footerright'])) { ?><a href="http://www.we7.cc">关于微擎</a>&nbsp;&nbsp;<a href="http://bbs.we7.cc">微擎论坛</a>&nbsp;&nbsp;<a href="http://wpa.b.qq.com/cgi/wpa.php?ln=1&key=XzkzODAwMzEzOV8xNzEwOTZfNDAwMDgyODUwMl8yXw">联系客服</a><?php  } else { ?><?php  echo $copyright['footerright'];?><?php  } ?> &nbsp; &nbsp; <?php  if(!empty($copyright['statcode'])) { ?><?php  echo $copyright['statcode'];?><?php  } ?>
		</div>
		<div class="text-center">
			<?php  if(empty($copyright['footerleft'])) { ?>Powered by <a href="http://www.we7.cc"><b>微擎</b></a> v<?php echo IMS_VERSION;?> &copy; 2014-2015 <a href="http://www.we7.cc">www.we7.cc</a><?php  } else { ?><?php  echo $copyright['footerleft'];?><?php  } ?>
		</div>
	</div>
</div>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>
<script>
	require(['bootstrap']);
	var bmap = {
		'option' : {
			'lock' : false,
			'container' : 'baidumap',
			'infoWindow' : {'width' : 250, 'height' : 100, 'title' : ''},
			'point' : {'lng' : '<?php  echo $copyright['baidumap']['lng'];?>', 'lat' : '<?php  echo $copyright['baidumap']['lat'];?>'}
		},
		'init' : function(option) {
			var $this = this;
			$this.option = $.extend({},$this.option,option);
			$this.option.defaultPoint = new BMap.Point($this.option.point.lng, $this.option.point.lat);
			$this.bgeo = new BMap.Geocoder();
			$this.bmap = new BMap.Map($this.option.container);
			$this.bmap.centerAndZoom($this.option.defaultPoint, 15);
			$this.bmap.enableScrollWheelZoom();
			$this.bmap.enableDragging();
			$this.bmap.enableContinuousZoom();
			$this.bmap.addControl(new BMap.NavigationControl());
			$this.bmap.addControl(new BMap.OverviewMapControl());
			//添加标注
			$this.marker = new BMap.Marker($this.option.defaultPoint);
			$this.marker.enableDragging();
			$this.bmap.addOverlay($this.marker);
			$this.marker.setAnimation(BMAP_ANIMATION_BOUNCE);
		},
		'setMarkerCenter' : function() {
			var $this = this;
			var center = $this.bmap.getCenter();
			$this.marker.setPosition(new BMap.Point(center.lng, center.lat));
			$this.showPointValue();
			$this.showAddress();
		}
	};
	$(function(){
		var option = {};
		option = {'point' : {'lng' : '<?php  echo $copyright['baidumap']['lng'];?>', 'lat' : '<?php  echo $copyright['baidumap']['lat'];?>'}}
		bmap.init(option);

		//banner
		$('#banner, #banner .item').height($(window).height());
	});
</script>
</body>
</html>
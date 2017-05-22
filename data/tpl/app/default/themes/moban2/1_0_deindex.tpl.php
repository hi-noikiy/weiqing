<?php defined('IN_IA') or exit('Access Denied');?><!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
	<title>首页</title>
	<link rel="stylesheet" href="resource/css/bootstrap.min.css">
	<link rel="stylesheet" href="resource/css/common.min.css">
	
</head>
<body style="padding-bottom: 0px;">
	<div class="container container-fill">
		<style>
			body{
			font: ;
			color:;
			padding:0;
			margin:0;
			background-image:url('resource/images/53bbba9f94ae8.jpg');background-size:cover;background-repeat:repeat-x;
			background-color:#fbf5df;
				}
			a{color:; text-decoration:none;}
				.box{width:100%; padding:0 10% 0 30%; margin-top:80%;}
			.box .box-item{float:left; display:inline-block; width:48%; margin:1%; padding:0 10px; text-align:center; text-decoration:none;outline:none; height:60px; line-height:60px; color:#FFF; background:rgba(163, 143, 92, 0.7);}
			.box .box-item span{color:; display:block; font-size:14px; width:100%; height:60px; line-height:60px; overflow:hidden;}
		</style>
		<div class="box clearfix">
			<?php  if(is_array($navs)) { foreach($navs as $index => $row) { ?>
				<?php  if($row['styleid']==$_GPC['styleid']) { ?>
					<?php  if($index==0) { ?>
						<a href="<?php  echo $row['url'];?>" class="box-item" style="background-color: rgba(255, 152, 0, 0.49);">
							<span style="color:#f3f3f3;" title="<?php  echo $row['name'];?>"><?php  echo $row['name'];?></span>
						</a>
					<?php  } ?>
					<?php  if($index==1) { ?>
						<a href="<?php  echo $row['url'];?>" class="box-item" style="background-color: rgba(0, 47, 255, 0.42);">
							<span style="color:#f3f3f3;" title="<?php  echo $row['name'];?>"><?php  echo $row['name'];?></span>
						</a>
					<?php  } ?>
					<?php  if($index==2) { ?>
						<a href="<?php  echo $row['url'];?>" class="box-item" style="width: 98%;background-color: rgba(255, 87, 34, 0.66)">
							<span style="color:#f3f3f3;" title="<?php  echo $row['name'];?>"><?php  echo $row['name'];?></span>
						</a>
					<?php  } ?>
					<?php  if($index==3) { ?>
						<a href="<?php  echo $row['url'];?>" class="box-item" style="background-color: rgba(0, 150, 136, 0.56);">
							<span style="color:#ffffff;" title="<?php  echo $row['name'];?>"><?php  echo $row['name'];?></span>
						</a>
					<?php  } ?>
					<?php  if($index==4) { ?>
						<a href="<?php  echo $row['url'];?>" class="box-item" style="background-color: rgba(96, 125, 139, 0.58);">
							<span style="color:#efefef;" title="<?php  echo $row['name'];?>"><?php  echo $row['name'];?></span>
						</a>
					<?php  } ?>
				<?php  } ?>
			<?php  } } ?>
		</div>
		<div class="text-center footer" style="margin:10px 0; width:100%; text-align:center; word-break:break-all;"></div>
	</div>
	<style>
		h5{color:#555;}
	</style>
</body>

</html>
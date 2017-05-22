<?php
/**
 * 微网站模块定义
 *
 * @author 红途小莜
 * @url http://bbs.we7.cc/
 */
defined('IN_IA') or exit('Access Denied');

class Htxy_swebModule extends WeModule {
	public $site = "htxy_sweb_site";
	public $article = "htxy_sweb_article";
	public $cate = "htxy_sweb_cate";
	public function fieldsFormDisplay($rid = 0) {
	global $_W,$_GPC;
	load()->func('tpl');
	$id=intval($_GPC['id']);
	if(!empty($id)){
		// $sites=pdo_fetch("SELECT * FROM ".tablename($this->site)."WHERE id=:id and uniacid=:uniacid",array(':id'=>$id,':uniacid'=>$_W['uniacid']));
		// 如果为智诚自己的公众号的话
			if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
				// 若为公众号操作员只能查看自己的项目
				if($_W['role']=="operator"){
					$sites=pdo_fetch("SELECT * FROM ".tablename($this->site)."WHERE id=:id and uniacid=:uniacid and uid=:uid",array(':id'=>$id,':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
				
				}else{
					$sites=pdo_fetch("SELECT * FROM ".tablename($this->site)."WHERE id=:id and uniacid=:uniacid",array(':id'=>$id,':uniacid'=>$_W['uniacid']));

				}

			}else{
				$sites=pdo_fetch("SELECT * FROM ".tablename($this->site)."WHERE id=:id and uniacid=:uniacid",array(':id'=>$id,':uniacid'=>$_W['uniacid']));
			}

	}
	include $this->template('sweb_list');
	}

	public function fieldsFormValidate($rid = 0) {
		//规则编辑保存时，要进行的数据验证，返回空串表示验证无误，返回其他字符串将呈现为错误提示。这里 $rid 为对应的规则编号，新增时为 0
        return true;
		
	}

	public function fieldsFormSubmit($rid) {
		//规则验证无误保存入库时执行，这里应该进行自定义字段的保存。这里 $rid 为对应的规则编号
	global $_W,$_GPC;
	$id=$_GPC['id'];
		$lenth=strlen($_GPC['sitename']);
		if($lenth>30){
			echo "<script>alert('栏目标题过长请精简添加');history.go(-1)</script>";
		}
		$sh_ti=strlen($_GPC['share_title']);
		if($lenth>30){
			echo "<script>alert('分享标题过长请精简添加');history.go(-1)</script>";
		}
		$data['uniacid']=intval($_W['uniacid']);
		$data['rid']=intval($rid);
		$data['sitename']=trim($_GPC['sitename']);
		$data['uid']=intval($_W['uid']);
		$data['is_show']=intval($_GPC['is_show']);
		$data['is_border']=intval($_GPC['is_border']);
		$data['store_address']=trim($_GPC['store_address']);
		$data['store_phone']=trim($_GPC['store_phone']);
		$data['staff']=trim($_GPC['staff']);
		$data['logo']=trim($_GPC['logo']);
		$data['back_music']=trim($_GPC['back_music']);
		$data['lng']=trim($_GPC['map']['lng']);
		$data['lat']=trim($_GPC['map']['lat']);
		$data['share_title']=trim($_GPC['share_title']);
		$data['share_pic']=trim($_GPC['share_pic']);
		$data['share_desc']=trim($_GPC['share_desc']);
		$data['create_time']=date("Y-m-d H:i:s");
		$url=$this->createWebUrl('sweb_man');

	if(empty($id)){
		// 添加操作
		$result=pdo_insert($this->site,$data);
		if($result){
			message('项目添加成功',$url,"success");
		}else{
			message('项目添加失败',$url,"error");
		}	
	}else{
		// 修改操作
		$param=array('id'=>$id,'uniacid'=>$_W['uniacid']);
		$result=pdo_update($this->site,$data,$param);
		if($result){
			message('项目编辑成功',$url,"success");
		}else{
			message('项目编辑失败',$url,"error");
		}	

	}
		
		
	}

	public function ruleDeleted($rid) {
		//删除规则时调用，这里 $rid 为对应的规则编号
	}

	public function settingsDisplay($settings) {
		global $_W, $_GPC;
		//点击模块设置时将调用此方法呈现模块设置页面，$settings 为模块设置参数, 结构为数组。这个参数系统针对不同公众账号独立保存。
		//在此呈现页面中自行处理post请求并保存设置参数（通过使用$this->saveSettings()来实现）
		if(checksubmit()) {
			//字段验证, 并获得正确的数据$dat
			$this->saveSettings($dat);
		}
		//这里来展示设置项表单
		include $this->template('setting');
	}

}
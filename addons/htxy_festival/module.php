<?php
/**
 * 过节喽模块定义
 *
 * @author 红途小莜
 * @url http://bbs.we7.cc/
 */
defined('IN_IA') or exit('Access Denied');

class Htxy_festivalModule extends WeModule {
	public $active="htxy_festival_active";
	public function fieldsFormDisplay($rid = 0) {
		//要嵌入规则编辑页的自定义内容，这里 $rid 为对应的规则编号，新增时为 0
		global $_W,$_GPC;
		load()->func('tpl');
		$id=intval($_GPC['id']);
		if(!empty($id)){
			// 如果为智诚自己的公众号的话
			if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
				// 若为公众号操作员只能查看自己的项目
				if($_W['role']=="operator"){
					$sites=pdo_fetch("SELECT * FROM ".tablename($this->active)."WHERE id=:id and uniacid=:uniacid and uid=:uid",array(':id'=>$id,':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
					$sites['active_img']=explode(',',$sites['active_img']);
				}else{
					$sites=pdo_fetch("SELECT * FROM ".tablename($this->active)."WHERE id=:id and uniacid=:uniacid",array(':id'=>$id,':uniacid'=>$_W['uniacid']));
					$sites['active_img']=explode(',',$sites['active_img']);
				}

			}else{
				$sites=pdo_fetch("SELECT * FROM ".tablename($this->active)."WHERE id=:id and uniacid=:uniacid",array(':id'=>$id,':uniacid'=>$_W['uniacid']));
				$sites['active_img']=explode(',',$sites['active_img']);


			}

		}
		// echo "<pre>";
		// var_dump($sites);die;
	include $this->template('festival_final');
	}

	public function fieldsFormValidate($rid = 0) {
		//规则编辑保存时，要进行的数据验证，返回空串表示验证无误，返回其他字符串将呈现为错误提示。这里 $rid 为对应的规则编号，新增时为 0
		return true;
	}

	public function fieldsFormSubmit($rid) {
		//规则验证无误保存入库时执行，这里应该进行自定义字段的保存。这里 $rid 为对应的规则编号
		global $_W,$_GPC;
		load()->func('tpl');
		$id=intval($_GPC['id']);

		$active_imgs=$_GPC['active_img'];
		$active_img=implode(',',$active_imgs);
		$data['uniacid']=$_W['uniacid'];
		$data['uid']=$_W['uid'];
		$data['rid']=$rid;
		$data['active_img']=trim($active_img);
		$data['active_name']=trim($_GPC['active_name']);
		$data['light_pic']=trim($_GPC['light_pic']);
		$data['light_num']=intval($_GPC['light_num']);
		$data['active_start']=trim($_GPC['range']['start']);
		$data['active_end']=trim($_GPC['range']['end']);
		$data['lng']=trim($_GPC['map']['lng']);
		$data['lat']=trim($_GPC['map']['lat']);
		$data['top_back']=trim($_GPC['top_back']);
		$data['shop_title']=trim($_GPC['shop_title']);
		$data['shop_phone']=trim($_GPC['shop_phone']);
		$data['shop_staff']=trim($_GPC['shop_staff']);
		$data['back_music']=trim($_GPC['back_music']);
		$data['share_title']=trim($_GPC['share_title']);
		$data['share_pic']=trim($_GPC['share_pic']);
		$data['share_desc']=trim($_GPC['share_desc']);
		$data['create_time']=date('Y-m-d H:i:s');

		$url=$this->createWebUrl('active');

	if(empty($id)){
		// 添加操作
		$result=pdo_insert($this->active,$data);
		if($result){
			message('项目添加成功',$url,"success");
		}else{
			message('项目添加失败',$url,"error");
		}	
	}else{
		// 修改操作
		$param=array('id'=>$id,'uniacid'=>$_W['uniacid']);
		$result=pdo_update($this->active,$data,$param);
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


}
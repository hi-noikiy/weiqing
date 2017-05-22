<?php
/**
 * 我在现场模块定义
 *
 * @author 红途小莜
 * @url http://bbs.we7.cc/
 */
defined('IN_IA') or exit('Access Denied');

class Htxy_sceneModule extends WeModule {
	public $scene_pro="htxy_scene_pro";
	public $scene_member="htxy_scene_members";
	public function fieldsFormDisplay($rid = 0) {
		//要嵌入规则编辑页的自定义内容，这里 $rid 为对应的规则编号，新增时为 0
		global $_W,$_GPC;
		$id=intval($_GPC['id']);
		if(!empty($id)){
			if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
				// 若为公众号操作员只能查看自己的项目
				if($_W['role']=="operator"){
					$articles=pdo_fetch("SELECT * FROM ".tablename($this->scene_pro)."WHERE id=:id and uniacid=:uniacid and uid=:uid",array(':id'=>$id,':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
					$articles["scene_cont"]=html_entity_decode($articles["scene_cont"]);
				}else{
					$articles=pdo_fetch("SELECT * FROM ".tablename($this->scene_pro)."WHERE id=:id and uniacid=:uniacid",array(':id'=>$id,':uniacid'=>$_W['uniacid']));
					$articles["scene_cont"]=html_entity_decode($articles["scene_cont"]);
				}

			}else{
				$articles=pdo_fetch("SELECT * FROM ".tablename($this->scene_pro)."WHERE id=:id and uniacid=:uniacid",array(':id'=>$id,':uniacid'=>$_W['uniacid']));
				$articles["scene_cont"]=html_entity_decode($articles["scene_cont"]);
			}
		}
		// echo "<pre>";
		// var_dump($articles);die;
		include $this->template('scene_add');
	}

	public function fieldsFormValidate($rid = 0) {
		//规则编辑保存时，要进行的数据验证，返回空串表示验证无误，返回其他字符串将呈现为错误提示。这里 $rid 为对应的规则编号，新增时为 0
		return true;
	}

	public function fieldsFormSubmit($rid) {
		//规则验证无误保存入库时执行，这里应该进行自定义字段的保存。这里 $rid 为对应的规则编号
		global $_W,$_GPC;
			$data['scene_name']=trim($_GPC['scene_name']);
			$data['scene_logo']=trim(htmlentities($_GPC['scene_logo']));
			$data['scene_cont']=trim(htmlentities($_GPC['scene_cont']));
			$data['back_music']=trim(htmlentities($_GPC['back_music']));
			$data['share_title']=trim($_GPC['share_title']);
			$data['share_pic']=trim(htmlentities($_GPC['share_pic']));
			$data['share_desc']=trim($_GPC['share_desc']);
			$data['is_show']=intval($_GPC['is_show']);
			$data['rid']=intval($rid);
			$data['uniacid']=intval($_W['uniacid']);
			$data['uid']=intval($_W['uid']);
			$data['create_time']=date("Y-m-d H:i:s");
			$str=strlen($_GPC['scene_name']);
			// 完成编辑后的跳转地址
			$url=$this->createWebUrl('SenceEdit');
			if($str>30){
				message('项目标题过长请删减',"","error");
			}
			$id=intval($_GPC['id']);
		if(!empty($id)){
			if(checksubmit('submit')){ 
				$result = pdo_update($this->scene_pro, $data, array('id' =>$_GPC['id']));
				if (!empty($result)) {
				    message('更新成功',$url,"success");
				}
			}
			
		}else{
			if(checksubmit('submit')){ 
				$res=pdo_insert($this->scene_pro, $data);
				if($res){
					message('添加成功',$url,"success");
				}
			}
			
		}
	}

	public function ruleDeleted($rid) {
		//删除规则时调用，这里 $rid 为对应的规则编号
	}


}
/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.7.23-log : Database - act6
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`act6` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `act6`;

SET FOREIGN_KEY_CHECKS=0;
/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values 
('2',1,'E:\\ws_iot\\activiti-demo6\\target\\classes\\processes\\vacation.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xsi:schemaLocation=\"http://www.omg.org/spec/BPMN/20100524/MODEL BPMN20.xsd\" id=\"m1515296568080\" exporter=\"camunda modeler\" exporterVersion=\"2.7.1\" name=\"\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"vacationProcess\" name=\"请假流程\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\">\n      <outgoing>flow1</outgoing>\n    </startEvent>\n    <userTask id=\"usertask1\" activiti:candidateGroups=\"empGroup\" activiti:exclusive=\"true\" name=\"填写申请\">\n      <incoming>flow1</incoming>\n      <outgoing>flow2</outgoing>\n    </userTask>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\">\n      <incoming>flow2</incoming>\n      <outgoing>flow3</outgoing>\n      <outgoing>flow5</outgoing>\n    </exclusiveGateway>\n    <userTask id=\"usertask2\" activiti:candidateGroups=\"manageGroup\" activiti:exclusive=\"true\" name=\"总监审批\">\n      <incoming>flow3</incoming>\n      <outgoing>flow4</outgoing>\n    </userTask>\n    <userTask id=\"usertask3\" activiti:candidateGroups=\"dirGroup\" activiti:exclusive=\"true\" name=\"经理审批\">\n      <incoming>flow5</incoming>\n      <outgoing>flow6</outgoing>\n    </userTask>\n    <endEvent id=\"endevent1\" name=\"End\">\n      <incoming>flow4</incoming>\n      <incoming>flow6</incoming>\n    </endEvent>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"/>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"exclusivegateway1\"/>\n    <sequenceFlow id=\"flow3\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\n			\n				${days <= 3}\n            \n		]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow4\" sourceRef=\"usertask2\" targetRef=\"endevent1\"/>\n    <sequenceFlow id=\"flow5\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\n			\n				${days > 3}\n            \n		]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" sourceRef=\"usertask3\" targetRef=\"endevent1\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"vacationProcess\">\n      <bpmndi:BPMNShape id=\"Shape-startevent1\" bpmnElement=\"startevent1\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"80.0\" y=\"150.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Shape-usertask1\" bpmnElement=\"usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"180.0\" y=\"140.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Shape-exclusivegateway1\" bpmnElement=\"exclusivegateway1\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"350.0\" y=\"147.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Shape-usertask2\" bpmnElement=\"usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"80.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Shape-usertask3\" bpmnElement=\"usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"210.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Shape-endevent1\" bpmnElement=\"endevent1\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"660.0\" y=\"150.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow1\" bpmnElement=\"flow1\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"112.0\" y=\"166.0\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"180.0\" y=\"167.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow2\" bpmnElement=\"flow2\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"285.0\" y=\"167.5\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"350.0\" y=\"163.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow3\" bpmnElement=\"flow3\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"370.0\" y=\"151.0\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"370.0\" y=\"107.0\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"460.0\" y=\"107.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow4\" bpmnElement=\"flow4\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"565.0\" y=\"107.5\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"660.0\" y=\"166.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow5\" bpmnElement=\"flow5\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"370.0\" y=\"175.0\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"370.0\" y=\"237.0\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"460.0\" y=\"237.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow6\" bpmnElement=\"flow6\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"565.0\" y=\"237.5\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"660.0\" y=\"166.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('3',1,'E:\\ws_iot\\activiti-demo6\\target\\classes\\processes\\vacation.vacationProcess.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0\"*^^\0\0�IDATx���l\\՝/�Q�VUU�VEU���n�V�j��jվj�\rZm���M���8NM���\'@)E�-��ҨYT�X(jw��W^S��/��4Y i!	&NR(1���w~�u4qlǎ����~\Z{�8v��;�;g�=g�,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��,��޾}��M�6e�֭�:::TTggg�q�ƁT��\0\05����+�������U�޽{�\r6� �\n\0P��+�6v\0���跧\0�@u2�b�=\0�\"X	��/\0��[U�owg۟�7����c_�}©�\00��vg��.�^x�*�m��\00c���-�<)�֮-�T�\0`�ߗ�Έ�7�	��/\0��	��;�G��M@~\0�_%�\0L���;�~c��*�\0̘��#���&�\n�\0\03&����b����\'yH��6U�\0�1�7��g�?)��}©�\00��o__���U\'yH��6U�\0��7Vp���F�۬�&�\0L���חuo[��z����`�c�z��_\0�i~O�۫X�\0�1�w,������/\0��	��|K`~\0�M�U�/\0��2����r�2�W�\0h��嵿T*],�\n�\0\0�~k�p=�¯�\00�����,�\n�\0@hoo?S+LJ�=��!�_�\0h��;��jP¯�\0L����O�`6�%N�(���T*�8{���q¯�\0L���K!��i�=!�j����a�^ۅ_\0�^����h�����r�֡�w��������/\0P��֞p���P��+�\n�\0@�I����~�%&��+�\0S,�S\0~NK�¯�\0�~�Ruj	�W�~����J��ZB�~�_\0h���z�\\�SK��Lu&�@����b�Z��ï~�Y���T-!�*�\0�!�Y�`�約�_\0h����s���_\0���̙���ZB�U�/\0�x�J����Q-!�*�\0f�b����R�OK�J��o���KR��%�_%�@3��o�ڭ%�_��Z�f��\03U�\\�/��W����������/��1��R�ܴhѢ?����N���T*=�%�_��z衇\"��Á�b�t�B�X���\0f������~��c~S��|\n��RN�I:^:,\0�XyH�/ZB�U�_��ũ~�������8n.\\�Q{5\0L���F\\��%�_5��bp�\\�5.M5�jG��ٳg�m���o�J�+����?�Ykk���1���߉�t�_����A��J�KZ�>֭[\'`��y~���)\0o�����ұ�&�~�^\0\r$�f�%��D}tuu���2�v�ڵ#���\ZW_K�wK��T�̝;�#�\0\0�b餜\n�h��X�~�-6lسg��ـ�����H��z���J��t�u�A��T7���r4\0@�EOT\\��%�+��;::z��u�P�_��;T[[�\'+�ʿ�c�@|�Ꙗ���#\0�$�+-�JG��W\n�_H!xc�#���_\n���2\00��I��ꠖ�)sF:/O�R>m�����[[[?�i\0�����8�j	�zmmm*��K����j{����gj\0��tr�+&���X�͛���r����ٛ�TOU*��Z�Y���}����6m�bNN�4Fuvvf7nH��^Zq�M,ת%����/���X>>�`\nſ4=!PS|���2sq6^�ݻ7�i�&��f�N��Rui	��H���t̾��׽�~x������&$z|�������cW��R���0�\n�?�aK�z��~������3w�QN�N���+˵L_---��7��x~7�ɒ���D�0��f�F�$�\\K��P,Ϗ��w#���/�P����vw���{�-��:V�u�\'�\n��E�4�N�k	�Yb�C\n����!b|pO���Z8��{����˲��b��*�NK\'�ñҔ���+.�Kxe\\ ��~%.�K���:�����-�<)�֮-�T��}3UV,�G���üy��2��7�L˧N{,�R�2 ��2|���wF��M@~<���}�{.��3�<�&M�\'�(��O��{cQ�X\\Cˀ�;lm�h1��6U�m������&�e���\'��K���/1,��Xf9�[nԿy���g��󆘧<U��O�UU�����\Z���)dY���k�>�r���+V\\{�YzB�=ѭ���5�\\�-[����7޸{ɒ%_�b¯��H�w�M&e���)W��/�{9�^>�A�ǰ���lH���;j������%���gy�x�7Z~򓟼s�UWe�]vYv��fO<�D��ݝ:t(�>�0��O?�=����ŋ�+��b`�ҥӓ}�V�m���F\n��M@~�I���M�\Z?],�n�・R�<o*����M�{M\n��xB��IOpK���������+�+Vd/��ⱐ;V[�l�V�\\�]|��ٵ�^�W���w�c+G��M@~�Q�t�,=��0ZZZJ�r�������-�O�n���/����O������w�}����ݻw����|��g���/���O\n�)HL��=�\r&z{����ē����g���/gK�,�.���=���&����b����\'yH��6U��f��:\0��F�P8+k�j>>��R��>gΜ��߈��h��ؘ�<������;l�{�1��QK�.\Z�cX�7�����K�-[��u�]�;３�B�����/�0���ߨW������	���4\r��?wt�``s���H\n����]�S[,/�g�9�����ǩ�o�0�����ի�z�Z�f��k��z���M����{�m�M�	ɪU���w���A�R}}ٶ�W�<�!��T�w�ߡ?�8�L�&��0ٗ*.Fې���ڗ�����g8߁�![�n�Iz�ײNZ�l��1�1�!zh\'#����;����~c����`�1���*o�o߸J�G�N}�����[\n��r��_1>8ݾ�n������t�Y����it��C��7���R�{�8��B�H\\�c|k5�a�!�/ȗ7d�ᷯ/�޶>����#�����c��\r|_���������8-b+���.w��*a��՟F�=�Ǉ:Ԫ�w��!C ���Yw�w!1�C=�Ep1���߱��S���~0���{r��\Z.\0W�����.��-\\�𣱊�(ӏm�\0��V��1��)�\0W�c��\Z�y|c:�z���c\\�j���;����z�V�w��I�;���t��:\\�����>�`��k�ο��X��Y�3������O�<[u+�������K/Ū\'G\\�v��{��w�V�w�b��E8��^s�+���3;R�=s��������h�Jlǿ����!�W�Jp>�_��U�̋�F���K�]��<֐?֩Δ�;I���aN\nO�p5�X�$���|�`c����U�p��R�؞�\Z�����y����ꙉ�¨T*�<cu�r���X�x*�q�c�k����q���N�W�m�}u���U!x�cq���	���\0����[��+���k�=��S�,������g�V�X1��M�����D�l��{d�c��ze�,�\n�\r~�՗����yh���3�������5��~�+8P�׽���q��D1Ģ�g�-�F\\{�Yww����}����#����C��0��U�~O��*�GZ*��b���+\n���� �W���,��T�TnJ��K��s�v|����L��1�!�1�{|�~v�X�Ɲ{������l�؇ Ժ��V��@\r�ч_�ꝉb�ߪ���<u���zl�ݩWRƓ�$�*G\n1��\r�����~8����n�L��K�v�o�d���\'G��*OX(�O?w$ܡ��b)�}������^�ߗ����O>��k�(�j��#�_�lΜ9�U�1�q���\r��st�3Q�����٨�>���nd`����:��x��5��\'��ci�J_�O��ŞTݩv�z=իq�O�ۚ��7��<lʃHLqҙOp���3����Y����N_ߝ�^���#���׷�jO_/M�ᛱpG���\"�tk�����M_��1L��n�{�ocW__ߤ�����S]A:uz�y�>A;w<\'�5a�*H�(�}#թ�l�\0&=�Nu�l��W����=֋U(Ίzkk�c2�t��DKK˧ҶO��L\n�O\'�/D����i[)�e�������%��!4�hz��i�mR#�F�[z܏�޷���y�X��G����l���<,Gpy%��o�0�zڶ+�{�н?��ąm����恨o,%G	��=4�I�H�>�ᢋ.:��ڑfa��<�����\0���V����O٘ߞ����2�w�yߪ^�Y�~`_�OF�0�o��陭�\no+�Z�Ř�&�|������a�ڵ=�0�C>>th�}#�H}l#��Y�_�T���o}���w���!��v�!\r#=N�����l�䦛n�1U��.[���f��wpլ|�����H�m��;�}��]��n&\0�=���\r}��|�z�_��6�%K�\\�x��)Y�-�7n��ZZZ�&���F�¯�;�Lt%6���X�\".f��v��=)sܕ_�~u\\?��J��Z������ࣱ�t=mڴ)�<벿�B�~g��\r�ߜ%�5��z��`�P�z��U5��h,1���Y������\Z~-ZCVk}�W����d_�������R�t`��뮻�.��K�.���[<[ud]r�%[�l�K�}��\'��+�y�#�\n�3�����\r�h���6`��S��z\n����7o�_V/$�z��I�Bk֬9������3UgW\\qŲ+��2{�w&��>x���J�r�zz/�_�wF;U���a��1�v��a��*$�𭥥%ۺu�d��^{-�u����<KSd����w�q�dv����K�j��~g��L��m\0n~`��)������������|����<������+���y>8�\n��C\\|���}+W���\0<�t��Xnx�\'yz�_%��(\0�e���L��7.�Wc�%�O��!�L�b����d��?D\0�Up��V��=��<[\r�-Z����~7{��wk6����/��v\Z�+�\n�Mm��wC:)E;~[�\0�R(�J�-+�1��jۿ���~8�Ū���6>�m��H�Y�cD��H�`��2�!��6R\0N;���}�k/��/n�1�����~�_f��8^�3o��Z�גX�O\\L��������~����BS�ǒG���Y ���qOg�lٲ��\Z���3]�`����/_~$B�x��<��3{cq>���ۄ_�j��\"�����E�R�|\"flH�)���q�h�O�9_Ϭ\n1$�zp�P�X	�駟κ���C��>qcz# ��m�XT��5ԡ�僿��.X�b��G}��7�|���Ç�=��v =ه~��}�dq�ܖ��Z�gG�~Nz}�O�-�i	�4^?*)_����>�`���Mf��b���O�����\Z���1�;����Rǒ�Vn~�_F�^\'�M\'�Z�3b�@z�x+�T��.�h�~y��~�s�w�7��+�����)�W�mbq+��h	`4�B��������7����-~w�[n�{����\r�y@�S���_�cJ�R��YK\0�iii�Tz�x4���;�f\\�U@�U�ﴕNf�����P�X,��^^���nN�Z�_%�N{1.��~�%�<���b{��7�>t���}R����#�zN\'�_i	h^�B��r�G���PTzM�qܧe@�U��S*�֧��F-My�\"�kc�~����OZ�_%��h��`L�%�y��1��л�b��+�6�t�/.j����e�x#��)�b�\\���o����H��L�B��8��Wt�Y�٫e��[�N�~�B�RY�N�=Zf��s�~$�t$ݾ���}������u���G�l�ڵk׎~���N��������!��Ϧz:U���Z�V������oٰa���={������GR���N\\KKK)�j	��od[S��C�S�>�U�qI��Ǝ����x]5T���S,�M\'��Z�����3��{Kkȇ7<��\0�����Sq巖���������p-޸ƅl��#.l�2\0p\nq�w:y�x����,���OU��X,^�U\0`�\"�Ξ=�l-��R��M��X�\"�1\\I�\0�i�dZ[[?�%��B��Xv8��e��\0Pqb�鑴L�9s�|�X,�8��b&�tl�](>�e\0�vᷯR�|IK��ikk�d:;S�xޞT��*\009��@�T�XK@��c�T[b<o�}�X,��U\0`r�o�)�^K@]��%�����\\.?\Z�j\0��Ixw�T�MK��YU����t���n�S�����CZ\0�~S.��%`Ҏ�?M�:..M����m{��-\0Ssb~�T*�\\K@m������z.ϻ=}_�*\00����CTK@͎���z=����D�P�k�\0�s�^XK��koo?3G�.�˿O�GR�G��-\0\r&�<��-�������:�nߩT*�\n���\04���-.z���e��۷o߹iӦlݺuYGG�j�����6n�8�j�X��t�|:զ|Q���.�w�4Ӝ�tgZ�>\"�vuue===Y�j�ڻwo�aÆ��W�r�����El��/���W�4\\�BZ�>��W�m�\0����?�i;##�R�ϧ+{袋.���\0��X�8�8��C��Ʈ�U,@���}���Ku0+?\\�h�ً`\Z�T*_J\'�>-Q��ƮիWg)�>���}�X,^c��\"����LZ���o�������Ͷt~�X��q�p:���ۛ}��_�������\00ô��~<.���~��;ۼvY��CםPq_lR\'�֬Y��S`��={��)�:�7P�ݹ�\'��ڵe��Z�1�\0��7.���~_z�;#���&�\n�\0��������s-��wsG���7�	��/\00�4k\n��%�_%�@3�ߘô�%\Z#���#���&�\n�\0��������eZ�1���V�~c��*�\0�=�|��h�����懗�<�!��T�\0�X�}�\\.ߡ%\Z#�F����\'�߸O8~����WR���h���חm{|��C�}�M@~�	(�Jϕ��_h��������~0���f�7�\0�����oL�NKLa���˺���~�f��w��1�X���/\0p\Z������Zbj��z{��\0@\r͟?���Ri�����;����z�V�\0�|X.�_�S~O7���*�\0㐂�������S~��\0�Q�X�&��i�ӗ�<��*y¯�\0L}pkMի%&ԆY^�K���¯�\04�B���r�_K�$����z��_�\0�����T�i�����=��!X�~�)6w�܏��6�%&%��	��¯�\0L�3��T\rJ�~�	����x{K�ҍ�g�>;\'�\n�\0\031��z5r�MްU���/\0������CC�t	���7�ۅ_\0��~���~�_\0��%�\n�\0\0¯�+�\0�¯�\0 �\n��/\0��k�3�\0@�U�/\0��_\0\0�W�\0@�~\0~�_\0\0�_�\0@�U�/\0��_\0\0�W	�\0\0¯~\0�_%�\0�J�\0~�_\0\0�_�\0\0�W�\0`�u��	��/\0@s���:���#d6h�ڵkG\n���T\0�\ZX�~�-6lسg��ـ�����H��T\0�\ZI��Ǝ����x]5T��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@M����f��`\0\0\0\0IEND�B`�',1),
('5002',1,'D:\\ws_idea\\activiti6\\target\\classes\\processes\\vacation.bpmn','5001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xsi:schemaLocation=\"http://www.omg.org/spec/BPMN/20100524/MODEL BPMN20.xsd\" id=\"m1515296568080\" exporter=\"camunda modeler\" exporterVersion=\"2.7.1\" name=\"\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"vacationProcess\" name=\"请假流程\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\">\n      <outgoing>flow1</outgoing>\n    </startEvent>\n    <userTask id=\"usertask1\" activiti:candidateGroups=\"empGroup\" activiti:exclusive=\"true\" name=\"填写申请\">\n      <incoming>flow1</incoming>\n      <outgoing>flow2</outgoing>\n    </userTask>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\">\n      <incoming>flow2</incoming>\n      <outgoing>flow3</outgoing>\n      <outgoing>flow5</outgoing>\n    </exclusiveGateway>\n    <userTask id=\"usertask2\" activiti:candidateGroups=\"manageGroup\" activiti:exclusive=\"true\" name=\"总监审批\">\n      <incoming>flow3</incoming>\n      <outgoing>flow4</outgoing>\n    </userTask>\n    <userTask id=\"usertask3\" activiti:candidateGroups=\"dirGroup\" activiti:exclusive=\"true\" name=\"经理审批\">\n      <incoming>flow5</incoming>\n      <outgoing>flow6</outgoing>\n    </userTask>\n    <endEvent id=\"endevent1\" name=\"End\">\n      <incoming>flow4</incoming>\n      <incoming>flow6</incoming>\n    </endEvent>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"/>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"exclusivegateway1\"/>\n    <sequenceFlow id=\"flow3\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\n			\n				${days <= 3}\n            \n		]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow4\" sourceRef=\"usertask2\" targetRef=\"endevent1\"/>\n    <sequenceFlow id=\"flow5\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\n			\n				${days > 3}\n            \n		]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" sourceRef=\"usertask3\" targetRef=\"endevent1\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"vacationProcess\">\n      <bpmndi:BPMNShape id=\"Shape-startevent1\" bpmnElement=\"startevent1\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"80.0\" y=\"150.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Shape-usertask1\" bpmnElement=\"usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"180.0\" y=\"140.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Shape-exclusivegateway1\" bpmnElement=\"exclusivegateway1\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"350.0\" y=\"147.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Shape-usertask2\" bpmnElement=\"usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"80.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Shape-usertask3\" bpmnElement=\"usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"210.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Shape-endevent1\" bpmnElement=\"endevent1\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"660.0\" y=\"150.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow1\" bpmnElement=\"flow1\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"112.0\" y=\"166.0\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"180.0\" y=\"167.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow2\" bpmnElement=\"flow2\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"285.0\" y=\"167.5\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"350.0\" y=\"163.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow3\" bpmnElement=\"flow3\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"370.0\" y=\"151.0\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"370.0\" y=\"107.0\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"460.0\" y=\"107.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow4\" bpmnElement=\"flow4\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"565.0\" y=\"107.5\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"660.0\" y=\"166.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow5\" bpmnElement=\"flow5\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"370.0\" y=\"175.0\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"370.0\" y=\"237.0\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"460.0\" y=\"237.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow6\" bpmnElement=\"flow6\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"565.0\" y=\"237.5\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"660.0\" y=\"166.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('5003',1,'D:\\ws_idea\\activiti6\\target\\classes\\processes\\vacation.vacationProcess.png','5001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0\"*^^\0\0�IDATx���l\\՝/�Q�VUU�VEU���n�V�j��jվj�\rZm���M���8NM���\'@)E�-��ҨYT�X(jw��W^S��/��4Y i!	&NR(1���w~�u4qlǎ����~\Z{�8v��;�;g�=g�,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��,��޾}��M�6e�֭�:::TTggg�q�ƁT��\0\05����+�������U�޽{�\r6� �\n\0P��+�6v\0���跧\0�@u2�b�=\0�\"X	��/\0��[U�owg۟�7����c_�}©�\00��vg��.�^x�*�m��\00c���-�<)�֮-�T�\0`�ߗ�Έ�7�	��/\0��	��;�G��M@~\0�_%�\0L���;�~c��*�\0̘��#���&�\n�\0\03&����b����\'yH��6U�\0�1�7��g�?)��}©�\00��o__���U\'yH��6U�\0��7Vp���F�۬�&�\0L���חuo[��z����`�c�z��_\0�i~O�۫X�\0�1�w,������/\0��	��|K`~\0�M�U�/\0��2����r�2�W�\0h��嵿T*],�\n�\0\0�~k�p=�¯�\00�����,�\n�\0@hoo?S+LJ�=��!�_�\0h��;��jP¯�\0L����O�`6�%N�(���T*�8{���q¯�\0L���K!��i�=!�j����a�^ۅ_\0�^����h�����r�֡�w��������/\0P��֞p���P��+�\n�\0@�I����~�%&��+�\0S,�S\0~NK�¯�\0�~�Ruj	�W�~����J��ZB�~�_\0h���z�\\�SK��Lu&�@����b�Z��ï~�Y���T-!�*�\0�!�Y�`�約�_\0h����s���_\0���̙���ZB�U�/\0�x�J����Q-!�*�\0f�b����R�OK�J��o���KR��%�_%�@3��o�ڭ%�_��Z�f��\03U�\\�/��W����������/��1��R�ܴhѢ?����N���T*=�%�_��z衇\"��Á�b�t�B�X���\0f������~��c~S��|\n��RN�I:^:,\0�XyH�/ZB�U�_��ũ~�������8n.\\�Q{5\0L���F\\��%�_5��bp�\\�5.M5�jG��ٳg�m���o�J�+����?�Ykk���1���߉�t�_����A��J�KZ�>֭[\'`��y~���)\0o�����ұ�&�~�^\0\r$�f�%��D}tuu���2�v�ڵ#���\ZW_K�wK��T�̝;�#�\0\0�b餜\n�h��X�~�-6lسg��ـ�����H��z���J��t�u�A��T7���r4\0@�EOT\\��%�+��;::z��u�P�_��;T[[�\'+�ʿ�c�@|�Ꙗ���#\0�$�+-�JG��W\n�_H!xc�#���_\n���2\00��I��ꠖ�)sF:/O�R>m�����[[[?�i\0�����8�j	�zmmm*��K����j{����gj\0��tr�+&���X�͛���r����ٛ�TOU*��Z�Y���}����6m�bNN�4Fuvvf7nH��^Zq�M,ת%����/���X>>�`\nſ4=!PS|���2sq6^�ݻ7�i�&��f�N��Rui	��H���t̾��׽�~x������&$z|�������cW��R���0�\n�?�aK�z��~������3w�QN�N���+˵L_---��7��x~7�ɒ���D�0��f�F�$�\\K��P,Ϗ��w#���/�P����vw���{�-��:V�u�\'�\n��E�4�N�k	�Yb�C\n����!b|pO���Z8��{����˲��b��*�NK\'�ñҔ���+.�Kxe\\ ��~%.�K���:�����-�<)�֮-�T��}3UV,�G���üy��2��7�L˧N{,�R�2 ��2|���wF��M@~<���}�{.��3�<�&M�\'�(��O��{cQ�X\\Cˀ�;lm�h1��6U�m������&�e���\'��K���/1,��Xf9�[nԿy���g��󆘧<U��O�UU�����\Z���)dY���k�>�r���+V\\{�YzB�=ѭ���5�\\�-[����7޸{ɒ%_�b¯��H�w�M&e���)W��/�{9�^>�A�ǰ���lH���;j������%���gy�x�7Z~򓟼s�UWe�]vYv��fO<�D��ݝ:t(�>�0��O?�=����ŋ�+��b`�ҥӓ}�V�m���F\n��M@~�I���M�\Z?],�n�・R�<o*����M�{M\n��xB��IOpK���������+�+Vd/��ⱐ;V[�l�V�\\�]|��ٵ�^�W���w�c+G��M@~�Q�t�,=��0ZZZJ�r�������-�O�n���/����O������w�}����ݻw����|��g���/���O\n�)HL��=�\r&z{����ē����g���/gK�,�.���=���&����b����\'yH��6U��f��:\0��F�P8+k�j>>��R��>gΜ��߈��h��ؘ�<������;l�{�1��QK�.\Z�cX�7�����K�-[��u�]�;３�B�����/�0���ߨW������	���4\r��?wt�``s���H\n����]�S[,/�g�9�����ǩ�o�0�����ի�z�Z�f��k��z���M����{�m�M�	ɪU���w���A�R}}ٶ�W�<�!��T�w�ߡ?�8�L�&��0ٗ*.Fې���ڗ�����g8߁�![�n�Iz�ײNZ�l��1�1�!zh\'#����;����~c����`�1���*o�o߸J�G�N}�����[\n��r��_1>8ݾ�n������t�Y����it��C��7���R�{�8��B�H\\�c|k5�a�!�/ȗ7d�ᷯ/�޶>����#�����c��\r|_���������8-b+���.w��*a��՟F�=�Ǉ:Ԫ�w��!C ���Yw�w!1�C=�Ep1���߱��S���~0���{r��\Z.\0W�����.��-\\�𣱊�(ӏm�\0��V��1��)�\0W�c��\Z�y|c:�z���c\\�j���;����z�V�w��I�;���t��:\\�����>�`��k�ο��X��Y�3������O�<[u+�������K/Ū\'G\\�v��{��w�V�w�b��E8��^s�+���3;R�=s��������h�Jlǿ����!�W�Jp>�_��U�̋�F���K�]��<֐?֩Δ�;I���aN\nO�p5�X�$���|�`c����U�p��R�؞�\Z�����y����ꙉ�¨T*�<cu�r���X�x*�q�c�k����q���N�W�m�}u���U!x�cq���	���\0����[��+���k�=��S�,������g�V�X1��M�����D�l��{d�c��ze�,�\n�\r~�՗����yh���3�������5��~�+8P�׽���q��D1Ģ�g�-�F\\{�Yww����}����#����C��0��U�~O��*�GZ*��b���+\n���� �W���,��T�TnJ��K��s�v|����L��1�!�1�{|�~v�X�Ɲ{������l�؇ Ժ��V��@\r�ч_�ꝉb�ߪ���<u���zl�ݩWRƓ�$�*G\n1��\r�����~8����n�L��K�v�o�d���\'G��*OX(�O?w$ܡ��b)�}������^�ߗ����O>��k�(�j��#�_�lΜ9�U�1�q���\r��st�3Q�����٨�>���nd`����:��x��5��\'��ci�J_�O��ŞTݩv�z=իq�O�ۚ��7��<lʃHLqҙOp���3����Y����N_ߝ�^���#���׷�jO_/M�ᛱpG���\"�tk�����M_��1L��n�{�ocW__ߤ�����S]A:uz�y�>A;w<\'�5a�*H�(�}#թ�l�\0&=�Nu�l��W����=֋U(Ίzkk�c2�t��DKK˧ҶO��L\n�O\'�/D����i[)�e�������%��!4�hz��i�mR#�F�[z܏�޷���y�X��G����l���<,Gpy%��o�0�zڶ+�{�н?��ąm����恨o,%G	��=4�I�H�>�ᢋ.:��ڑfa��<�����\0���V����O٘ߞ����2�w�yߪ^�Y�~`_�OF�0�o��陭�\no+�Z�Ř�&�|������a�ڵ=�0�C>>th�}#�H}l#��Y�_�T���o}���w���!��v�!\r#=N�����l�䦛n�1U��.[���f��wpլ|�����H�m��;�}��]��n&\0�=���\r}��|�z�_��6�%K�\\�x��)Y�-�7n��ZZZ�&���F�¯�;�Lt%6���X�\".f��v��=)sܕ_�~u\\?��J��Z������ࣱ�t=mڴ)�<벿�B�~g��\r�ߜ%�5��z��`�P�z��U5��h,1���Y������\Z~-ZCVk}�W����d_�������R�t`��뮻�.��K�.���[<[ud]r�%[�l�K�}��\'��+�y�#�\n�3�����\r�h���6`��S��z\n����7o�_V/$�z��I�Bk֬9������3UgW\\qŲ+��2{�w&��>x���J�r�zz/�_�wF;U���a��1�v��a��*$�𭥥%ۺu�d��^{-�u����<KSd����w�q�dv����K�j��~g��L��m\0n~`��)������������|����<������+���y>8�\n��C\\|���}+W���\0<�t��Xnx�\'yz�_%��(\0�e���L��7.�Wc�%�O��!�L�b����d��?D\0�Up��V��=��<[\r�-Z����~7{��wk6����/��v\Z�+�\n�Mm��wC:)E;~[�\0�R(�J�-+�1��jۿ���~8�Ū���6>�m��H�Y�cD��H�`��2�!��6R\0N;���}�k/��/n�1�����~�_f��8^�3o��Z�גX�O\\L��������~����BS�ǒG���Y ���qOg�lٲ��\Z���3]�`����/_~$B�x��<��3{cq>���ۄ_�j��\"�����E�R�|\"flH�)���q�h�O�9_Ϭ\n1$�zp�P�X	�駟κ���C��>qcz# ��m�XT��5ԡ�僿��.X�b��G}��7�|���Ç�=��v =ه~��}�dq�ܖ��Z�gG�~Nz}�O�-�i	�4^?*)_����>�`���Mf��b���O�����\Z���1�;����Rǒ�Vn~�_F�^\'�M\'�Z�3b�@z�x+�T��.�h�~y��~�s�w�7��+�����)�W�mbq+��h	`4�B��������7����-~w�[n�{����\r�y@�S���_�cJ�R��YK\0�iii�Tz�x4���;�f\\�U@�U�ﴕNf�����P�X,��^^���nN�Z�_%�N{1.��~�%�<���b{��7�>t���}R����#�zN\'�_i	h^�B��r�G���PTzM�qܧe@�U��S*�֧��F-My�\"�kc�~����OZ�_%��h��`L�%�y��1��л�b��+�6�t�/.j����e�x#��)�b�\\���o����H��L�B��8��Wt�Y�٫e��[�N�~�B�RY�N�=Zf��s�~$�t$ݾ���}������u���G�l�ڵk׎~���N��������!��Ϧz:U���Z�V������oٰa���={������GR���N\\KKK)�j	��od[S��C�S�>�U�qI��Ǝ����x]5T���S,�M\'��Z�����3��{Kkȇ7<��\0�����Sq巖���������p-޸ƅl��#.l�2\0p\nq�w:y�x����,���OU��X,^�U\0`�\"�Ξ=�l-��R��M��X�\"�1\\I�\0�i�dZ[[?�%��B��Xv8��e��\0Pqb�鑴L�9s�|�X,�8��b&�tl�](>�e\0�vᷯR�|IK��ikk�d:;S�xޞT��*\009��@�T�XK@��c�T[b<o�}�X,��U\0`r�o�)�^K@]��%�����\\.?\Z�j\0��Ixw�T�MK��YU����t���n�S�����CZ\0�~S.��%`Ҏ�?M�:..M����m{��-\0Ssb~�T*�\\K@m������z.ϻ=}_�*\00����CTK@͎���z=����D�P�k�\0�s�^XK��koo?3G�.�˿O�GR�G��-\0\r&�<��-�������:�nߩT*�\n���\04���-.z���e��۷o߹iӦlݺuYGG�j�����6n�8�j�X��t�|:զ|Q���.�w�4Ӝ�tgZ�>\"�vuue===Y�j�ڻwo�aÆ��W�r�����El��/���W�4\\�BZ�>��W�m�\0����?�i;##�R�ϧ+{袋.���\0��X�8�8��C��Ʈ�U,@���}���Ku0+?\\�h�ً`\Z�T*_J\'�>-Q��ƮիWg)�>���}�X,^c��\"����LZ���o�������Ͷt~�X��q�p:���ۛ}��_�������\00ô��~<.���~��;ۼvY��CםPq_lR\'�֬Y��S`��={��)�:�7P�ݹ�\'��ڵe��Z�1�\0��7.���~_z�;#���&�\n�\0��������s-��wsG���7�	��/\00�4k\n��%�_%�@3�ߘô�%\Z#���#���&�\n�\0��������eZ�1���V�~c��*�\0�=�|��h�����懗�<�!��T�\0�X�}�\\.ߡ%\Z#�F����\'�߸O8~����WR���h���חm{|��C�}�M@~�	(�Jϕ��_h��������~0���f�7�\0�����oL�NKLa���˺���~�f��w��1�X���/\0p\Z������Zbj��z{��\0@\r͟?���Ri�����;����z�V�\0�|X.�_�S~O7���*�\0㐂�������S~��\0�Q�X�&��i�ӗ�<��*y¯�\0L}pkMի%&ԆY^�K���¯�\04�B���r�_K�$����z��_�\0�����T�i�����=��!X�~�)6w�܏��6�%&%��	��¯�\0L�3��T\rJ�~�	����x{K�ҍ�g�>;\'�\n�\0\031��z5r�MްU���/\0������CC�t	���7�ۅ_\0��~���~�_\0��%�\n�\0\0¯�+�\0�¯�\0 �\n��/\0��k�3�\0@�U�/\0��_\0\0�W�\0@�~\0~�_\0\0�_�\0@�U�/\0��_\0\0�W	�\0\0¯~\0�_%�\0�J�\0~�_\0\0�_�\0\0�W�\0`�u��	��/\0@s���:���#d6h�ڵkG\n���T\0�\ZX�~�-6lسg��ـ�����H��T\0�\ZI��Ǝ����x]5T��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@M����f��`\0\0\0\0IEND�B`�',1),
('7502',1,'D:\\ws_idea\\activiti-demo6\\target\\classes\\processes\\vacation.bpmn','7501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xsi:schemaLocation=\"http://www.omg.org/spec/BPMN/20100524/MODEL BPMN20.xsd\" id=\"m1515296568080\" exporter=\"camunda modeler\" exporterVersion=\"2.7.1\" name=\"\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"vacationProcess\" name=\"请假流程\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\">\n      <outgoing>flow1</outgoing>\n    </startEvent>\n    <userTask id=\"usertask1\" activiti:candidateGroups=\"empGroup\" activiti:exclusive=\"true\" name=\"填写申请\">\n      <incoming>flow1</incoming>\n      <outgoing>flow2</outgoing>\n    </userTask>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\">\n      <incoming>flow2</incoming>\n      <outgoing>flow3</outgoing>\n      <outgoing>flow5</outgoing>\n    </exclusiveGateway>\n    <userTask id=\"usertask2\" activiti:candidateGroups=\"manageGroup\" activiti:exclusive=\"true\" name=\"总监审批\">\n      <incoming>flow3</incoming>\n      <outgoing>flow4</outgoing>\n    </userTask>\n    <userTask id=\"usertask3\" activiti:candidateGroups=\"dirGroup\" activiti:exclusive=\"true\" name=\"经理审批\">\n      <incoming>flow5</incoming>\n      <outgoing>flow6</outgoing>\n    </userTask>\n    <endEvent id=\"endevent1\" name=\"End\">\n      <incoming>flow4</incoming>\n      <incoming>flow6</incoming>\n    </endEvent>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"/>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"exclusivegateway1\"/>\n    <sequenceFlow id=\"flow3\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\n			\n				${days <= 3}\n            \n		]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow4\" sourceRef=\"usertask2\" targetRef=\"endevent1\"/>\n    <sequenceFlow id=\"flow5\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\n			\n				${days > 3}\n            \n		]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" sourceRef=\"usertask3\" targetRef=\"endevent1\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"vacationProcess\">\n      <bpmndi:BPMNShape id=\"Shape-startevent1\" bpmnElement=\"startevent1\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"80.0\" y=\"150.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Shape-usertask1\" bpmnElement=\"usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"180.0\" y=\"140.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Shape-exclusivegateway1\" bpmnElement=\"exclusivegateway1\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"350.0\" y=\"147.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Shape-usertask2\" bpmnElement=\"usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"80.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Shape-usertask3\" bpmnElement=\"usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"210.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Shape-endevent1\" bpmnElement=\"endevent1\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"660.0\" y=\"150.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow1\" bpmnElement=\"flow1\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"112.0\" y=\"166.0\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"180.0\" y=\"167.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow2\" bpmnElement=\"flow2\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"285.0\" y=\"167.5\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"350.0\" y=\"163.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow3\" bpmnElement=\"flow3\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"370.0\" y=\"151.0\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"370.0\" y=\"107.0\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"460.0\" y=\"107.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow4\" bpmnElement=\"flow4\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"565.0\" y=\"107.5\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"660.0\" y=\"166.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow5\" bpmnElement=\"flow5\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"370.0\" y=\"175.0\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"370.0\" y=\"237.0\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"460.0\" y=\"237.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"BPMNEdge_flow6\" bpmnElement=\"flow6\">\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"565.0\" y=\"237.5\"/>\n        <omgdi:waypoint xsi:type=\"omgdc:Point\" x=\"660.0\" y=\"166.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('7503',1,'D:\\ws_idea\\activiti-demo6\\target\\classes\\processes\\vacation.vacationProcess.png','7501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0\"*^^\0\0�IDATx���l\\՝/�Q�VUU�VEU���n�V�j��jվj�\rZm���M���8NM���\'@)E�-��ҨYT�X(jw��W^S��/��4Y i!	&NR(1���w~�u4qlǎ����~\Z{�8v��;�;g�=g�,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��,��޾}��M�6e�֭�:::TTggg�q�ƁT��\0\05����+�������U�޽{�\r6� �\n\0P��+�6v\0���跧\0�@u2�b�=\0�\"X	��/\0��[U�owg۟�7����c_�}©�\00��vg��.�^x�*�m��\00c���-�<)�֮-�T�\0`�ߗ�Έ�7�	��/\0��	��;�G��M@~\0�_%�\0L���;�~c��*�\0̘��#���&�\n�\0\03&����b����\'yH��6U�\0�1�7��g�?)��}©�\00��o__���U\'yH��6U�\0��7Vp���F�۬�&�\0L���חuo[��z����`�c�z��_\0�i~O�۫X�\0�1�w,������/\0��	��|K`~\0�M�U�/\0��2����r�2�W�\0h��嵿T*],�\n�\0\0�~k�p=�¯�\00�����,�\n�\0@hoo?S+LJ�=��!�_�\0h��;��jP¯�\0L����O�`6�%N�(���T*�8{���q¯�\0L���K!��i�=!�j����a�^ۅ_\0�^����h�����r�֡�w��������/\0P��֞p���P��+�\n�\0@�I����~�%&��+�\0S,�S\0~NK�¯�\0�~�Ruj	�W�~����J��ZB�~�_\0h���z�\\�SK��Lu&�@����b�Z��ï~�Y���T-!�*�\0�!�Y�`�約�_\0h����s���_\0���̙���ZB�U�/\0�x�J����Q-!�*�\0f�b����R�OK�J��o���KR��%�_%�@3��o�ڭ%�_��Z�f��\03U�\\�/��W����������/��1��R�ܴhѢ?����N���T*=�%�_��z衇\"��Á�b�t�B�X���\0f������~��c~S��|\n��RN�I:^:,\0�XyH�/ZB�U�_��ũ~�������8n.\\�Q{5\0L���F\\��%�_5��bp�\\�5.M5�jG��ٳg�m���o�J�+����?�Ykk���1���߉�t�_����A��J�KZ�>֭[\'`��y~���)\0o�����ұ�&�~�^\0\r$�f�%��D}tuu���2�v�ڵ#���\ZW_K�wK��T�̝;�#�\0\0�b餜\n�h��X�~�-6lسg��ـ�����H��z���J��t�u�A��T7���r4\0@�EOT\\��%�+��;::z��u�P�_��;T[[�\'+�ʿ�c�@|�Ꙗ���#\0�$�+-�JG��W\n�_H!xc�#���_\n���2\00��I��ꠖ�)sF:/O�R>m�����[[[?�i\0�����8�j	�zmmm*��K����j{����gj\0��tr�+&���X�͛���r����ٛ�TOU*��Z�Y���}����6m�bNN�4Fuvvf7nH��^Zq�M,ת%����/���X>>�`\nſ4=!PS|���2sq6^�ݻ7�i�&��f�N��Rui	��H���t̾��׽�~x������&$z|�������cW��R���0�\n�?�aK�z��~������3w�QN�N���+˵L_---��7��x~7�ɒ���D�0��f�F�$�\\K��P,Ϗ��w#���/�P����vw���{�-��:V�u�\'�\n��E�4�N�k	�Yb�C\n����!b|pO���Z8��{����˲��b��*�NK\'�ñҔ���+.�Kxe\\ ��~%.�K���:�����-�<)�֮-�T��}3UV,�G���üy��2��7�L˧N{,�R�2 ��2|���wF��M@~<���}�{.��3�<�&M�\'�(��O��{cQ�X\\Cˀ�;lm�h1��6U�m������&�e���\'��K���/1,��Xf9�[nԿy���g��󆘧<U��O�UU�����\Z���)dY���k�>�r���+V\\{�YzB�=ѭ���5�\\�-[����7޸{ɒ%_�b¯��H�w�M&e���)W��/�{9�^>�A�ǰ���lH���;j������%���gy�x�7Z~򓟼s�UWe�]vYv��fO<�D��ݝ:t(�>�0��O?�=����ŋ�+��b`�ҥӓ}�V�m���F\n��M@~�I���M�\Z?],�n�・R�<o*����M�{M\n��xB��IOpK���������+�+Vd/��ⱐ;V[�l�V�\\�]|��ٵ�^�W���w�c+G��M@~�Q�t�,=��0ZZZJ�r�������-�O�n���/����O������w�}����ݻw����|��g���/���O\n�)HL��=�\r&z{����ē����g���/gK�,�.���=���&����b����\'yH��6U��f��:\0��F�P8+k�j>>��R��>gΜ��߈��h��ؘ�<������;l�{�1��QK�.\Z�cX�7�����K�-[��u�]�;３�B�����/�0���ߨW������	���4\r��?wt�``s���H\n����]�S[,/�g�9�����ǩ�o�0�����ի�z�Z�f��k��z���M����{�m�M�	ɪU���w���A�R}}ٶ�W�<�!��T�w�ߡ?�8�L�&��0ٗ*.Fې���ڗ�����g8߁�![�n�Iz�ײNZ�l��1�1�!zh\'#����;����~c����`�1���*o�o߸J�G�N}�����[\n��r��_1>8ݾ�n������t�Y����it��C��7���R�{�8��B�H\\�c|k5�a�!�/ȗ7d�ᷯ/�޶>����#�����c��\r|_���������8-b+���.w��*a��՟F�=�Ǉ:Ԫ�w��!C ���Yw�w!1�C=�Ep1���߱��S���~0���{r��\Z.\0W�����.��-\\�𣱊�(ӏm�\0��V��1��)�\0W�c��\Z�y|c:�z���c\\�j���;����z�V�w��I�;���t��:\\�����>�`��k�ο��X��Y�3������O�<[u+�������K/Ū\'G\\�v��{��w�V�w�b��E8��^s�+���3;R�=s��������h�Jlǿ����!�W�Jp>�_��U�̋�F���K�]��<֐?֩Δ�;I���aN\nO�p5�X�$���|�`c����U�p��R�؞�\Z�����y����ꙉ�¨T*�<cu�r���X�x*�q�c�k����q���N�W�m�}u���U!x�cq���	���\0����[��+���k�=��S�,������g�V�X1��M�����D�l��{d�c��ze�,�\n�\r~�՗����yh���3�������5��~�+8P�׽���q��D1Ģ�g�-�F\\{�Yww����}����#����C��0��U�~O��*�GZ*��b���+\n���� �W���,��T�TnJ��K��s�v|����L��1�!�1�{|�~v�X�Ɲ{������l�؇ Ժ��V��@\r�ч_�ꝉb�ߪ���<u���zl�ݩWRƓ�$�*G\n1��\r�����~8����n�L��K�v�o�d���\'G��*OX(�O?w$ܡ��b)�}������^�ߗ����O>��k�(�j��#�_�lΜ9�U�1�q���\r��st�3Q�����٨�>���nd`����:��x��5��\'��ci�J_�O��ŞTݩv�z=իq�O�ۚ��7��<lʃHLqҙOp���3����Y����N_ߝ�^���#���׷�jO_/M�ᛱpG���\"�tk�����M_��1L��n�{�ocW__ߤ�����S]A:uz�y�>A;w<\'�5a�*H�(�}#թ�l�\0&=�Nu�l��W����=֋U(Ίzkk�c2�t��DKK˧ҶO��L\n�O\'�/D����i[)�e�������%��!4�hz��i�mR#�F�[z܏�޷���y�X��G����l���<,Gpy%��o�0�zڶ+�{�н?��ąm����恨o,%G	��=4�I�H�>�ᢋ.:��ڑfa��<�����\0���V����O٘ߞ����2�w�yߪ^�Y�~`_�OF�0�o��陭�\no+�Z�Ř�&�|������a�ڵ=�0�C>>th�}#�H}l#��Y�_�T���o}���w���!��v�!\r#=N�����l�䦛n�1U��.[���f��wpլ|�����H�m��;�}��]��n&\0�=���\r}��|�z�_��6�%K�\\�x��)Y�-�7n��ZZZ�&���F�¯�;�Lt%6���X�\".f��v��=)sܕ_�~u\\?��J��Z������ࣱ�t=mڴ)�<벿�B�~g��\r�ߜ%�5��z��`�P�z��U5��h,1���Y������\Z~-ZCVk}�W����d_�������R�t`��뮻�.��K�.���[<[ud]r�%[�l�K�}��\'��+�y�#�\n�3�����\r�h���6`��S��z\n����7o�_V/$�z��I�Bk֬9������3UgW\\qŲ+��2{�w&��>x���J�r�zz/�_�wF;U���a��1�v��a��*$�𭥥%ۺu�d��^{-�u����<KSd����w�q�dv����K�j��~g��L��m\0n~`��)������������|����<������+���y>8�\n��C\\|���}+W���\0<�t��Xnx�\'yz�_%��(\0�e���L��7.�Wc�%�O��!�L�b����d��?D\0�Up��V��=��<[\r�-Z����~7{��wk6����/��v\Z�+�\n�Mm��wC:)E;~[�\0�R(�J�-+�1��jۿ���~8�Ū���6>�m��H�Y�cD��H�`��2�!��6R\0N;���}�k/��/n�1�����~�_f��8^�3o��Z�גX�O\\L��������~����BS�ǒG���Y ���qOg�lٲ��\Z���3]�`����/_~$B�x��<��3{cq>���ۄ_�j��\"�����E�R�|\"flH�)���q�h�O�9_Ϭ\n1$�zp�P�X	�駟κ���C��>qcz# ��m�XT��5ԡ�僿��.X�b��G}��7�|���Ç�=��v =ه~��}�dq�ܖ��Z�gG�~Nz}�O�-�i	�4^?*)_����>�`���Mf��b���O�����\Z���1�;����Rǒ�Vn~�_F�^\'�M\'�Z�3b�@z�x+�T��.�h�~y��~�s�w�7��+�����)�W�mbq+��h	`4�B��������7����-~w�[n�{����\r�y@�S���_�cJ�R��YK\0�iii�Tz�x4���;�f\\�U@�U�ﴕNf�����P�X,��^^���nN�Z�_%�N{1.��~�%�<���b{��7�>t���}R����#�zN\'�_i	h^�B��r�G���PTzM�qܧe@�U��S*�֧��F-My�\"�kc�~����OZ�_%��h��`L�%�y��1��л�b��+�6�t�/.j����e�x#��)�b�\\���o����H��L�B��8��Wt�Y�٫e��[�N�~�B�RY�N�=Zf��s�~$�t$ݾ���}������u���G�l�ڵk׎~���N��������!��Ϧz:U���Z�V������oٰa���={������GR���N\\KKK)�j	��od[S��C�S�>�U�qI��Ǝ����x]5T���S,�M\'��Z�����3��{Kkȇ7<��\0�����Sq巖���������p-޸ƅl��#.l�2\0p\nq�w:y�x����,���OU��X,^�U\0`�\"�Ξ=�l-��R��M��X�\"�1\\I�\0�i�dZ[[?�%��B��Xv8��e��\0Pqb�鑴L�9s�|�X,�8��b&�tl�](>�e\0�vᷯR�|IK��ikk�d:;S�xޞT��*\009��@�T�XK@��c�T[b<o�}�X,��U\0`r�o�)�^K@]��%�����\\.?\Z�j\0��Ixw�T�MK��YU����t���n�S�����CZ\0�~S.��%`Ҏ�?M�:..M����m{��-\0Ssb~�T*�\\K@m������z.ϻ=}_�*\00����CTK@͎���z=����D�P�k�\0�s�^XK��koo?3G�.�˿O�GR�G��-\0\r&�<��-�������:�nߩT*�\n���\04���-.z���e��۷o߹iӦlݺuYGG�j�����6n�8�j�X��t�|:զ|Q���.�w�4Ӝ�tgZ�>\"�vuue===Y�j�ڻwo�aÆ��W�r�����El��/���W�4\\�BZ�>��W�m�\0����?�i;##�R�ϧ+{袋.���\0��X�8�8��C��Ʈ�U,@���}���Ku0+?\\�h�ً`\Z�T*_J\'�>-Q��ƮիWg)�>���}�X,^c��\"����LZ���o�������Ͷt~�X��q�p:���ۛ}��_�������\00ô��~<.���~��;ۼvY��CםPq_lR\'�֬Y��S`��={��)�:�7P�ݹ�\'��ڵe��Z�1�\0��7.���~_z�;#���&�\n�\0��������s-��wsG���7�	��/\00�4k\n��%�_%�@3�ߘô�%\Z#���#���&�\n�\0��������eZ�1���V�~c��*�\0�=�|��h�����懗�<�!��T�\0�X�}�\\.ߡ%\Z#�F����\'�߸O8~����WR���h���חm{|��C�}�M@~�	(�Jϕ��_h��������~0���f�7�\0�����oL�NKLa���˺���~�f��w��1�X���/\0p\Z������Zbj��z{��\0@\r͟?���Ri�����;����z�V�\0�|X.�_�S~O7���*�\0㐂�������S~��\0�Q�X�&��i�ӗ�<��*y¯�\0L}pkMի%&ԆY^�K���¯�\04�B���r�_K�$����z��_�\0�����T�i�����=��!X�~�)6w�܏��6�%&%��	��¯�\0L�3��T\rJ�~�	����x{K�ҍ�g�>;\'�\n�\0\031��z5r�MްU���/\0������CC�t	���7�ۅ_\0��~���~�_\0��%�\n�\0\0¯�+�\0�¯�\0 �\n��/\0��k�3�\0@�U�/\0��_\0\0�W�\0@�~\0~�_\0\0�_�\0@�U�/\0��_\0\0�W	�\0\0¯~\0�_%�\0�J�\0~�_\0\0�_�\0\0�W�\0`�u��	��/\0@s���:���#d6h�ڵkG\n���T\0�\ZX�~�-6lسg��ـ�����H��T\0�\ZI��Ǝ����x]5T��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@M����f��`\0\0\0\0IEND�B`�',1);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values 
('cfg.execution-related-entities-count','false',1),
('next.dbid','10001',5),
('schema.history','create(6.0.0.4)',1),
('schema.version','6.0.0.4',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values 
('17','vacationProcess:1:4','5','6','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2018-12-20 10:55:48','2018-12-20 10:55:48',12,NULL,''),
('18','vacationProcess:1:4','5','6','usertask2','19',NULL,'总监审批','userTask','managea','2018-12-20 10:55:48','2018-12-20 11:03:55',487542,NULL,''),
('23','vacationProcess:1:4','21','22','startevent1',NULL,NULL,'Start','startEvent',NULL,'2018-12-20 10:56:40','2018-12-20 10:56:40',0,NULL,''),
('24','vacationProcess:1:4','21','22','usertask1','25',NULL,'填写申请','userTask',NULL,'2018-12-20 10:56:40','2018-12-20 10:56:40',733,NULL,''),
('33','vacationProcess:1:4','21','22','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2018-12-20 10:56:40','2018-12-20 10:56:40',0,NULL,''),
('34','vacationProcess:1:4','21','22','usertask2','35',NULL,'总监审批','userTask',NULL,'2018-12-20 10:56:40',NULL,NULL,NULL,''),
('39','vacationProcess:1:4','37','38','startevent1',NULL,NULL,'Start','startEvent',NULL,'2018-12-20 10:56:44','2018-12-20 10:56:44',0,NULL,''),
('40','vacationProcess:1:4','37','38','usertask1','41',NULL,'填写申请','userTask',NULL,'2018-12-20 10:56:44','2018-12-20 10:56:44',532,NULL,''),
('49','vacationProcess:1:4','37','38','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2018-12-20 10:56:44','2018-12-20 10:56:44',0,NULL,''),
('50','vacationProcess:1:4','37','38','usertask2','51',NULL,'总监审批','userTask','managea','2018-12-20 10:56:44','2018-12-20 11:03:51',427620,NULL,''),
('56','vacationProcess:1:4','53','55','startevent1',NULL,NULL,'Start','startEvent',NULL,'2018-12-20 11:02:32','2018-12-20 11:02:32',0,NULL,''),
('57','vacationProcess:1:4','53','55','usertask1','58',NULL,'填写申请','userTask','empa','2018-12-20 11:02:32','2018-12-20 11:02:32',418,NULL,''),
('66','vacationProcess:1:4','53','55','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2018-12-20 11:02:32','2018-12-20 11:02:32',0,NULL,''),
('67','vacationProcess:1:4','53','55','usertask2','68',NULL,'总监审批','userTask','managea','2018-12-20 11:02:32','2018-12-20 11:03:44',72498,NULL,''),
('7','vacationProcess:1:4','5','6','startevent1',NULL,NULL,'Start','startEvent',NULL,'2018-12-20 10:55:48','2018-12-20 10:55:48',3,NULL,''),
('77','vacationProcess:1:4','53','55','endevent1',NULL,NULL,'End','endEvent',NULL,'2018-12-20 11:03:44','2018-12-20 11:03:44',0,NULL,''),
('8','vacationProcess:1:4','5','6','usertask1','9',NULL,'填写申请','userTask',NULL,'2018-12-20 10:55:48','2018-12-20 10:55:48',476,NULL,''),
('85','vacationProcess:1:4','37','38','endevent1',NULL,NULL,'End','endEvent',NULL,'2018-12-20 11:03:51','2018-12-20 11:03:51',0,NULL,''),
('93','vacationProcess:1:4','5','6','endevent1',NULL,NULL,'End','endEvent',NULL,'2018-12-20 11:03:55','2018-12-20 11:03:55',1,NULL,'');

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

insert  into `act_hi_detail`(`ID_`,`TYPE_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`ACT_INST_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`TIME_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values 
('12','VariableUpdate','5','5',NULL,'8','applyUser','null',0,'2018-12-20 10:55:48',NULL,NULL,NULL,NULL,NULL),
('14','VariableUpdate','5','5',NULL,'8','days','integer',0,'2018-12-20 10:55:48',NULL,NULL,1,'1',NULL),
('16','VariableUpdate','5','5',NULL,'8','reason','string',0,'2018-12-20 10:55:48',NULL,NULL,NULL,'有紧急事情',NULL),
('28','VariableUpdate','21','21',NULL,'24','applyUser','null',0,'2018-12-20 10:56:40',NULL,NULL,NULL,NULL,NULL),
('30','VariableUpdate','21','21',NULL,'24','days','integer',0,'2018-12-20 10:56:40',NULL,NULL,1,'1',NULL),
('32','VariableUpdate','21','21',NULL,'24','reason','string',0,'2018-12-20 10:56:40',NULL,NULL,NULL,'有紧急事情',NULL),
('44','VariableUpdate','37','37',NULL,'40','applyUser','null',0,'2018-12-20 10:56:44',NULL,NULL,NULL,NULL,NULL),
('46','VariableUpdate','37','37',NULL,'40','days','integer',0,'2018-12-20 10:56:44',NULL,NULL,1,'1',NULL),
('48','VariableUpdate','37','37',NULL,'40','reason','string',0,'2018-12-20 10:56:44',NULL,NULL,NULL,'有紧急事情',NULL),
('61','VariableUpdate','53','53',NULL,'57','applyUser','string',0,'2018-12-20 11:02:32',NULL,NULL,NULL,'empa',NULL),
('63','VariableUpdate','53','53',NULL,'57','days','integer',0,'2018-12-20 11:02:32',NULL,NULL,1,'1',NULL),
('65','VariableUpdate','53','53',NULL,'57','reason','string',0,'2018-12-20 11:02:32',NULL,NULL,NULL,'有紧急事情',NULL),
('72','VariableUpdate','53','53',NULL,'67','result','string',0,'2018-12-20 11:03:44',NULL,NULL,NULL,'审核通过',NULL),
('74','VariableUpdate','53','53',NULL,'67','auditTime','date',0,'2018-12-20 11:03:44',NULL,NULL,1545275024441,NULL,NULL),
('76','VariableUpdate','53','53',NULL,'67','auditor','string',0,'2018-12-20 11:03:44',NULL,NULL,NULL,'managea',NULL),
('80','VariableUpdate','37','37',NULL,'50','result','string',0,'2018-12-20 11:03:51',NULL,NULL,NULL,'审核通过',NULL),
('82','VariableUpdate','37','37',NULL,'50','auditTime','date',0,'2018-12-20 11:03:51',NULL,NULL,1545275031566,NULL,NULL),
('84','VariableUpdate','37','37',NULL,'50','auditor','string',0,'2018-12-20 11:03:51',NULL,NULL,NULL,'managea',NULL),
('88','VariableUpdate','5','5',NULL,'18','result','string',0,'2018-12-20 11:03:55',NULL,NULL,NULL,'审核拒绝',NULL),
('90','VariableUpdate','5','5',NULL,'18','auditTime','date',0,'2018-12-20 11:03:55',NULL,NULL,1545275035494,NULL,NULL),
('92','VariableUpdate','5','5',NULL,'18','auditor','string',0,'2018-12-20 11:03:55',NULL,NULL,NULL,'managea',NULL);

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values 
('10','empGroup','candidate',NULL,'9',NULL),
('20','manageGroup','candidate',NULL,'19',NULL),
('26','empGroup','candidate',NULL,'25',NULL),
('36','manageGroup','candidate',NULL,'35',NULL),
('42','empGroup','candidate',NULL,'41',NULL),
('52','manageGroup','candidate',NULL,'51',NULL),
('54',NULL,'starter','empa',NULL,'53'),
('59','empGroup','candidate',NULL,'58',NULL),
('69','manageGroup','candidate',NULL,'68',NULL),
('70',NULL,'participant','managea',NULL,'53'),
('78',NULL,'participant','managea',NULL,'37'),
('86',NULL,'participant','managea',NULL,'5');

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values 
('21','21',NULL,'vacationProcess:1:4','2018-12-20 10:56:40',NULL,NULL,NULL,'startevent1',NULL,NULL,NULL,'',NULL),
('37','37',NULL,'vacationProcess:1:4','2018-12-20 10:56:44','2018-12-20 11:03:51',427630,NULL,'startevent1','endevent1',NULL,NULL,'',NULL),
('5','5',NULL,'vacationProcess:1:4','2018-12-20 10:55:48','2018-12-20 11:03:55',487557,NULL,'startevent1','endevent1',NULL,NULL,'',NULL),
('53','53',NULL,'vacationProcess:1:4','2018-12-20 11:02:32','2018-12-20 11:03:44',72550,'empa','startevent1','endevent1',NULL,NULL,'',NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values 
('19','vacationProcess:1:4','usertask2','5','6','总监审批',NULL,NULL,NULL,'managea','2018-12-20 10:55:48','2018-12-20 11:03:55','2018-12-20 11:03:55',487541,NULL,50,NULL,NULL,NULL,''),
('25','vacationProcess:1:4','usertask1','21','22','填写申请',NULL,NULL,NULL,NULL,'2018-12-20 10:56:40',NULL,'2018-12-20 10:56:40',731,NULL,50,NULL,NULL,NULL,''),
('35','vacationProcess:1:4','usertask2','21','22','总监审批',NULL,NULL,NULL,NULL,'2018-12-20 10:56:40',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),
('41','vacationProcess:1:4','usertask1','37','38','填写申请',NULL,NULL,NULL,NULL,'2018-12-20 10:56:44',NULL,'2018-12-20 10:56:44',530,NULL,50,NULL,NULL,NULL,''),
('51','vacationProcess:1:4','usertask2','37','38','总监审批',NULL,NULL,NULL,'managea','2018-12-20 10:56:44','2018-12-20 11:03:51','2018-12-20 11:03:51',427618,NULL,50,NULL,NULL,NULL,''),
('58','vacationProcess:1:4','usertask1','53','55','填写申请',NULL,NULL,NULL,'empa','2018-12-20 11:02:32','2018-12-20 11:02:32','2018-12-20 11:02:32',414,NULL,50,NULL,NULL,NULL,''),
('68','vacationProcess:1:4','usertask2','53','55','总监审批',NULL,NULL,NULL,'managea','2018-12-20 11:02:32','2018-12-20 11:03:44','2018-12-20 11:03:44',72496,NULL,50,NULL,NULL,NULL,''),
('9','vacationProcess:1:4','usertask1','5','6','填写申请',NULL,NULL,NULL,NULL,'2018-12-20 10:55:48',NULL,'2018-12-20 10:55:48',473,NULL,50,NULL,NULL,NULL,'');

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values 
('11','5','5',NULL,'applyUser','null',0,NULL,NULL,NULL,NULL,NULL,'2018-12-20 10:55:48','2018-12-20 10:55:48'),
('13','5','5',NULL,'days','integer',0,NULL,NULL,1,'1',NULL,'2018-12-20 10:55:48','2018-12-20 10:55:48'),
('15','5','5',NULL,'reason','string',0,NULL,NULL,NULL,'有紧急事情',NULL,'2018-12-20 10:55:48','2018-12-20 10:55:48'),
('27','21','21',NULL,'applyUser','null',0,NULL,NULL,NULL,NULL,NULL,'2018-12-20 10:56:40','2018-12-20 10:56:40'),
('29','21','21',NULL,'days','integer',0,NULL,NULL,1,'1',NULL,'2018-12-20 10:56:40','2018-12-20 10:56:40'),
('31','21','21',NULL,'reason','string',0,NULL,NULL,NULL,'有紧急事情',NULL,'2018-12-20 10:56:40','2018-12-20 10:56:40'),
('43','37','37',NULL,'applyUser','null',0,NULL,NULL,NULL,NULL,NULL,'2018-12-20 10:56:44','2018-12-20 10:56:44'),
('45','37','37',NULL,'days','integer',0,NULL,NULL,1,'1',NULL,'2018-12-20 10:56:44','2018-12-20 10:56:44'),
('47','37','37',NULL,'reason','string',0,NULL,NULL,NULL,'有紧急事情',NULL,'2018-12-20 10:56:44','2018-12-20 10:56:44'),
('60','53','53',NULL,'applyUser','string',0,NULL,NULL,NULL,'empa',NULL,'2018-12-20 11:02:32','2018-12-20 11:02:32'),
('62','53','53',NULL,'days','integer',0,NULL,NULL,1,'1',NULL,'2018-12-20 11:02:32','2018-12-20 11:02:32'),
('64','53','53',NULL,'reason','string',0,NULL,NULL,NULL,'有紧急事情',NULL,'2018-12-20 11:02:32','2018-12-20 11:02:32'),
('71','53','53',NULL,'result','string',0,NULL,NULL,NULL,'审核通过',NULL,'2018-12-20 11:03:44','2018-12-20 11:03:44'),
('73','53','53',NULL,'auditTime','date',0,NULL,NULL,1545275024441,NULL,NULL,'2018-12-20 11:03:44','2018-12-20 11:03:44'),
('75','53','53',NULL,'auditor','string',0,NULL,NULL,NULL,'managea',NULL,'2018-12-20 11:03:44','2018-12-20 11:03:44'),
('79','37','37',NULL,'result','string',0,NULL,NULL,NULL,'审核通过',NULL,'2018-12-20 11:03:51','2018-12-20 11:03:51'),
('81','37','37',NULL,'auditTime','date',0,NULL,NULL,1545275031566,NULL,NULL,'2018-12-20 11:03:51','2018-12-20 11:03:51'),
('83','37','37',NULL,'auditor','string',0,NULL,NULL,NULL,'managea',NULL,'2018-12-20 11:03:51','2018-12-20 11:03:51'),
('87','5','5',NULL,'result','string',0,NULL,NULL,NULL,'审核拒绝',NULL,'2018-12-20 11:03:55','2018-12-20 11:03:55'),
('89','5','5',NULL,'auditTime','date',0,NULL,NULL,1545275035494,NULL,NULL,'2018-12-20 11:03:55','2018-12-20 11:03:55'),
('91','5','5',NULL,'auditor','string',0,NULL,NULL,NULL,'managea',NULL,'2018-12-20 11:03:55','2018-12-20 11:03:55');

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values 
('dirGroup',1,'总监组',NULL),
('empGroup',1,'员工组',NULL),
('manageGroup',1,'经理组',NULL);

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values 
('dira','dirGroup'),
('empa','empGroup'),
('empb','empGroup'),
('managea','manageGroup'),
('manageb','manageGroup');

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values 
('admin',1,NULL,NULL,NULL,'123456',NULL),
('dira',1,NULL,NULL,NULL,'123456',NULL),
('empa',1,NULL,NULL,NULL,'123456',NULL),
('empb',1,NULL,NULL,NULL,'123456',NULL),
('managea',1,NULL,NULL,NULL,'123456',NULL),
('manageb',1,NULL,NULL,NULL,'123456',NULL);

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`ENGINE_VERSION_`) values 
('1','SpringAutoDeployment',NULL,NULL,'','2018-12-20 10:53:35',NULL),
('5001','SpringAutoDeployment',NULL,NULL,'','2018-12-20 21:17:17',NULL),
('7501','SpringAutoDeployment',NULL,NULL,'','2018-12-22 23:13:52',NULL);

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`) values 
('vacationProcess:1:4',1,'http://www.activiti.org/test','请假流程','vacationProcess',1,'1','E:\\ws_iot\\activiti-demo6\\target\\classes\\processes\\vacation.bpmn','E:\\ws_iot\\activiti-demo6\\target\\classes\\processes\\vacation.vacationProcess.png',NULL,0,1,1,'',NULL),
('vacationProcess:2:5004',1,'http://www.activiti.org/test','请假流程','vacationProcess',2,'5001','D:\\ws_idea\\activiti6\\target\\classes\\processes\\vacation.bpmn','D:\\ws_idea\\activiti6\\target\\classes\\processes\\vacation.vacationProcess.png',NULL,0,1,1,'',NULL),
('vacationProcess:3:7504',1,'http://www.activiti.org/test','请假流程','vacationProcess',3,'7501','D:\\ws_idea\\activiti-demo6\\target\\classes\\processes\\vacation.bpmn','D:\\ws_idea\\activiti-demo6\\target\\classes\\processes\\vacation.vacationProcess.png',NULL,0,1,1,'',NULL);

/*Table structure for table `act_ru_deadletter_job` */

DROP TABLE IF EXISTS `act_ru_deadletter_job`;

CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_deadletter_job` */

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`) values 
('21',1,'21',NULL,NULL,'vacationProcess:1:4',NULL,'21',NULL,1,0,1,0,0,1,NULL,'',NULL,'2018-12-20 10:56:40',NULL,NULL,0,0,0,0,0,0,0,0,0),
('22',2,'21',NULL,'21','vacationProcess:1:4',NULL,'21','usertask2',1,0,0,0,0,1,NULL,'',NULL,'2018-12-20 10:56:40',NULL,NULL,0,0,0,0,0,0,0,0,0);

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values 
('36',1,'manageGroup','candidate',NULL,'35',NULL,NULL);

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_suspended_job` */

DROP TABLE IF EXISTS `act_ru_suspended_job`;

CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_suspended_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`) values 
('35',1,'22','21','vacationProcess:1:4','总监审批',NULL,NULL,'usertask2',NULL,NULL,NULL,50,'2018-12-20 10:56:40',NULL,NULL,1,'',NULL,NULL);

/*Table structure for table `act_ru_timer_job` */

DROP TABLE IF EXISTS `act_ru_timer_job`;

CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_timer_job` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values 
('27',1,'null','applyUser','21','21',NULL,NULL,NULL,NULL,NULL,NULL),
('29',1,'integer','days','21','21',NULL,NULL,NULL,1,'1',NULL),
('31',1,'string','reason','21','21',NULL,NULL,NULL,NULL,'有紧急事情',NULL);

/*Table structure for table `sys_device` */

DROP TABLE IF EXISTS `sys_device`;

CREATE TABLE `sys_device` (
  `device_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `device_name` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `device_type` char(2) DEFAULT NULL COMMENT '设备类型',
  `device_reg_id` varchar(50) DEFAULT NULL COMMENT '第三方后台设备ID',
  `device_imei` varchar(500) DEFAULT NULL COMMENT '设备imei',
  `status` char(1) DEFAULT '0' COMMENT '设备状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `device_dept_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `deviceData` varchar(50) DEFAULT NULL,
  `deviceRspData` varchar(50) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `password` varchar(6) DEFAULT NULL,
  `dynamic_password` varchar(6) DEFAULT NULL,
  `password_flag` varchar(1) DEFAULT NULL,
  `dynamic_password_flag` varchar(1) DEFAULT NULL,
  `temp_password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知公告表';

/*Data for the table `sys_device` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

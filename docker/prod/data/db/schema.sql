



DROP DATABASE IF EXISTS camunda;

CREATE DATABASE camunda;

USE camunda;



-- MySQL dump 10.17  Distrib 10.3.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: camunda
-- ------------------------------------------------------
-- Server version	10.3.14-MariaDB-1:10.3.14+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ACT_GE_BYTEARRAY`
--

DROP TABLE IF EXISTS `ACT_GE_BYTEARRAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_GE_BYTEARRAY` (
                                    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                    `REV_` int(11) DEFAULT NULL,
                                    `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `BYTES_` longblob DEFAULT NULL,
                                    `GENERATED_` tinyint(4) DEFAULT NULL,
                                    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `TYPE_` int(11) DEFAULT NULL,
                                    `CREATE_TIME_` datetime(3) DEFAULT NULL,
                                    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                    PRIMARY KEY (`ID_`),
                                    KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
                                    KEY `ACT_IDX_BYTEARRAY_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                    KEY `ACT_IDX_BYTEARRAY_RM_TIME` (`REMOVAL_TIME_`),
                                    KEY `ACT_IDX_BYTEARRAY_NAME` (`NAME_`),
                                    CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_BYTEARRAY`
--

LOCK TABLES `ACT_GE_BYTEARRAY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` DISABLE KEYS */;
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('fb129c4e-c6c1-11ea-a81e-0242ac17000f',1,'BOOT-INF/classes/bpmn/fire_check.bpmn','fb12753d-c6c1-11ea-a81e-0242ac17000f','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<bpmn:definitions xmlns:bpmn=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:camunda=\"http://camunda.org/schema/1.0/bpmn\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" id=\"Definitions_0an2ffa\" targetNamespace=\"http://bpmn.io/schema/bpmn\" exporter=\"Camunda Modeler\" exporterVersion=\"3.6.0\">\n  <bpmn:process id=\"construct-fire-check\" name=\"建设工程消防验收\" isExecutable=\"true\">\n    <bpmn:documentation>process description:${description}</bpmn:documentation>\n    <bpmn:startEvent id=\"StartEvent_1\">\n      <bpmn:extensionElements>\n        <camunda:formData>\n          <camunda:formField id=\"reapply\" label=\"重新受理\" type=\"boolean\" defaultValue=\"false\" />\n          <camunda:formField id=\"approved\" label=\"通过\" type=\"boolean\" defaultValue=\"true\" />\n          <camunda:formField id=\"description\" label=\"业务描述\" type=\"string\" />\n          <camunda:formField id=\"define\" label=\"定义\" type=\"string\" />\n          <camunda:formField id=\"_key\" label=\"key\" type=\"string\" />\n          <camunda:formField id=\"_full\" type=\"boolean\" />\n        </camunda:formData>\n      </bpmn:extensionElements>\n      <bpmn:outgoing>SequenceFlow_1u8j3vd</bpmn:outgoing>\n    </bpmn:startEvent>\n    <bpmn:userTask id=\"Task_0uh9i46\" name=\"受理审核\" camunda:candidateGroups=\"camunda-fire-apply\">\n      <bpmn:documentation>&lt;strong&gt;建设工程消防${special ? \"验收\" : \"备案\"}${applyType eq \"First\" ? \"申请\"  : \"复查\"} - ${name}  - ${property eq \"NEW\" ? \"新建\" :  property eq \"MODIFY\"  ?  \"改建\"  : property eq \"BIG\" ? \"扩建\" : property eq \"MOVE\"  ? \"迁建\"  : \"临建\"}  - ${inRandom ? \"抽中\"  : \"未抽中\"}&lt;/strong&gt; &lt;strong&gt;申请单位:&lt;/strong&gt;${applyCorp}&lt;strong&gt; 开发单位:&lt;/strong&gt;${developer}</bpmn:documentation>\n      <bpmn:extensionElements>\n        <camunda:properties>\n          <camunda:property name=\"check\" value=\"approved\" />\n          <camunda:property name=\"view\" value=\"fire_check_view\" />\n          <camunda:property name=\"edit\" value=\"fire_apply_edit\" />\n        </camunda:properties>\n        <camunda:inputOutput>\n          <camunda:inputParameter name=\"Input_0ho5lt3\" />\n        </camunda:inputOutput>\n      </bpmn:extensionElements>\n      <bpmn:incoming>SequenceFlow_14txz14</bpmn:incoming>\n      <bpmn:incoming>SequenceFlow_1nv4xu1</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_05iexw2</bpmn:outgoing>\n    </bpmn:userTask>\n    <bpmn:userTask id=\"Task_1n7az2l\" name=\"现场勘查\" camunda:candidateGroups=\"camunda-fire-site\">\n      <bpmn:documentation>&lt;strong&gt;建设工程消防${special ? \"验收\" : \"备案\"}${applyType eq \"First\" ? \"申请\"  : \"复查\"} - ${name}  - ${property eq \"NEW\" ? \"新建\" :  property eq \"MODIFY\"  ?  \"改建\"  : property eq \"BIG\" ? \"扩建\" : property eq \"MOVE\"  ? \"迁建\"  : \"临建\"}  - ${inRandom ? \"抽中\"  : \"未抽中\"}&lt;/strong&gt; &lt;strong&gt;申请单位:&lt;/strong&gt;${applyCorp}&lt;strong&gt; 开发单位:&lt;/strong&gt;${developer}</bpmn:documentation>\n      <bpmn:extensionElements>\n        <camunda:properties>\n          <camunda:property name=\"view\" value=\"fire_check_view\" />\n          <camunda:property name=\"check\" value=\"approved\" />\n          <camunda:property name=\"edit\" value=\"fire_check_opinion\" />\n        </camunda:properties>\n      </bpmn:extensionElements>\n      <bpmn:incoming>SequenceFlow_1sz5hh2</bpmn:incoming>\n      <bpmn:incoming>SequenceFlow_0memgd9</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_0dqam8z</bpmn:outgoing>\n    </bpmn:userTask>\n    <bpmn:exclusiveGateway id=\"ExclusiveGateway_096df9l\">\n      <bpmn:incoming>SequenceFlow_05iexw2</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_1j45le8</bpmn:outgoing>\n      <bpmn:outgoing>SequenceFlow_0cshi8n</bpmn:outgoing>\n      <bpmn:outgoing>SequenceFlow_0u19gym</bpmn:outgoing>\n    </bpmn:exclusiveGateway>\n    <bpmn:sequenceFlow id=\"SequenceFlow_05iexw2\" sourceRef=\"Task_0uh9i46\" targetRef=\"ExclusiveGateway_096df9l\" />\n    <bpmn:sequenceFlow id=\"SequenceFlow_1j45le8\" name=\"通过\" sourceRef=\"ExclusiveGateway_096df9l\" targetRef=\"Task_0mudfeh\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${ !(applyType eq \'Review\' ) &amp;&amp; approved}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:serviceTask id=\"Task_0dbpyfv\" name=\"检查不合格\" camunda:delegateExpression=\"${unqualifiedDelegate}\">\n      <bpmn:incoming>SequenceFlow_0nh0axe</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_1udhdj1</bpmn:outgoing>\n    </bpmn:serviceTask>\n    <bpmn:sequenceFlow id=\"SequenceFlow_0cshi8n\" sourceRef=\"ExclusiveGateway_096df9l\" targetRef=\"Task_05swjnd\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${!approved}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:serviceTask id=\"Task_05swjnd\" name=\"不予受理\" camunda:delegateExpression=\"${noAcceptDelegate}\">\n      <bpmn:incoming>SequenceFlow_0cshi8n</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_163vend</bpmn:outgoing>\n    </bpmn:serviceTask>\n    <bpmn:endEvent id=\"EndEvent_0j9rh26\">\n      <bpmn:incoming>SequenceFlow_163vend</bpmn:incoming>\n    </bpmn:endEvent>\n    <bpmn:sequenceFlow id=\"SequenceFlow_163vend\" sourceRef=\"Task_05swjnd\" targetRef=\"EndEvent_0j9rh26\" />\n    <bpmn:userTask id=\"Task_1qebp26\" name=\"窗口受理\" camunda:candidateGroups=\"camunda-fire-apply\">\n      <bpmn:documentation>&lt;strong&gt;建设工程消防${special ? \"验收\" : \"备案\"}${applyType eq \"First\" ? \"申请\"  : \"复查\"} - ${name}  - ${property eq \"NEW\" ? \"新建\" :  property eq \"MODIFY\"  ?  \"改建\"  : property eq \"BIG\" ? \"扩建\" : property eq \"MOVE\"  ? \"迁建\"  : \"临建\"}  - ${inRandom ? \"抽中\"  : \"未抽中\"}&lt;/strong&gt; &lt;strong&gt;申请单位:&lt;/strong&gt;${applyCorp}&lt;strong&gt; 开发单位:&lt;/strong&gt;${developer}</bpmn:documentation>\n      <bpmn:extensionElements>\n        <camunda:properties>\n          <camunda:property name=\"view\" value=\"fire_check_view\" />\n        </camunda:properties>\n        <camunda:executionListener delegateExpression=\"${generateDocuments}\" event=\"start\" />\n      </bpmn:extensionElements>\n      <bpmn:incoming>SequenceFlow_13a5k75</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_14txz14</bpmn:outgoing>\n    </bpmn:userTask>\n    <bpmn:sequenceFlow id=\"SequenceFlow_14txz14\" sourceRef=\"Task_1qebp26\" targetRef=\"Task_0uh9i46\" />\n    <bpmn:exclusiveGateway id=\"ExclusiveGateway_1a3z3is\">\n      <bpmn:incoming>SequenceFlow_1u8j3vd</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_13a5k75</bpmn:outgoing>\n      <bpmn:outgoing>SequenceFlow_1nv4xu1</bpmn:outgoing>\n    </bpmn:exclusiveGateway>\n    <bpmn:sequenceFlow id=\"SequenceFlow_13a5k75\" sourceRef=\"ExclusiveGateway_1a3z3is\" targetRef=\"Task_1qebp26\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${!_full}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:sequenceFlow id=\"SequenceFlow_1nv4xu1\" sourceRef=\"ExclusiveGateway_1a3z3is\" targetRef=\"Task_0uh9i46\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${_full}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:sequenceFlow id=\"SequenceFlow_1u8j3vd\" sourceRef=\"StartEvent_1\" targetRef=\"ExclusiveGateway_1a3z3is\" />\n    <bpmn:serviceTask id=\"Task_0mudfeh\" name=\"受理业务\" camunda:delegateExpression=\"${fireApplyDelegate}\">\n      <bpmn:incoming>SequenceFlow_1j45le8</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_1l4fp3d</bpmn:outgoing>\n    </bpmn:serviceTask>\n    <bpmn:exclusiveGateway id=\"ExclusiveGateway_0xme57s\">\n      <bpmn:incoming>SequenceFlow_1l4fp3d</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_1ppf1wk</bpmn:outgoing>\n      <bpmn:outgoing>SequenceFlow_0memgd9</bpmn:outgoing>\n    </bpmn:exclusiveGateway>\n    <bpmn:sequenceFlow id=\"SequenceFlow_1l4fp3d\" sourceRef=\"Task_0mudfeh\" targetRef=\"ExclusiveGateway_0xme57s\" />\n    <bpmn:serviceTask id=\"Task_167xclj\" name=\"复查\" camunda:delegateExpression=\"${reviewDelegate}\">\n      <bpmn:incoming>SequenceFlow_0u19gym</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_1sz5hh2</bpmn:outgoing>\n    </bpmn:serviceTask>\n    <bpmn:endEvent id=\"EndEvent_0vheplo\">\n      <bpmn:incoming>SequenceFlow_1udhdj1</bpmn:incoming>\n    </bpmn:endEvent>\n    <bpmn:sequenceFlow id=\"SequenceFlow_1udhdj1\" sourceRef=\"Task_0dbpyfv\" targetRef=\"EndEvent_0vheplo\" />\n    <bpmn:exclusiveGateway id=\"ExclusiveGateway_1uiy91d\">\n      <bpmn:incoming>SequenceFlow_0dqam8z</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_0nh0axe</bpmn:outgoing>\n      <bpmn:outgoing>SequenceFlow_0kgtd9a</bpmn:outgoing>\n    </bpmn:exclusiveGateway>\n    <bpmn:sequenceFlow id=\"SequenceFlow_0dqam8z\" sourceRef=\"Task_1n7az2l\" targetRef=\"ExclusiveGateway_1uiy91d\" />\n    <bpmn:sequenceFlow id=\"SequenceFlow_0nh0axe\" sourceRef=\"ExclusiveGateway_1uiy91d\" targetRef=\"Task_0dbpyfv\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${!approved}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:sequenceFlow id=\"SequenceFlow_0u19gym\" name=\"复查\" sourceRef=\"ExclusiveGateway_096df9l\" targetRef=\"Task_167xclj\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${ applyType eq \'Review\' &amp;&amp; approved}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:serviceTask id=\"Task_0o47mcq\" name=\"检查合格\" camunda:delegateExpression=\"${qualifiedDelegate}\">\n      <bpmn:incoming>SequenceFlow_0kgtd9a</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_19r90ee</bpmn:outgoing>\n    </bpmn:serviceTask>\n    <bpmn:sequenceFlow id=\"SequenceFlow_0kgtd9a\" sourceRef=\"ExclusiveGateway_1uiy91d\" targetRef=\"Task_0o47mcq\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${approved}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:endEvent id=\"EndEvent_1dcwx6n\">\n      <bpmn:incoming>SequenceFlow_19r90ee</bpmn:incoming>\n    </bpmn:endEvent>\n    <bpmn:sequenceFlow id=\"SequenceFlow_19r90ee\" sourceRef=\"Task_0o47mcq\" targetRef=\"EndEvent_1dcwx6n\" />\n    <bpmn:sequenceFlow id=\"SequenceFlow_1ppf1wk\" name=\"未抽中\" sourceRef=\"ExclusiveGateway_0xme57s\" targetRef=\"Task_0na8bcb\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${!special &amp;&amp; !inRandom}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n    <bpmn:serviceTask id=\"Task_0na8bcb\" name=\"备案\" camunda:delegateExpression=\"${recordDelegate}\">\n      <bpmn:incoming>SequenceFlow_1ppf1wk</bpmn:incoming>\n      <bpmn:outgoing>SequenceFlow_15oe4s9</bpmn:outgoing>\n    </bpmn:serviceTask>\n    <bpmn:endEvent id=\"EndEvent_0qs0y8v\">\n      <bpmn:incoming>SequenceFlow_15oe4s9</bpmn:incoming>\n    </bpmn:endEvent>\n    <bpmn:sequenceFlow id=\"SequenceFlow_15oe4s9\" sourceRef=\"Task_0na8bcb\" targetRef=\"EndEvent_0qs0y8v\" />\n    <bpmn:sequenceFlow id=\"SequenceFlow_1sz5hh2\" sourceRef=\"Task_167xclj\" targetRef=\"Task_1n7az2l\" />\n    <bpmn:sequenceFlow id=\"SequenceFlow_0memgd9\" name=\"特殊工程/抽查\" sourceRef=\"ExclusiveGateway_0xme57s\" targetRef=\"Task_1n7az2l\">\n      <bpmn:conditionExpression xsi:type=\"bpmn:tFormalExpression\">${special || inRandom}</bpmn:conditionExpression>\n    </bpmn:sequenceFlow>\n  </bpmn:process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_1\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_1\" bpmnElement=\"construct-fire-check\">\n      <bpmndi:BPMNShape id=\"_BPMNShape_StartEvent_2\" bpmnElement=\"StartEvent_1\">\n        <dc:Bounds x=\"152\" y=\"202\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"149\" y=\"295\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"UserTask_09cp3wf_di\" bpmnElement=\"Task_0uh9i46\">\n        <dc:Bounds x=\"320\" y=\"180\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"UserTask_0h8a1y2_di\" bpmnElement=\"Task_1n7az2l\">\n        <dc:Bounds x=\"910\" y=\"80\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"ExclusiveGateway_096df9l_di\" bpmnElement=\"ExclusiveGateway_096df9l\" isMarkerVisible=\"true\">\n        <dc:Bounds x=\"465\" y=\"195\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_05iexw2_di\" bpmnElement=\"SequenceFlow_05iexw2\">\n        <di:waypoint x=\"420\" y=\"220\" />\n        <di:waypoint x=\"465\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1j45le8_di\" bpmnElement=\"SequenceFlow_1j45le8\">\n        <di:waypoint x=\"515\" y=\"220\" />\n        <di:waypoint x=\"570\" y=\"220\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"532\" y=\"202\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"ServiceTask_0wu0sl1_di\" bpmnElement=\"Task_0dbpyfv\">\n        <dc:Bounds x=\"1040\" y=\"280\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_0cshi8n_di\" bpmnElement=\"SequenceFlow_0cshi8n\">\n        <di:waypoint x=\"490\" y=\"245\" />\n        <di:waypoint x=\"490\" y=\"320\" />\n        <di:waypoint x=\"570\" y=\"320\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"ServiceTask_1pmralp_di\" bpmnElement=\"Task_05swjnd\">\n        <dc:Bounds x=\"570\" y=\"280\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"EndEvent_0j9rh26_di\" bpmnElement=\"EndEvent_0j9rh26\">\n        <dc:Bounds x=\"712\" y=\"372\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_163vend_di\" bpmnElement=\"SequenceFlow_163vend\">\n        <di:waypoint x=\"620\" y=\"360\" />\n        <di:waypoint x=\"620\" y=\"390\" />\n        <di:waypoint x=\"712\" y=\"390\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"UserTask_0r36c9l_di\" bpmnElement=\"Task_1qebp26\">\n        <dc:Bounds x=\"320\" y=\"280\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_14txz14_di\" bpmnElement=\"SequenceFlow_14txz14\">\n        <di:waypoint x=\"370\" y=\"280\" />\n        <di:waypoint x=\"370\" y=\"260\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"ExclusiveGateway_1a3z3is_di\" bpmnElement=\"ExclusiveGateway_1a3z3is\" isMarkerVisible=\"true\">\n        <dc:Bounds x=\"225\" y=\"195\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_13a5k75_di\" bpmnElement=\"SequenceFlow_13a5k75\">\n        <di:waypoint x=\"250\" y=\"245\" />\n        <di:waypoint x=\"250\" y=\"320\" />\n        <di:waypoint x=\"320\" y=\"320\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1nv4xu1_di\" bpmnElement=\"SequenceFlow_1nv4xu1\">\n        <di:waypoint x=\"275\" y=\"220\" />\n        <di:waypoint x=\"320\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1u8j3vd_di\" bpmnElement=\"SequenceFlow_1u8j3vd\">\n        <di:waypoint x=\"188\" y=\"220\" />\n        <di:waypoint x=\"225\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"ServiceTask_0da4556_di\" bpmnElement=\"Task_0mudfeh\">\n        <dc:Bounds x=\"570\" y=\"180\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"ExclusiveGateway_0xme57s_di\" bpmnElement=\"ExclusiveGateway_0xme57s\" isMarkerVisible=\"true\">\n        <dc:Bounds x=\"705\" y=\"195\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1l4fp3d_di\" bpmnElement=\"SequenceFlow_1l4fp3d\">\n        <di:waypoint x=\"670\" y=\"220\" />\n        <di:waypoint x=\"705\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"ServiceTask_1r9tvhr_di\" bpmnElement=\"Task_167xclj\">\n        <dc:Bounds x=\"570\" y=\"80\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"EndEvent_0vheplo_di\" bpmnElement=\"EndEvent_0vheplo\">\n        <dc:Bounds x=\"1192\" y=\"302\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1udhdj1_di\" bpmnElement=\"SequenceFlow_1udhdj1\">\n        <di:waypoint x=\"1140\" y=\"320\" />\n        <di:waypoint x=\"1192\" y=\"320\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"ExclusiveGateway_1uiy91d_di\" bpmnElement=\"ExclusiveGateway_1uiy91d\" isMarkerVisible=\"true\">\n        <dc:Bounds x=\"935\" y=\"195\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_0dqam8z_di\" bpmnElement=\"SequenceFlow_0dqam8z\">\n        <di:waypoint x=\"960\" y=\"160\" />\n        <di:waypoint x=\"960\" y=\"195\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_0nh0axe_di\" bpmnElement=\"SequenceFlow_0nh0axe\">\n        <di:waypoint x=\"960\" y=\"245\" />\n        <di:waypoint x=\"960\" y=\"320\" />\n        <di:waypoint x=\"1040\" y=\"320\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_0u19gym_di\" bpmnElement=\"SequenceFlow_0u19gym\">\n        <di:waypoint x=\"490\" y=\"195\" />\n        <di:waypoint x=\"490\" y=\"120\" />\n        <di:waypoint x=\"570\" y=\"120\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"459\" y=\"155\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"ServiceTask_1t1dfse_di\" bpmnElement=\"Task_0o47mcq\">\n        <dc:Bounds x=\"1040\" y=\"180\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_0kgtd9a_di\" bpmnElement=\"SequenceFlow_0kgtd9a\">\n        <di:waypoint x=\"985\" y=\"220\" />\n        <di:waypoint x=\"1040\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"EndEvent_1dcwx6n_di\" bpmnElement=\"EndEvent_1dcwx6n\">\n        <dc:Bounds x=\"1192\" y=\"202\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_19r90ee_di\" bpmnElement=\"SequenceFlow_19r90ee\">\n        <di:waypoint x=\"1140\" y=\"220\" />\n        <di:waypoint x=\"1192\" y=\"220\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1ppf1wk_di\" bpmnElement=\"SequenceFlow_1ppf1wk\">\n        <di:waypoint x=\"730\" y=\"245\" />\n        <di:waypoint x=\"730\" y=\"320\" />\n        <di:waypoint x=\"790\" y=\"320\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"693\" y=\"272\" width=\"33\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"ServiceTask_0xmilh9_di\" bpmnElement=\"Task_0na8bcb\">\n        <dc:Bounds x=\"790\" y=\"280\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"EndEvent_0qs0y8v_di\" bpmnElement=\"EndEvent_0qs0y8v\">\n        <dc:Bounds x=\"932\" y=\"372\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_15oe4s9_di\" bpmnElement=\"SequenceFlow_15oe4s9\">\n        <di:waypoint x=\"840\" y=\"360\" />\n        <di:waypoint x=\"840\" y=\"390\" />\n        <di:waypoint x=\"932\" y=\"390\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_1sz5hh2_di\" bpmnElement=\"SequenceFlow_1sz5hh2\">\n        <di:waypoint x=\"670\" y=\"120\" />\n        <di:waypoint x=\"910\" y=\"120\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"SequenceFlow_0memgd9_di\" bpmnElement=\"SequenceFlow_0memgd9\">\n        <di:waypoint x=\"730\" y=\"195\" />\n        <di:waypoint x=\"730\" y=\"120\" />\n        <di:waypoint x=\"910\" y=\"120\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"680\" y=\"155\" width=\"70\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</bpmn:definitions>\n',0,NULL,1,'2020-07-16 01:38:23.000',NULL,NULL);
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_GE_PROPERTY`
--

DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_GE_PROPERTY` (
                                   `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
                                   `REV_` int(11) DEFAULT NULL,
                                   PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_PROPERTY`
--

LOCK TABLES `ACT_GE_PROPERTY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_PROPERTY` DISABLE KEYS */;
INSERT INTO `ACT_GE_PROPERTY` VALUES ('deployment.lock','0',1),('history.cleanup.job.lock','0',1),('historyLevel','3',1),('next.dbid','1',1),('schema.history','create(fox)',1),('schema.version','fox',1),('startup.lock','0',1);
/*!40000 ALTER TABLE `ACT_GE_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_GE_SCHEMA_LOG`
--

DROP TABLE IF EXISTS `ACT_GE_SCHEMA_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_GE_SCHEMA_LOG` (
                                     `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                     `TIMESTAMP_` datetime(3) DEFAULT NULL,
                                     `VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_SCHEMA_LOG`
--

LOCK TABLES `ACT_GE_SCHEMA_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_GE_SCHEMA_LOG` DISABLE KEYS */;
INSERT INTO `ACT_GE_SCHEMA_LOG` VALUES ('0','2020-07-16 01:38:08.000','7.12.0');
/*!40000 ALTER TABLE `ACT_GE_SCHEMA_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ACTINST`
--

DROP TABLE IF EXISTS `ACT_HI_ACTINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_ACTINST` (
                                  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `PARENT_ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
                                  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `CALL_CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                  `ASSIGNEE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `START_TIME_` datetime(3) NOT NULL,
                                  `END_TIME_` datetime(3) DEFAULT NULL,
                                  `DURATION_` bigint(20) DEFAULT NULL,
                                  `ACT_INST_STATE_` int(11) DEFAULT NULL,
                                  `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
                                  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                  PRIMARY KEY (`ID_`),
                                  KEY `ACT_IDX_HI_ACTINST_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
                                  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
                                  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
                                  KEY `ACT_IDX_HI_ACT_INST_COMP` (`EXECUTION_ID_`,`ACT_ID_`,`END_TIME_`,`ID_`),
                                  KEY `ACT_IDX_HI_ACT_INST_STATS` (`PROC_DEF_ID_`,`PROC_INST_ID_`,`ACT_ID_`,`END_TIME_`,`ACT_INST_STATE_`),
                                  KEY `ACT_IDX_HI_ACT_INST_TENANT_ID` (`TENANT_ID_`),
                                  KEY `ACT_IDX_HI_ACT_INST_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
                                  KEY `ACT_IDX_HI_AI_PDEFID_END_TIME` (`PROC_DEF_ID_`,`END_TIME_`),
                                  KEY `ACT_IDX_HI_ACT_INST_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ACTINST`
--

LOCK TABLES `ACT_HI_ACTINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ACTINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_ACTINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ATTACHMENT`
--

DROP TABLE IF EXISTS `ACT_HI_ATTACHMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_ATTACHMENT` (
                                     `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                     `REV_` int(11) DEFAULT NULL,
                                     `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                     `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                     `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                     `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                     `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                     `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                     `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                     `CREATE_TIME_` datetime(3) DEFAULT NULL,
                                     `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                     PRIMARY KEY (`ID_`),
                                     KEY `ACT_IDX_HI_ATTACHMENT_CONTENT` (`CONTENT_ID_`),
                                     KEY `ACT_IDX_HI_ATTACHMENT_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                     KEY `ACT_IDX_HI_ATTACHMENT_PROCINST` (`PROC_INST_ID_`),
                                     KEY `ACT_IDX_HI_ATTACHMENT_TASK` (`TASK_ID_`),
                                     KEY `ACT_IDX_HI_ATTACHMENT_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ATTACHMENT`
--

LOCK TABLES `ACT_HI_ATTACHMENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ATTACHMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_ATTACHMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_BATCH`
--

DROP TABLE IF EXISTS `ACT_HI_BATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_BATCH` (
                                `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `TOTAL_JOBS_` int(11) DEFAULT NULL,
                                `JOBS_PER_SEED_` int(11) DEFAULT NULL,
                                `INVOCATIONS_PER_JOB_` int(11) DEFAULT NULL,
                                `SEED_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                `MONITOR_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                `BATCH_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                `CREATE_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `START_TIME_` datetime(3) NOT NULL,
                                `END_TIME_` datetime(3) DEFAULT NULL,
                                `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                PRIMARY KEY (`ID_`),
                                KEY `ACT_HI_BAT_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_BATCH`
--

LOCK TABLES `ACT_HI_BATCH` WRITE;
/*!40000 ALTER TABLE `ACT_HI_BATCH` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_BATCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_CASEACTINST`
--

DROP TABLE IF EXISTS `ACT_HI_CASEACTINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_CASEACTINST` (
                                      `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                      `PARENT_ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                      `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                      `CASE_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                      `CASE_ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
                                      `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                      `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                      `CALL_CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                      `CASE_ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                      `CASE_ACT_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                      `CREATE_TIME_` datetime(3) NOT NULL,
                                      `END_TIME_` datetime(3) DEFAULT NULL,
                                      `DURATION_` bigint(20) DEFAULT NULL,
                                      `STATE_` int(11) DEFAULT NULL,
                                      `REQUIRED_` tinyint(1) DEFAULT NULL,
                                      `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                      PRIMARY KEY (`ID_`),
                                      KEY `ACT_IDX_HI_CAS_A_I_CREATE` (`CREATE_TIME_`),
                                      KEY `ACT_IDX_HI_CAS_A_I_END` (`END_TIME_`),
                                      KEY `ACT_IDX_HI_CAS_A_I_COMP` (`CASE_ACT_ID_`,`END_TIME_`,`ID_`),
                                      KEY `ACT_IDX_HI_CAS_A_I_CASEINST` (`CASE_INST_ID_`,`CASE_ACT_ID_`),
                                      KEY `ACT_IDX_HI_CAS_A_I_TENANT_ID` (`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_CASEACTINST`
--

LOCK TABLES `ACT_HI_CASEACTINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_CASEACTINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_CASEACTINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_CASEINST`
--

DROP TABLE IF EXISTS `ACT_HI_CASEINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_CASEINST` (
                                   `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `CASE_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `CREATE_TIME_` datetime(3) NOT NULL,
                                   `CLOSE_TIME_` datetime(3) DEFAULT NULL,
                                   `DURATION_` bigint(20) DEFAULT NULL,
                                   `STATE_` int(11) DEFAULT NULL,
                                   `CREATE_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `SUPER_CASE_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   PRIMARY KEY (`ID_`),
                                   UNIQUE KEY `CASE_INST_ID_` (`CASE_INST_ID_`),
                                   KEY `ACT_IDX_HI_CAS_I_CLOSE` (`CLOSE_TIME_`),
                                   KEY `ACT_IDX_HI_CAS_I_BUSKEY` (`BUSINESS_KEY_`),
                                   KEY `ACT_IDX_HI_CAS_I_TENANT_ID` (`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_CASEINST`
--

LOCK TABLES `ACT_HI_CASEINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_CASEINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_CASEINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_COMMENT`
--

DROP TABLE IF EXISTS `ACT_HI_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_COMMENT` (
                                  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `TIME_` datetime(3) NOT NULL,
                                  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `FULL_MSG_` longblob DEFAULT NULL,
                                  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                  PRIMARY KEY (`ID_`),
                                  KEY `ACT_IDX_HI_COMMENT_TASK` (`TASK_ID_`),
                                  KEY `ACT_IDX_HI_COMMENT_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                  KEY `ACT_IDX_HI_COMMENT_PROCINST` (`PROC_INST_ID_`),
                                  KEY `ACT_IDX_HI_COMMENT_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_COMMENT`
--

LOCK TABLES `ACT_HI_COMMENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_COMMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_DECINST`
--

DROP TABLE IF EXISTS `ACT_HI_DECINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_DECINST` (
                                  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `DEC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `DEC_DEF_KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
                                  `DEC_DEF_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `CASE_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `EVAL_TIME_` datetime(3) NOT NULL,
                                  `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                  `COLLECT_VALUE_` double DEFAULT NULL,
                                  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `ROOT_DEC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `DEC_REQ_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `DEC_REQ_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  PRIMARY KEY (`ID_`),
                                  KEY `ACT_IDX_HI_DEC_INST_ID` (`DEC_DEF_ID_`),
                                  KEY `ACT_IDX_HI_DEC_INST_KEY` (`DEC_DEF_KEY_`),
                                  KEY `ACT_IDX_HI_DEC_INST_PI` (`PROC_INST_ID_`),
                                  KEY `ACT_IDX_HI_DEC_INST_CI` (`CASE_INST_ID_`),
                                  KEY `ACT_IDX_HI_DEC_INST_ACT` (`ACT_ID_`),
                                  KEY `ACT_IDX_HI_DEC_INST_ACT_INST` (`ACT_INST_ID_`),
                                  KEY `ACT_IDX_HI_DEC_INST_TIME` (`EVAL_TIME_`),
                                  KEY `ACT_IDX_HI_DEC_INST_TENANT_ID` (`TENANT_ID_`),
                                  KEY `ACT_IDX_HI_DEC_INST_ROOT_ID` (`ROOT_DEC_INST_ID_`),
                                  KEY `ACT_IDX_HI_DEC_INST_REQ_ID` (`DEC_REQ_ID_`),
                                  KEY `ACT_IDX_HI_DEC_INST_REQ_KEY` (`DEC_REQ_KEY_`),
                                  KEY `ACT_IDX_HI_DEC_INST_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                  KEY `ACT_IDX_HI_DEC_INST_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_DECINST`
--

LOCK TABLES `ACT_HI_DECINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_DECINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_DECINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_DEC_IN`
--

DROP TABLE IF EXISTS `ACT_HI_DEC_IN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_DEC_IN` (
                                 `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                 `DEC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                 `CLAUSE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `CLAUSE_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                 `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
                                 `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `DOUBLE_` double DEFAULT NULL,
                                 `LONG_` bigint(20) DEFAULT NULL,
                                 `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                 `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                 `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `CREATE_TIME_` datetime(3) DEFAULT NULL,
                                 `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                 PRIMARY KEY (`ID_`),
                                 KEY `ACT_IDX_HI_DEC_IN_INST` (`DEC_INST_ID_`),
                                 KEY `ACT_IDX_HI_DEC_IN_CLAUSE` (`DEC_INST_ID_`,`CLAUSE_ID_`),
                                 KEY `ACT_IDX_HI_DEC_IN_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                 KEY `ACT_IDX_HI_DEC_IN_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_DEC_IN`
--

LOCK TABLES `ACT_HI_DEC_IN` WRITE;
/*!40000 ALTER TABLE `ACT_HI_DEC_IN` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_DEC_IN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_DEC_OUT`
--

DROP TABLE IF EXISTS `ACT_HI_DEC_OUT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_DEC_OUT` (
                                  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `DEC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `CLAUSE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `CLAUSE_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `RULE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `RULE_ORDER_` int(11) DEFAULT NULL,
                                  `VAR_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
                                  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `DOUBLE_` double DEFAULT NULL,
                                  `LONG_` bigint(20) DEFAULT NULL,
                                  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `CREATE_TIME_` datetime(3) DEFAULT NULL,
                                  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                  PRIMARY KEY (`ID_`),
                                  KEY `ACT_IDX_HI_DEC_OUT_INST` (`DEC_INST_ID_`),
                                  KEY `ACT_IDX_HI_DEC_OUT_RULE` (`RULE_ORDER_`,`CLAUSE_ID_`),
                                  KEY `ACT_IDX_HI_DEC_OUT_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                  KEY `ACT_IDX_HI_DEC_OUT_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_DEC_OUT`
--

LOCK TABLES `ACT_HI_DEC_OUT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_DEC_OUT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_DEC_OUT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_DETAIL`
--

DROP TABLE IF EXISTS `ACT_HI_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_DETAIL` (
                                 `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                 `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                 `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                 `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `CASE_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                 `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `VAR_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
                                 `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                 `REV_` int(11) DEFAULT NULL,
                                 `TIME_` datetime(3) NOT NULL,
                                 `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `DOUBLE_` double DEFAULT NULL,
                                 `LONG_` bigint(20) DEFAULT NULL,
                                 `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                 `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                 `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
                                 `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `OPERATION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                 PRIMARY KEY (`ID_`),
                                 KEY `ACT_IDX_HI_DETAIL_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                 KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
                                 KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
                                 KEY `ACT_IDX_HI_DETAIL_CASE_INST` (`CASE_INST_ID_`),
                                 KEY `ACT_IDX_HI_DETAIL_CASE_EXEC` (`CASE_EXECUTION_ID_`),
                                 KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
                                 KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
                                 KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`),
                                 KEY `ACT_IDX_HI_DETAIL_TENANT_ID` (`TENANT_ID_`),
                                 KEY `ACT_IDX_HI_DETAIL_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
                                 KEY `ACT_IDX_HI_DETAIL_BYTEAR` (`BYTEARRAY_ID_`),
                                 KEY `ACT_IDX_HI_DETAIL_RM_TIME` (`REMOVAL_TIME_`),
                                 KEY `ACT_IDX_HI_DETAIL_TASK_BYTEAR` (`BYTEARRAY_ID_`,`TASK_ID_`),
                                 KEY `ACT_IDX_HI_DETAIL_VAR_INST_ID` (`VAR_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_DETAIL`
--

LOCK TABLES `ACT_HI_DETAIL` WRITE;
/*!40000 ALTER TABLE `ACT_HI_DETAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_EXT_TASK_LOG`
--

DROP TABLE IF EXISTS `ACT_HI_EXT_TASK_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_EXT_TASK_LOG` (
                                       `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                       `TIMESTAMP_` timestamp(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
                                       `EXT_TASK_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                       `RETRIES_` int(11) DEFAULT NULL,
                                       `TOPIC_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `WORKER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `PRIORITY_` bigint(20) NOT NULL DEFAULT 0,
                                       `ERROR_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                       `ERROR_DETAILS_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `STATE_` int(11) DEFAULT NULL,
                                       `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                       PRIMARY KEY (`ID_`),
                                       KEY `ACT_HI_EXT_TASK_LOG_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                       KEY `ACT_HI_EXT_TASK_LOG_PROCINST` (`PROC_INST_ID_`),
                                       KEY `ACT_HI_EXT_TASK_LOG_PROCDEF` (`PROC_DEF_ID_`),
                                       KEY `ACT_HI_EXT_TASK_LOG_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
                                       KEY `ACT_HI_EXT_TASK_LOG_TENANT_ID` (`TENANT_ID_`),
                                       KEY `ACT_IDX_HI_EXTTASKLOG_ERRORDET` (`ERROR_DETAILS_ID_`),
                                       KEY `ACT_HI_EXT_TASK_LOG_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_EXT_TASK_LOG`
--

LOCK TABLES `ACT_HI_EXT_TASK_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_HI_EXT_TASK_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_EXT_TASK_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_IDENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_HI_IDENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_IDENTITYLINK` (
                                       `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                       `TIMESTAMP_` timestamp(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
                                       `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `OPERATION_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `ASSIGNER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                       PRIMARY KEY (`ID_`),
                                       KEY `ACT_IDX_HI_IDENT_LNK_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                       KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
                                       KEY `ACT_IDX_HI_IDENT_LNK_GROUP` (`GROUP_ID_`),
                                       KEY `ACT_IDX_HI_IDENT_LNK_TENANT_ID` (`TENANT_ID_`),
                                       KEY `ACT_IDX_HI_IDENT_LNK_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
                                       KEY `ACT_IDX_HI_IDENT_LINK_TASK` (`TASK_ID_`),
                                       KEY `ACT_IDX_HI_IDENT_LINK_RM_TIME` (`REMOVAL_TIME_`),
                                       KEY `ACT_IDX_HI_IDENT_LNK_TIMESTAMP` (`TIMESTAMP_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_IDENTITYLINK`
--

LOCK TABLES `ACT_HI_IDENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_INCIDENT`
--

DROP TABLE IF EXISTS `ACT_HI_INCIDENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_INCIDENT` (
                                   `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `CREATE_TIME_` timestamp(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
                                   `END_TIME_` timestamp(3) NULL DEFAULT NULL,
                                   `INCIDENT_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                   `INCIDENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                   `ACTIVITY_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `CAUSE_INCIDENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `ROOT_CAUSE_INCIDENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `HISTORY_CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `INCIDENT_STATE_` int(11) DEFAULT NULL,
                                   `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                   PRIMARY KEY (`ID_`),
                                   KEY `ACT_IDX_HI_INCIDENT_TENANT_ID` (`TENANT_ID_`),
                                   KEY `ACT_IDX_HI_INCIDENT_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
                                   KEY `ACT_IDX_HI_INCIDENT_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                   KEY `ACT_IDX_HI_INCIDENT_PROCINST` (`PROC_INST_ID_`),
                                   KEY `ACT_IDX_HI_INCIDENT_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_INCIDENT`
--

LOCK TABLES `ACT_HI_INCIDENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_INCIDENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_INCIDENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_JOB_LOG`
--

DROP TABLE IF EXISTS `ACT_HI_JOB_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_JOB_LOG` (
                                  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `TIMESTAMP_` datetime(3) NOT NULL,
                                  `JOB_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `JOB_DUEDATE_` datetime(3) DEFAULT NULL,
                                  `JOB_RETRIES_` int(11) DEFAULT NULL,
                                  `JOB_PRIORITY_` bigint(20) NOT NULL DEFAULT 0,
                                  `JOB_EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `JOB_EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `JOB_STATE_` int(11) DEFAULT NULL,
                                  `JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `JOB_DEF_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `JOB_DEF_CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `PROCESS_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `PROCESS_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
                                  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                  PRIMARY KEY (`ID_`),
                                  KEY `ACT_IDX_HI_JOB_LOG_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                  KEY `ACT_IDX_HI_JOB_LOG_PROCINST` (`PROCESS_INSTANCE_ID_`),
                                  KEY `ACT_IDX_HI_JOB_LOG_PROCDEF` (`PROCESS_DEF_ID_`),
                                  KEY `ACT_IDX_HI_JOB_LOG_TENANT_ID` (`TENANT_ID_`),
                                  KEY `ACT_IDX_HI_JOB_LOG_JOB_DEF_ID` (`JOB_DEF_ID_`),
                                  KEY `ACT_IDX_HI_JOB_LOG_PROC_DEF_KEY` (`PROCESS_DEF_KEY_`),
                                  KEY `ACT_IDX_HI_JOB_LOG_EX_STACK` (`JOB_EXCEPTION_STACK_ID_`),
                                  KEY `ACT_IDX_HI_JOB_LOG_RM_TIME` (`REMOVAL_TIME_`),
                                  KEY `ACT_IDX_HI_JOB_LOG_JOB_CONF` (`JOB_DEF_CONFIGURATION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_JOB_LOG`
--

LOCK TABLES `ACT_HI_JOB_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_HI_JOB_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_JOB_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_OP_LOG`
--

DROP TABLE IF EXISTS `ACT_HI_OP_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_OP_LOG` (
                                 `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                 `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                 `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `JOB_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `BATCH_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                 `TIMESTAMP_` timestamp(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
                                 `OPERATION_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `OPERATION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `ENTITY_TYPE_` varchar(30) COLLATE utf8_bin DEFAULT NULL,
                                 `PROPERTY_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `ORG_VALUE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                 `NEW_VALUE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                 `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                 `CATEGORY_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `EXTERNAL_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `ANNOTATION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                 PRIMARY KEY (`ID_`),
                                 KEY `ACT_IDX_HI_OP_LOG_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                 KEY `ACT_IDX_HI_OP_LOG_PROCINST` (`PROC_INST_ID_`),
                                 KEY `ACT_IDX_HI_OP_LOG_PROCDEF` (`PROC_DEF_ID_`),
                                 KEY `ACT_IDX_HI_OP_LOG_TASK` (`TASK_ID_`),
                                 KEY `ACT_IDX_HI_OP_LOG_RM_TIME` (`REMOVAL_TIME_`),
                                 KEY `ACT_IDX_HI_OP_LOG_TIMESTAMP` (`TIMESTAMP_`),
                                 KEY `ACT_IDX_HI_OP_LOG_USER_ID` (`USER_ID_`),
                                 KEY `ACT_IDX_HI_OP_LOG_OP_TYPE` (`OPERATION_TYPE_`),
                                 KEY `ACT_IDX_HI_OP_LOG_ENTITY_TYPE` (`ENTITY_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_OP_LOG`
--

LOCK TABLES `ACT_HI_OP_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_HI_OP_LOG` DISABLE KEYS */;
INSERT INTO `ACT_HI_OP_LOG` VALUES ('0ab2be75-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:45:58.000','Create','0ab2be74-c6c3-11ea-a5b8-0242ac170011','Authorization','permissionBits',NULL,'10',NULL,NULL,'Admin',NULL,NULL),('0ab2be76-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:45:58.000','Create','0ab2be74-c6c3-11ea-a5b8-0242ac170011','Authorization','permissions',NULL,'READ, CREATE',NULL,NULL,'Admin',NULL,NULL),('0ab2e587-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:45:58.000','Create','0ab2be74-c6c3-11ea-a5b8-0242ac170011','Authorization','type',NULL,'1',NULL,NULL,'Admin',NULL,NULL),('0ab2e588-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:45:58.000','Create','0ab2be74-c6c3-11ea-a5b8-0242ac170011','Authorization','resource',NULL,'ProcessInstance',NULL,NULL,'Admin',NULL,NULL),('0ab2e589-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:45:58.000','Create','0ab2be74-c6c3-11ea-a5b8-0242ac170011','Authorization','resourceId',NULL,'*',NULL,NULL,'Admin',NULL,NULL),('0ab30c9a-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:45:58.000','Create','0ab2be74-c6c3-11ea-a5b8-0242ac170011','Authorization','groupId',NULL,'camunda-fire-apply',NULL,NULL,'Admin',NULL,NULL),('20c4287d-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:46:35.000','Create','20c4016c-c6c3-11ea-a5b8-0242ac170011','Authorization','permissionBits',NULL,'2',NULL,NULL,'Admin',NULL,NULL),('20c4287e-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:46:35.000','Create','20c4016c-c6c3-11ea-a5b8-0242ac170011','Authorization','permissions',NULL,'READ',NULL,NULL,'Admin',NULL,NULL),('20c4287f-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:46:35.000','Create','20c4016c-c6c3-11ea-a5b8-0242ac170011','Authorization','type',NULL,'1',NULL,NULL,'Admin',NULL,NULL),('20c44f90-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:46:35.000','Create','20c4016c-c6c3-11ea-a5b8-0242ac170011','Authorization','resource',NULL,'ProcessInstance',NULL,NULL,'Admin',NULL,NULL),('20c44f91-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:46:35.000','Create','20c4016c-c6c3-11ea-a5b8-0242ac170011','Authorization','resourceId',NULL,'*',NULL,NULL,'Admin',NULL,NULL),('20c44f92-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:46:35.000','Create','20c4016c-c6c3-11ea-a5b8-0242ac170011','Authorization','groupId',NULL,'camunda-fire-site',NULL,NULL,'Admin',NULL,NULL),('2fc78ac5-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:47:01.000','Create','2fc78ac4-c6c3-11ea-a5b8-0242ac170011','Authorization','permissionBits',NULL,'2147483647',NULL,NULL,'Admin',NULL,NULL),('2fc78ac6-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:47:01.000','Create','2fc78ac4-c6c3-11ea-a5b8-0242ac170011','Authorization','permissions',NULL,'ALL',NULL,NULL,'Admin',NULL,NULL),('2fc7b1d7-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:47:01.000','Create','2fc78ac4-c6c3-11ea-a5b8-0242ac170011','Authorization','type',NULL,'1',NULL,NULL,'Admin',NULL,NULL),('2fc7b1d8-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:47:01.000','Create','2fc78ac4-c6c3-11ea-a5b8-0242ac170011','Authorization','resource',NULL,'ProcessInstance',NULL,NULL,'Admin',NULL,NULL),('2fc7b1d9-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:47:01.000','Create','2fc78ac4-c6c3-11ea-a5b8-0242ac170011','Authorization','resourceId',NULL,'*',NULL,NULL,'Admin',NULL,NULL),('2fc7d8ea-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:47:01.000','Create','2fc78ac4-c6c3-11ea-a5b8-0242ac170011','Authorization','groupId',NULL,'SCOPE_Extends',NULL,NULL,'Admin',NULL,NULL),('38a3e9ed-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:47:15.000','Create','38a3e9ec-c6c3-11ea-a5b8-0242ac170011','Authorization','permissionBits',NULL,'8',NULL,NULL,'Admin',NULL,NULL),('38a410fe-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:47:15.000','Create','38a3e9ec-c6c3-11ea-a5b8-0242ac170011','Authorization','permissions',NULL,'CREATE',NULL,NULL,'Admin',NULL,NULL),('38a410ff-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:47:15.000','Create','38a3e9ec-c6c3-11ea-a5b8-0242ac170011','Authorization','type',NULL,'1',NULL,NULL,'Admin',NULL,NULL),('38a41100-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:47:15.000','Create','38a3e9ec-c6c3-11ea-a5b8-0242ac170011','Authorization','resource',NULL,'ProcessInstance',NULL,NULL,'Admin',NULL,NULL),('38a43811-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:47:15.000','Create','38a3e9ec-c6c3-11ea-a5b8-0242ac170011','Authorization','resourceId',NULL,'*',NULL,NULL,'Admin',NULL,NULL),('38a43812-c6c3-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:47:15.000','Create','38a3e9ec-c6c3-11ea-a5b8-0242ac170011','Authorization','groupId',NULL,'SCOPE_Trust',NULL,NULL,'Admin',NULL,NULL),('64c1aa0e-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:41:20.000','Create','64c15bed-c6c2-11ea-a5b8-0242ac170011','Authorization','permissionBits',NULL,'2147483647',NULL,NULL,'Admin',NULL,NULL),('64c1f82f-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:41:20.000','Create','64c15bed-c6c2-11ea-a5b8-0242ac170011','Authorization','permissions',NULL,'ALL',NULL,NULL,'Admin',NULL,NULL),('64c1f830-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:41:20.000','Create','64c15bed-c6c2-11ea-a5b8-0242ac170011','Authorization','type',NULL,'1',NULL,NULL,'Admin',NULL,NULL),('64c1f831-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:41:20.000','Create','64c15bed-c6c2-11ea-a5b8-0242ac170011','Authorization','resource',NULL,'ProcessDefinition',NULL,NULL,'Admin',NULL,NULL),('64c21f42-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:41:20.000','Create','64c15bed-c6c2-11ea-a5b8-0242ac170011','Authorization','resourceId',NULL,'construct-fire-check',NULL,NULL,'Admin',NULL,NULL),('64c21f43-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:41:20.000','Create','64c15bed-c6c2-11ea-a5b8-0242ac170011','Authorization','groupId',NULL,'camunda-fire-apply',NULL,NULL,'Admin',NULL,NULL),('70a44455-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:41:40.000','Update','70a44454-c6c2-11ea-a5b8-0242ac170011','Authorization','permissionBits','2147483647','258',NULL,NULL,'Admin',NULL,NULL),('70a44456-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:41:40.000','Update','70a44454-c6c2-11ea-a5b8-0242ac170011','Authorization','permissions','ALL','READ, CREATE_INSTANCE',NULL,NULL,'Admin',NULL,NULL),('70a46b67-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:41:40.000','Update','70a44454-c6c2-11ea-a5b8-0242ac170011','Authorization','type','1','1',NULL,NULL,'Admin',NULL,NULL),('70a46b68-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:41:40.000','Update','70a44454-c6c2-11ea-a5b8-0242ac170011','Authorization','resource','ProcessDefinition','ProcessDefinition',NULL,NULL,'Admin',NULL,NULL),('70a46b69-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:41:40.000','Update','70a44454-c6c2-11ea-a5b8-0242ac170011','Authorization','resourceId','construct-fire-check','construct-fire-check',NULL,NULL,'Admin',NULL,NULL),('70a46b6a-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:41:40.000','Update','70a44454-c6c2-11ea-a5b8-0242ac170011','Authorization','groupId','camunda-fire-apply','camunda-fire-apply',NULL,NULL,'Admin',NULL,NULL),('ad4cfbed-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:43:22.000','Create','ad4cfbec-c6c2-11ea-a5b8-0242ac170011','Authorization','permissionBits',NULL,'2',NULL,NULL,'Admin',NULL,NULL),('ad4d22fe-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:43:22.000','Create','ad4cfbec-c6c2-11ea-a5b8-0242ac170011','Authorization','permissions',NULL,'READ',NULL,NULL,'Admin',NULL,NULL),('ad4d22ff-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:43:22.000','Create','ad4cfbec-c6c2-11ea-a5b8-0242ac170011','Authorization','type',NULL,'1',NULL,NULL,'Admin',NULL,NULL),('ad4d2300-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:43:22.000','Create','ad4cfbec-c6c2-11ea-a5b8-0242ac170011','Authorization','resource',NULL,'ProcessDefinition',NULL,NULL,'Admin',NULL,NULL),('ad4d4a11-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:43:22.000','Create','ad4cfbec-c6c2-11ea-a5b8-0242ac170011','Authorization','resourceId',NULL,'construct-fire-check',NULL,NULL,'Admin',NULL,NULL),('ad4d4a12-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:43:22.000','Create','ad4cfbec-c6c2-11ea-a5b8-0242ac170011','Authorization','groupId',NULL,'camunda-fire-site',NULL,NULL,'Admin',NULL,NULL),('cc3baf75-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:44:14.000','Create','cc3b8864-c6c2-11ea-a5b8-0242ac170011','Authorization','permissionBits',NULL,'2147483647',NULL,NULL,'Admin',NULL,NULL),('cc3baf76-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:44:14.000','Create','cc3b8864-c6c2-11ea-a5b8-0242ac170011','Authorization','permissions',NULL,'ALL',NULL,NULL,'Admin',NULL,NULL),('cc3bd687-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:44:14.000','Create','cc3b8864-c6c2-11ea-a5b8-0242ac170011','Authorization','type',NULL,'1',NULL,NULL,'Admin',NULL,NULL),('cc3bd688-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:44:14.000','Create','cc3b8864-c6c2-11ea-a5b8-0242ac170011','Authorization','resource',NULL,'ProcessDefinition',NULL,NULL,'Admin',NULL,NULL),('cc3bd689-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:44:14.000','Create','cc3b8864-c6c2-11ea-a5b8-0242ac170011','Authorization','resourceId',NULL,'*',NULL,NULL,'Admin',NULL,NULL),('cc3bfd9a-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:44:14.000','Create','cc3b8864-c6c2-11ea-a5b8-0242ac170011','Authorization','groupId',NULL,'SCOPE_Extends',NULL,NULL,'Admin',NULL,NULL),('e1072bfd-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:44:48.000','Create','e10704ec-c6c2-11ea-a5b8-0242ac170011','Authorization','permissionBits',NULL,'256',NULL,NULL,'Admin',NULL,NULL),('e1072bfe-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:44:48.000','Create','e10704ec-c6c2-11ea-a5b8-0242ac170011','Authorization','permissions',NULL,'CREATE_INSTANCE',NULL,NULL,'Admin',NULL,NULL),('e107530f-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:44:48.000','Create','e10704ec-c6c2-11ea-a5b8-0242ac170011','Authorization','type',NULL,'1',NULL,NULL,'Admin',NULL,NULL),('e1075310-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:44:48.000','Create','e10704ec-c6c2-11ea-a5b8-0242ac170011','Authorization','resource',NULL,'ProcessDefinition',NULL,NULL,'Admin',NULL,NULL),('e1075311-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:44:48.000','Create','e10704ec-c6c2-11ea-a5b8-0242ac170011','Authorization','resourceId',NULL,'construct-fire-check',NULL,NULL,'Admin',NULL,NULL),('e1077a22-c6c2-11ea-a5b8-0242ac170011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'camunda','2020-07-15 17:44:48.000','Create','e10704ec-c6c2-11ea-a5b8-0242ac170011','Authorization','groupId',NULL,'SCOPE_Trust',NULL,NULL,'Admin',NULL,NULL);
/*!40000 ALTER TABLE `ACT_HI_OP_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_PROCINST`
--

DROP TABLE IF EXISTS `ACT_HI_PROCINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_PROCINST` (
                                   `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `START_TIME_` datetime(3) NOT NULL,
                                   `END_TIME_` datetime(3) DEFAULT NULL,
                                   `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                   `DURATION_` bigint(20) DEFAULT NULL,
                                   `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `SUPER_CASE_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                   `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `STATE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   PRIMARY KEY (`ID_`),
                                   UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
                                   KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
                                   KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`),
                                   KEY `ACT_IDX_HI_PRO_INST_TENANT_ID` (`TENANT_ID_`),
                                   KEY `ACT_IDX_HI_PRO_INST_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
                                   KEY `ACT_IDX_HI_PRO_INST_PROC_TIME` (`START_TIME_`,`END_TIME_`),
                                   KEY `ACT_IDX_HI_PI_PDEFID_END_TIME` (`PROC_DEF_ID_`,`END_TIME_`),
                                   KEY `ACT_IDX_HI_PRO_INST_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                   KEY `ACT_IDX_HI_PRO_INST_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_PROCINST`
--

LOCK TABLES `ACT_HI_PROCINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_PROCINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_PROCINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_TASKINST`
--

DROP TABLE IF EXISTS `ACT_HI_TASKINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_TASKINST` (
                                   `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `CASE_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                   `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `START_TIME_` datetime(3) NOT NULL,
                                   `END_TIME_` datetime(3) DEFAULT NULL,
                                   `DURATION_` bigint(20) DEFAULT NULL,
                                   `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                   `PRIORITY_` int(11) DEFAULT NULL,
                                   `DUE_DATE_` datetime(3) DEFAULT NULL,
                                   `FOLLOW_UP_DATE_` datetime(3) DEFAULT NULL,
                                   `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                   PRIMARY KEY (`ID_`),
                                   KEY `ACT_IDX_HI_TASKINST_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                   KEY `ACT_IDX_HI_TASK_INST_TENANT_ID` (`TENANT_ID_`),
                                   KEY `ACT_IDX_HI_TASK_INST_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
                                   KEY `ACT_IDX_HI_TASKINST_PROCINST` (`PROC_INST_ID_`),
                                   KEY `ACT_IDX_HI_TASKINSTID_PROCINST` (`ID_`,`PROC_INST_ID_`),
                                   KEY `ACT_IDX_HI_TASK_INST_RM_TIME` (`REMOVAL_TIME_`),
                                   KEY `ACT_IDX_HI_TASK_INST_START` (`START_TIME_`),
                                   KEY `ACT_IDX_HI_TASK_INST_END` (`END_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_TASKINST`
--

LOCK TABLES `ACT_HI_TASKINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_TASKINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_TASKINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_VARINST`
--

DROP TABLE IF EXISTS `ACT_HI_VARINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_VARINST` (
                                  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `CASE_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
                                  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
                                  `CREATE_TIME_` datetime(3) DEFAULT NULL,
                                  `REV_` int(11) DEFAULT NULL,
                                  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `DOUBLE_` double DEFAULT NULL,
                                  `LONG_` bigint(20) DEFAULT NULL,
                                  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `STATE_` varchar(20) COLLATE utf8_bin DEFAULT NULL,
                                  `REMOVAL_TIME_` datetime(3) DEFAULT NULL,
                                  PRIMARY KEY (`ID_`),
                                  KEY `ACT_IDX_HI_VARINST_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
                                  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
                                  KEY `ACT_IDX_HI_CASEVAR_CASE_INST` (`CASE_INST_ID_`),
                                  KEY `ACT_IDX_HI_VAR_INST_TENANT_ID` (`TENANT_ID_`),
                                  KEY `ACT_IDX_HI_VAR_INST_PROC_DEF_KEY` (`PROC_DEF_KEY_`),
                                  KEY `ACT_IDX_HI_VARINST_BYTEAR` (`BYTEARRAY_ID_`),
                                  KEY `ACT_IDX_HI_VARINST_RM_TIME` (`REMOVAL_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_VARINST`
--

LOCK TABLES `ACT_HI_VARINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_VARINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_VARINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_GROUP`
--

DROP TABLE IF EXISTS `ACT_ID_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_GROUP` (
                                `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                `REV_` int(11) DEFAULT NULL,
                                `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_GROUP`
--

LOCK TABLES `ACT_ID_GROUP` WRITE;
/*!40000 ALTER TABLE `ACT_ID_GROUP` DISABLE KEYS */;
INSERT INTO `ACT_ID_GROUP` VALUES ('camunda-admin',1,'camunda BPM Administrators','SYSTEM');
/*!40000 ALTER TABLE `ACT_ID_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_INFO`
--

DROP TABLE IF EXISTS `ACT_ID_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_INFO` (
                               `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                               `REV_` int(11) DEFAULT NULL,
                               `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `PASSWORD_` longblob DEFAULT NULL,
                               `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_INFO`
--

LOCK TABLES `ACT_ID_INFO` WRITE;
/*!40000 ALTER TABLE `ACT_ID_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_MEMBERSHIP`
--

DROP TABLE IF EXISTS `ACT_ID_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_MEMBERSHIP` (
                                     `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                     `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                     PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
                                     KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
                                     CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `ACT_ID_GROUP` (`ID_`),
                                     CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `ACT_ID_USER` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_MEMBERSHIP`
--

LOCK TABLES `ACT_ID_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `ACT_ID_MEMBERSHIP` DISABLE KEYS */;
INSERT INTO `ACT_ID_MEMBERSHIP` VALUES ('camunda','camunda-admin');
/*!40000 ALTER TABLE `ACT_ID_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_TENANT`
--

DROP TABLE IF EXISTS `ACT_ID_TENANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_TENANT` (
                                 `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                 `REV_` int(11) DEFAULT NULL,
                                 `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                 PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_TENANT`
--

LOCK TABLES `ACT_ID_TENANT` WRITE;
/*!40000 ALTER TABLE `ACT_ID_TENANT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_TENANT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_TENANT_MEMBER`
--

DROP TABLE IF EXISTS `ACT_ID_TENANT_MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_TENANT_MEMBER` (
                                        `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                        `TENANT_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                        `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                        `GROUP_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                        PRIMARY KEY (`ID_`),
                                        UNIQUE KEY `ACT_UNIQ_TENANT_MEMB_USER` (`TENANT_ID_`,`USER_ID_`),
                                        UNIQUE KEY `ACT_UNIQ_TENANT_MEMB_GROUP` (`TENANT_ID_`,`GROUP_ID_`),
                                        KEY `ACT_FK_TENANT_MEMB_USER` (`USER_ID_`),
                                        KEY `ACT_FK_TENANT_MEMB_GROUP` (`GROUP_ID_`),
                                        CONSTRAINT `ACT_FK_TENANT_MEMB` FOREIGN KEY (`TENANT_ID_`) REFERENCES `ACT_ID_TENANT` (`ID_`),
                                        CONSTRAINT `ACT_FK_TENANT_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `ACT_ID_GROUP` (`ID_`),
                                        CONSTRAINT `ACT_FK_TENANT_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `ACT_ID_USER` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_TENANT_MEMBER`
--

LOCK TABLES `ACT_ID_TENANT_MEMBER` WRITE;
/*!40000 ALTER TABLE `ACT_ID_TENANT_MEMBER` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_TENANT_MEMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_USER`
--

DROP TABLE IF EXISTS `ACT_ID_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_USER` (
                               `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                               `REV_` int(11) DEFAULT NULL,
                               `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `SALT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `LOCK_EXP_TIME_` datetime(3) DEFAULT NULL,
                               `ATTEMPTS_` int(11) DEFAULT NULL,
                               `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_USER`
--

LOCK TABLES `ACT_ID_USER` WRITE;
/*!40000 ALTER TABLE `ACT_ID_USER` DISABLE KEYS */;
INSERT INTO `ACT_ID_USER` VALUES ('camunda',1,'Camunda','Camunda','camunda@localhost','{SHA-512}2ZABc/Y1Gf4wmAHSImZ1ep2FJ20bT15USb/yRKBySMtsZXdCymFxvJyUSHJ1hg9rGKgeI3yNHrIPuH7TcjjM/Q==','cn0RSVNBchrf1GibaaAHHw==',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ACT_ID_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_CASE_DEF`
--

DROP TABLE IF EXISTS `ACT_RE_CASE_DEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RE_CASE_DEF` (
                                   `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `REV_` int(11) DEFAULT NULL,
                                   `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
                                   `VERSION_` int(11) NOT NULL,
                                   `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                   `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                   `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `HISTORY_TTL_` int(11) DEFAULT NULL,
                                   PRIMARY KEY (`ID_`),
                                   KEY `ACT_IDX_CASE_DEF_TENANT_ID` (`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_CASE_DEF`
--

LOCK TABLES `ACT_RE_CASE_DEF` WRITE;
/*!40000 ALTER TABLE `ACT_RE_CASE_DEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RE_CASE_DEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_DECISION_DEF`
--

DROP TABLE IF EXISTS `ACT_RE_DECISION_DEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RE_DECISION_DEF` (
                                       `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                       `REV_` int(11) DEFAULT NULL,
                                       `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
                                       `VERSION_` int(11) NOT NULL,
                                       `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                       `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                       `DEC_REQ_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `DEC_REQ_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `HISTORY_TTL_` int(11) DEFAULT NULL,
                                       `VERSION_TAG_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       PRIMARY KEY (`ID_`),
                                       KEY `ACT_IDX_DEC_DEF_TENANT_ID` (`TENANT_ID_`),
                                       KEY `ACT_IDX_DEC_DEF_REQ_ID` (`DEC_REQ_ID_`),
                                       CONSTRAINT `ACT_FK_DEC_REQ` FOREIGN KEY (`DEC_REQ_ID_`) REFERENCES `ACT_RE_DECISION_REQ_DEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_DECISION_DEF`
--

LOCK TABLES `ACT_RE_DECISION_DEF` WRITE;
/*!40000 ALTER TABLE `ACT_RE_DECISION_DEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RE_DECISION_DEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_DECISION_REQ_DEF`
--

DROP TABLE IF EXISTS `ACT_RE_DECISION_REQ_DEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RE_DECISION_REQ_DEF` (
                                           `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                           `REV_` int(11) DEFAULT NULL,
                                           `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                           `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                           `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
                                           `VERSION_` int(11) NOT NULL,
                                           `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                           `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                           `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                           `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                           PRIMARY KEY (`ID_`),
                                           KEY `ACT_IDX_DEC_REQ_DEF_TENANT_ID` (`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_DECISION_REQ_DEF`
--

LOCK TABLES `ACT_RE_DECISION_REQ_DEF` WRITE;
/*!40000 ALTER TABLE `ACT_RE_DECISION_REQ_DEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RE_DECISION_REQ_DEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_DEPLOYMENT`
--

DROP TABLE IF EXISTS `ACT_RE_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RE_DEPLOYMENT` (
                                     `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                     `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
                                     `SOURCE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                     PRIMARY KEY (`ID_`),
                                     KEY `ACT_IDX_DEPLOYMENT_NAME` (`NAME_`),
                                     KEY `ACT_IDX_DEPLOYMENT_TENANT_ID` (`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_DEPLOYMENT`
--

LOCK TABLES `ACT_RE_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` DISABLE KEYS */;
INSERT INTO `ACT_RE_DEPLOYMENT` VALUES ('fb12753d-c6c1-11ea-a81e-0242ac17000f','application','2020-07-16 01:38:23.000','process application',NULL);
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_PROCDEF`
--

DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RE_PROCDEF` (
                                  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `REV_` int(11) DEFAULT NULL,
                                  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
                                  `VERSION_` int(11) NOT NULL,
                                  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
                                  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
                                  `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `VERSION_TAG_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `HISTORY_TTL_` int(11) DEFAULT NULL,
                                  `STARTABLE_` tinyint(1) NOT NULL DEFAULT 1,
                                  PRIMARY KEY (`ID_`),
                                  KEY `ACT_IDX_PROCDEF_DEPLOYMENT_ID` (`DEPLOYMENT_ID_`),
                                  KEY `ACT_IDX_PROCDEF_TENANT_ID` (`TENANT_ID_`),
                                  KEY `ACT_IDX_PROCDEF_VER_TAG` (`VERSION_TAG_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_PROCDEF`
--

LOCK TABLES `ACT_RE_PROCDEF` WRITE;
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` DISABLE KEYS */;
INSERT INTO `ACT_RE_PROCDEF` VALUES ('construct-fire-check:1:fb58cd0f-c6c1-11ea-a81e-0242ac17000f',1,'http://bpmn.io/schema/bpmn','建设工程消防验收','construct-fire-check',1,'fb12753d-c6c1-11ea-a81e-0242ac17000f','BOOT-INF/classes/bpmn/fire_check.bpmn',NULL,0,1,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_AUTHORIZATION`
--

DROP TABLE IF EXISTS `ACT_RU_AUTHORIZATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_AUTHORIZATION` (
                                        `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                        `REV_` int(11) NOT NULL,
                                        `TYPE_` int(11) NOT NULL,
                                        `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                        `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                        `RESOURCE_TYPE_` int(11) NOT NULL,
                                        `RESOURCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                        `PERMS_` int(11) DEFAULT NULL,
                                        PRIMARY KEY (`ID_`),
                                        UNIQUE KEY `ACT_UNIQ_AUTH_USER` (`USER_ID_`,`TYPE_`,`RESOURCE_TYPE_`,`RESOURCE_ID_`),
                                        UNIQUE KEY `ACT_UNIQ_AUTH_GROUP` (`GROUP_ID_`,`TYPE_`,`RESOURCE_TYPE_`,`RESOURCE_ID_`),
                                        KEY `ACT_IDX_AUTH_GROUP_ID` (`GROUP_ID_`),
                                        KEY `ACT_IDX_AUTH_RESOURCE_ID` (`RESOURCE_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_AUTHORIZATION`
--

LOCK TABLES `ACT_RU_AUTHORIZATION` WRITE;
/*!40000 ALTER TABLE `ACT_RU_AUTHORIZATION` DISABLE KEYS */;
INSERT INTO `ACT_RU_AUTHORIZATION` VALUES ('0ab29763-c6c3-11ea-a5b8-0242ac170011',1,1,'camunda-fire-apply',NULL,8,'*',10),('20c4016b-c6c3-11ea-a5b8-0242ac170011',1,1,'camunda-fire-site',NULL,8,'*',2),('2fc763b3-c6c3-11ea-a5b8-0242ac170011',1,1,'SCOPE_Extends',NULL,8,'*',2147483647),('38a3c2db-c6c3-11ea-a5b8-0242ac170011',1,1,'SCOPE_Trust',NULL,8,'*',8),('64bfae3c-c6c2-11ea-a5b8-0242ac170011',2,1,'camunda-fire-apply',NULL,6,'construct-fire-check',258),('ad4cfbeb-c6c2-11ea-a5b8-0242ac170011',1,1,'camunda-fire-site',NULL,6,'construct-fire-check',2),('cc3b8863-c6c2-11ea-a5b8-0242ac170011',1,1,'SCOPE_Extends',NULL,6,'*',2147483647),('e10704eb-c6c2-11ea-a5b8-0242ac170011',1,1,'SCOPE_Trust',NULL,6,'construct-fire-check',256),('f60100b6-c6c1-11ea-a81e-0242ac17000f',1,1,NULL,'camunda',1,'camunda',2147483647),('f6096527-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,2,'camunda-admin',2),('f613ec78-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,0,'*',2147483647),('f616d2a9-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,1,'*',2147483647),('f6196aba-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,2,'*',2147483647),('f61c50eb-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,3,'*',2147483647),('f61fd35c-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,4,'*',2147483647),('f6237cdd-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,5,'*',2147483647),('f62810be-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,6,'*',2147483647),('f62acfdf-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,7,'*',2147483647),('f62ccbb0-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,8,'*',2147483647),('f62fd8f1-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,9,'*',2147483647),('f63222e2-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,10,'*',2147483647),('f63445c3-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,11,'*',2147483647),('f6361a84-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,12,'*',2147483647),('f6381655-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,13,'*',2147483647),('f63ad576-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,14,'*',2147483647),('f63d4677-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,15,'*',2147483647),('f63f4248-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,16,'*',2147483647),('f6413e19-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,17,'*',2147483647),('f642ebca-c6c1-11ea-a81e-0242ac17000f',1,1,'camunda-admin',NULL,18,'*',2147483647);
/*!40000 ALTER TABLE `ACT_RU_AUTHORIZATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_BATCH`
--

DROP TABLE IF EXISTS `ACT_RU_BATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_BATCH` (
                                `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                `REV_` int(11) NOT NULL,
                                `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `TOTAL_JOBS_` int(11) DEFAULT NULL,
                                `JOBS_CREATED_` int(11) DEFAULT NULL,
                                `JOBS_PER_SEED_` int(11) DEFAULT NULL,
                                `INVOCATIONS_PER_JOB_` int(11) DEFAULT NULL,
                                `SEED_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                `BATCH_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                `MONITOR_JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                `SUSPENSION_STATE_` int(11) DEFAULT NULL,
                                `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                `CREATE_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                PRIMARY KEY (`ID_`),
                                KEY `ACT_IDX_BATCH_SEED_JOB_DEF` (`SEED_JOB_DEF_ID_`),
                                KEY `ACT_IDX_BATCH_MONITOR_JOB_DEF` (`MONITOR_JOB_DEF_ID_`),
                                KEY `ACT_IDX_BATCH_JOB_DEF` (`BATCH_JOB_DEF_ID_`),
                                CONSTRAINT `ACT_FK_BATCH_JOB_DEF` FOREIGN KEY (`BATCH_JOB_DEF_ID_`) REFERENCES `ACT_RU_JOBDEF` (`ID_`),
                                CONSTRAINT `ACT_FK_BATCH_MONITOR_JOB_DEF` FOREIGN KEY (`MONITOR_JOB_DEF_ID_`) REFERENCES `ACT_RU_JOBDEF` (`ID_`),
                                CONSTRAINT `ACT_FK_BATCH_SEED_JOB_DEF` FOREIGN KEY (`SEED_JOB_DEF_ID_`) REFERENCES `ACT_RU_JOBDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_BATCH`
--

LOCK TABLES `ACT_RU_BATCH` WRITE;
/*!40000 ALTER TABLE `ACT_RU_BATCH` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_BATCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_CASE_EXECUTION`
--

DROP TABLE IF EXISTS `ACT_RU_CASE_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_CASE_EXECUTION` (
                                         `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                         `REV_` int(11) DEFAULT NULL,
                                         `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                         `SUPER_CASE_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                         `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                         `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                         `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                         `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                         `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                         `PREV_STATE_` int(11) DEFAULT NULL,
                                         `CURRENT_STATE_` int(11) DEFAULT NULL,
                                         `REQUIRED_` tinyint(1) DEFAULT NULL,
                                         `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                         PRIMARY KEY (`ID_`),
                                         KEY `ACT_IDX_CASE_EXEC_BUSKEY` (`BUSINESS_KEY_`),
                                         KEY `ACT_IDX_CASE_EXE_CASE_INST` (`CASE_INST_ID_`),
                                         KEY `ACT_FK_CASE_EXE_PARENT` (`PARENT_ID_`),
                                         KEY `ACT_FK_CASE_EXE_CASE_DEF` (`CASE_DEF_ID_`),
                                         KEY `ACT_IDX_CASE_EXEC_TENANT_ID` (`TENANT_ID_`),
                                         CONSTRAINT `ACT_FK_CASE_EXE_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_RE_CASE_DEF` (`ID_`),
                                         CONSTRAINT `ACT_FK_CASE_EXE_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
                                         CONSTRAINT `ACT_FK_CASE_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_CASE_EXECUTION`
--

LOCK TABLES `ACT_RU_CASE_EXECUTION` WRITE;
/*!40000 ALTER TABLE `ACT_RU_CASE_EXECUTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_CASE_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_CASE_SENTRY_PART`
--

DROP TABLE IF EXISTS `ACT_RU_CASE_SENTRY_PART`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_CASE_SENTRY_PART` (
                                           `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                           `REV_` int(11) DEFAULT NULL,
                                           `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                           `CASE_EXEC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                           `SENTRY_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                           `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                           `SOURCE_CASE_EXEC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                           `STANDARD_EVENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                           `SOURCE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                           `VARIABLE_EVENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                           `VARIABLE_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                           `SATISFIED_` tinyint(1) DEFAULT NULL,
                                           `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                           PRIMARY KEY (`ID_`),
                                           KEY `ACT_FK_CASE_SENTRY_CASE_INST` (`CASE_INST_ID_`),
                                           KEY `ACT_FK_CASE_SENTRY_CASE_EXEC` (`CASE_EXEC_ID_`),
                                           CONSTRAINT `ACT_FK_CASE_SENTRY_CASE_EXEC` FOREIGN KEY (`CASE_EXEC_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`),
                                           CONSTRAINT `ACT_FK_CASE_SENTRY_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_CASE_SENTRY_PART`
--

LOCK TABLES `ACT_RU_CASE_SENTRY_PART` WRITE;
/*!40000 ALTER TABLE `ACT_RU_CASE_SENTRY_PART` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_CASE_SENTRY_PART` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EVENT_SUBSCR`
--

DROP TABLE IF EXISTS `ACT_RU_EVENT_SUBSCR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_EVENT_SUBSCR` (
                                       `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                       `REV_` int(11) DEFAULT NULL,
                                       `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                       `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `ACTIVITY_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `CREATED_` datetime(3) NOT NULL,
                                       `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       PRIMARY KEY (`ID_`),
                                       KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
                                       KEY `ACT_IDX_EVENT_SUBSCR_TENANT_ID` (`TENANT_ID_`),
                                       KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
                                       KEY `ACT_IDX_EVENT_SUBSCR_EVT_NAME` (`EVENT_NAME_`),
                                       CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EVENT_SUBSCR`
--

LOCK TABLES `ACT_RU_EVENT_SUBSCR` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EVENT_SUBSCR` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_EVENT_SUBSCR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EXECUTION`
--

DROP TABLE IF EXISTS `ACT_RU_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_EXECUTION` (
                                    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                    `REV_` int(11) DEFAULT NULL,
                                    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `SUPER_CASE_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
                                    `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
                                    `IS_SCOPE_` tinyint(4) DEFAULT NULL,
                                    `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
                                    `SUSPENSION_STATE_` int(11) DEFAULT NULL,
                                    `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
                                    `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
                                    `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    PRIMARY KEY (`ID_`),
                                    KEY `ACT_IDX_EXEC_ROOT_PI` (`ROOT_PROC_INST_ID_`),
                                    KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
                                    KEY `ACT_IDX_EXEC_TENANT_ID` (`TENANT_ID_`),
                                    KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
                                    KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
                                    KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
                                    KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
                                    CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
                                    CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
                                    CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
                                    CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EXECUTION`
--

LOCK TABLES `ACT_RU_EXECUTION` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EXECUTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EXT_TASK`
--

DROP TABLE IF EXISTS `ACT_RU_EXT_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_EXT_TASK` (
                                   `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `REV_` int(11) NOT NULL,
                                   `WORKER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `TOPIC_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `RETRIES_` int(11) DEFAULT NULL,
                                   `ERROR_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                   `ERROR_DETAILS_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `LOCK_EXP_TIME_` datetime(3) DEFAULT NULL,
                                   `SUSPENSION_STATE_` int(11) DEFAULT NULL,
                                   `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `PRIORITY_` bigint(20) NOT NULL DEFAULT 0,
                                   PRIMARY KEY (`ID_`),
                                   KEY `ACT_IDX_EXT_TASK_TOPIC` (`TOPIC_NAME_`),
                                   KEY `ACT_IDX_EXT_TASK_TENANT_ID` (`TENANT_ID_`),
                                   KEY `ACT_IDX_EXT_TASK_PRIORITY` (`PRIORITY_`),
                                   KEY `ACT_IDX_EXT_TASK_ERR_DETAILS` (`ERROR_DETAILS_ID_`),
                                   KEY `ACT_IDX_EXT_TASK_EXEC` (`EXECUTION_ID_`),
                                   CONSTRAINT `ACT_FK_EXT_TASK_ERROR_DETAILS` FOREIGN KEY (`ERROR_DETAILS_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
                                   CONSTRAINT `ACT_FK_EXT_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EXT_TASK`
--

LOCK TABLES `ACT_RU_EXT_TASK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EXT_TASK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_EXT_TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_FILTER`
--

DROP TABLE IF EXISTS `ACT_RU_FILTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_FILTER` (
                                 `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                 `REV_` int(11) NOT NULL,
                                 `RESOURCE_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                 `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
                                 `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                 `QUERY_` longtext COLLATE utf8_bin NOT NULL,
                                 `PROPERTIES_` longtext COLLATE utf8_bin DEFAULT NULL,
                                 PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_FILTER`
--

LOCK TABLES `ACT_RU_FILTER` WRITE;
/*!40000 ALTER TABLE `ACT_RU_FILTER` DISABLE KEYS */;
INSERT INTO `ACT_RU_FILTER` VALUES ('f654ed2c-c6c1-11ea-a81e-0242ac17000f',1,'Task','All tasks',NULL,'{}','');
/*!40000 ALTER TABLE `ACT_RU_FILTER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_IDENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_IDENTITYLINK` (
                                       `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                       `REV_` int(11) DEFAULT NULL,
                                       `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       PRIMARY KEY (`ID_`),
                                       KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
                                       KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
                                       KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
                                       KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
                                       CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
                                       CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `ACT_RU_TASK` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_IDENTITYLINK`
--

LOCK TABLES `ACT_RU_IDENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_IDENTITYLINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_INCIDENT`
--

DROP TABLE IF EXISTS `ACT_RU_INCIDENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_INCIDENT` (
                                   `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `REV_` int(11) NOT NULL,
                                   `INCIDENT_TIMESTAMP_` datetime(3) NOT NULL,
                                   `INCIDENT_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                   `INCIDENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                   `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `ACTIVITY_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `CAUSE_INCIDENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `ROOT_CAUSE_INCIDENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   PRIMARY KEY (`ID_`),
                                   KEY `ACT_IDX_INC_CONFIGURATION` (`CONFIGURATION_`),
                                   KEY `ACT_IDX_INC_TENANT_ID` (`TENANT_ID_`),
                                   KEY `ACT_IDX_INC_JOB_DEF` (`JOB_DEF_ID_`),
                                   KEY `ACT_IDX_INC_CAUSEINCID` (`CAUSE_INCIDENT_ID_`),
                                   KEY `ACT_IDX_INC_EXID` (`EXECUTION_ID_`),
                                   KEY `ACT_IDX_INC_PROCDEFID` (`PROC_DEF_ID_`),
                                   KEY `ACT_IDX_INC_PROCINSTID` (`PROC_INST_ID_`),
                                   KEY `ACT_IDX_INC_ROOTCAUSEINCID` (`ROOT_CAUSE_INCIDENT_ID_`),
                                   CONSTRAINT `ACT_FK_INC_CAUSE` FOREIGN KEY (`CAUSE_INCIDENT_ID_`) REFERENCES `ACT_RU_INCIDENT` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
                                   CONSTRAINT `ACT_FK_INC_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
                                   CONSTRAINT `ACT_FK_INC_JOB_DEF` FOREIGN KEY (`JOB_DEF_ID_`) REFERENCES `ACT_RU_JOBDEF` (`ID_`),
                                   CONSTRAINT `ACT_FK_INC_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
                                   CONSTRAINT `ACT_FK_INC_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
                                   CONSTRAINT `ACT_FK_INC_RCAUSE` FOREIGN KEY (`ROOT_CAUSE_INCIDENT_ID_`) REFERENCES `ACT_RU_INCIDENT` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_INCIDENT`
--

LOCK TABLES `ACT_RU_INCIDENT` WRITE;
/*!40000 ALTER TABLE `ACT_RU_INCIDENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_INCIDENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_JOB` (
                              `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                              `REV_` int(11) DEFAULT NULL,
                              `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                              `LOCK_EXP_TIME_` datetime(3) DEFAULT NULL,
                              `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                              `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
                              `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                              `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                              `PROCESS_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                              `PROCESS_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                              `RETRIES_` int(11) DEFAULT NULL,
                              `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                              `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                              `DUEDATE_` datetime(3) DEFAULT NULL,
                              `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                              `REPEAT_OFFSET_` bigint(20) DEFAULT 0,
                              `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                              `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                              `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                              `SUSPENSION_STATE_` int(11) NOT NULL DEFAULT 1,
                              `JOB_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                              `PRIORITY_` bigint(20) NOT NULL DEFAULT 0,
                              `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
                              `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                              `CREATE_TIME_` datetime(3) DEFAULT NULL,
                              PRIMARY KEY (`ID_`),
                              KEY `ACT_IDX_JOB_EXECUTION_ID` (`EXECUTION_ID_`),
                              KEY `ACT_IDX_JOB_HANDLER` (`HANDLER_TYPE_`(100),`HANDLER_CFG_`(155)),
                              KEY `ACT_IDX_JOB_PROCINST` (`PROCESS_INSTANCE_ID_`),
                              KEY `ACT_IDX_JOB_TENANT_ID` (`TENANT_ID_`),
                              KEY `ACT_IDX_JOB_JOB_DEF_ID` (`JOB_DEF_ID_`),
                              KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
                              KEY `ACT_IDX_JOB_HANDLER_TYPE` (`HANDLER_TYPE_`),
                              CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_JOB`
--

LOCK TABLES `ACT_RU_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_JOBDEF`
--

DROP TABLE IF EXISTS `ACT_RU_JOBDEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_JOBDEF` (
                                 `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                 `REV_` int(11) DEFAULT NULL,
                                 `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `PROC_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                 `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                 `JOB_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                 `JOB_CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                 `SUSPENSION_STATE_` int(11) DEFAULT NULL,
                                 `JOB_PRIORITY_` bigint(20) DEFAULT NULL,
                                 `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 PRIMARY KEY (`ID_`),
                                 KEY `ACT_IDX_JOBDEF_TENANT_ID` (`TENANT_ID_`),
                                 KEY `ACT_IDX_JOBDEF_PROC_DEF_ID` (`PROC_DEF_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_JOBDEF`
--

LOCK TABLES `ACT_RU_JOBDEF` WRITE;
/*!40000 ALTER TABLE `ACT_RU_JOBDEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_JOBDEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_METER_LOG`
--

DROP TABLE IF EXISTS `ACT_RU_METER_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_METER_LOG` (
                                    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                    `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
                                    `REPORTER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `VALUE_` bigint(20) DEFAULT NULL,
                                    `TIMESTAMP_` datetime(3) DEFAULT NULL,
                                    `MILLISECONDS_` bigint(20) DEFAULT 0,
                                    PRIMARY KEY (`ID_`),
                                    KEY `ACT_IDX_METER_LOG_MS` (`MILLISECONDS_`),
                                    KEY `ACT_IDX_METER_LOG_NAME_MS` (`NAME_`,`MILLISECONDS_`),
                                    KEY `ACT_IDX_METER_LOG_REPORT` (`NAME_`,`REPORTER_`,`MILLISECONDS_`),
                                    KEY `ACT_IDX_METER_LOG_TIME` (`TIMESTAMP_`),
                                    KEY `ACT_IDX_METER_LOG` (`NAME_`,`TIMESTAMP_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_METER_LOG`
--

LOCK TABLES `ACT_RU_METER_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_RU_METER_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_METER_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_TASK`
--

DROP TABLE IF EXISTS `ACT_RU_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_TASK` (
                               `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                               `REV_` int(11) DEFAULT NULL,
                               `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `CASE_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                               `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `PRIORITY_` int(11) DEFAULT NULL,
                               `CREATE_TIME_` datetime(3) DEFAULT NULL,
                               `DUE_DATE_` datetime(3) DEFAULT NULL,
                               `FOLLOW_UP_DATE_` datetime(3) DEFAULT NULL,
                               `SUSPENSION_STATE_` int(11) DEFAULT NULL,
                               `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               PRIMARY KEY (`ID_`),
                               KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
                               KEY `ACT_IDX_TASK_ASSIGNEE` (`ASSIGNEE_`),
                               KEY `ACT_IDX_TASK_TENANT_ID` (`TENANT_ID_`),
                               KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
                               KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
                               KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
                               KEY `ACT_FK_TASK_CASE_EXE` (`CASE_EXECUTION_ID_`),
                               KEY `ACT_FK_TASK_CASE_DEF` (`CASE_DEF_ID_`),
                               CONSTRAINT `ACT_FK_TASK_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_RE_CASE_DEF` (`ID_`),
                               CONSTRAINT `ACT_FK_TASK_CASE_EXE` FOREIGN KEY (`CASE_EXECUTION_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`),
                               CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
                               CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
                               CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_TASK`
--

LOCK TABLES `ACT_RU_TASK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_TASK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_VARIABLE`
--

DROP TABLE IF EXISTS `ACT_RU_VARIABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_VARIABLE` (
                                   `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `REV_` int(11) DEFAULT NULL,
                                   `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                   `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
                                   `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `CASE_EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `CASE_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `DOUBLE_` double DEFAULT NULL,
                                   `LONG_` bigint(20) DEFAULT NULL,
                                   `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                   `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                   `VAR_SCOPE_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `SEQUENCE_COUNTER_` bigint(20) DEFAULT NULL,
                                   `IS_CONCURRENT_LOCAL_` tinyint(4) DEFAULT NULL,
                                   `TENANT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   PRIMARY KEY (`ID_`),
                                   UNIQUE KEY `ACT_UNIQ_VARIABLE` (`VAR_SCOPE_`,`NAME_`),
                                   KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
                                   KEY `ACT_IDX_VARIABLE_TENANT_ID` (`TENANT_ID_`),
                                   KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
                                   KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
                                   KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
                                   KEY `ACT_FK_VAR_CASE_EXE` (`CASE_EXECUTION_ID_`),
                                   KEY `ACT_FK_VAR_CASE_INST` (`CASE_INST_ID_`),
                                   CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
                                   CONSTRAINT `ACT_FK_VAR_CASE_EXE` FOREIGN KEY (`CASE_EXECUTION_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`),
                                   CONSTRAINT `ACT_FK_VAR_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_RU_CASE_EXECUTION` (`ID_`),
                                   CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
                                   CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_VARIABLE`
--

LOCK TABLES `ACT_RU_VARIABLE` WRITE;
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BUSINESS`
--

DROP TABLE IF EXISTS `BUSINESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUSINESS` (
                            `ID` bigint(20) NOT NULL,
                            `STATUS` varchar(9) NOT NULL,
                            `CREATE_TIME` datetime NOT NULL,
                            `COMPLETE_TIME` datetime DEFAULT NULL,
                            `DEFINE` varchar(32) NOT NULL,
                            `NAME` varchar(32) NOT NULL,
                            PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUSINESS`
--

LOCK TABLES `BUSINESS` WRITE;
/*!40000 ALTER TABLE `BUSINESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BUSINESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BUSINESS_DEFINE`
--

DROP TABLE IF EXISTS `BUSINESS_DEFINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUSINESS_DEFINE` (
                                   `NAME` varchar(32) NOT NULL,
                                   `ID` varchar(32) NOT NULL,
                                   `PROCESS` varchar(32) DEFAULT NULL,
                                   `DESCRIPTION_TEMPLATE` text NOT NULL,
                                   PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUSINESS_DEFINE`
--

LOCK TABLES `BUSINESS_DEFINE` WRITE;
/*!40000 ALTER TABLE `BUSINESS_DEFINE` DISABLE KEYS */;
INSERT INTO `BUSINESS_DEFINE` VALUES ('特殊建设工程消防验收','FIRE_CHECK','construct-fire-check','项目名称为${name!\"-\"}, 面积${area!\"-\"}'),('建设工程消防验收备案','FIRE_RECORD','construct-fire-check','项目名称为${name!\"-\"}, 面积${area!\"-\"}');
/*!40000 ALTER TABLE `BUSINESS_DEFINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BUSINESS_DESCRIPTION`
--

DROP TABLE IF EXISTS `BUSINESS_DESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUSINESS_DESCRIPTION` (
                                        `ID` bigint(20) NOT NULL,
                                        `DESCRIPTION` text NOT NULL,
                                        `_KEYS` varchar(1024) DEFAULT NULL,
                                        `TAGS` text DEFAULT NULL,
                                        `SOURCE` varchar(8) NOT NULL,
                                        PRIMARY KEY (`ID`),
                                        CONSTRAINT `BUSINESS_DESCRIPTION_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `BUSINESS` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUSINESS_DESCRIPTION`
--

LOCK TABLES `BUSINESS_DESCRIPTION` WRITE;
/*!40000 ALTER TABLE `BUSINESS_DESCRIPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `BUSINESS_DESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BUSINESS_DOCUMENT`
--

DROP TABLE IF EXISTS `BUSINESS_DOCUMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUSINESS_DOCUMENT` (
                                     `NAME` varchar(512) NOT NULL,
                                     `BUSINESS_ID` bigint(20) NOT NULL,
                                     `ID` bigint(20) NOT NULL,
                                     `PAGE_COUNT` int(11) NOT NULL,
                                     `NEED` tinyint(1) NOT NULL,
                                     `_ORDER` int(11) NOT NULL,
                                     `DESCRIPTION` varchar(1024) DEFAULT NULL,
                                     PRIMARY KEY (`ID`),
                                     UNIQUE KEY `BUSINESS_DOC_NAME_UNIQUE` (`NAME`,`BUSINESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUSINESS_DOCUMENT`
--

LOCK TABLES `BUSINESS_DOCUMENT` WRITE;
/*!40000 ALTER TABLE `BUSINESS_DOCUMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BUSINESS_DOCUMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BUSINESS_FILE`
--

DROP TABLE IF EXISTS `BUSINESS_FILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUSINESS_FILE` (
                                 `FILE_ID` bigint(20) NOT NULL,
                                 `_ORDER` int(11) NOT NULL,
                                 `FILE_ITEM_ID` varchar(32) NOT NULL,
                                 `MD5` varchar(32) DEFAULT NULL,
                                 `UPLOAD_TIME` datetime NOT NULL,
                                 `FILE_TYPE` varchar(512) NOT NULL,
                                 `FILE_SIZE` int(11) DEFAULT NULL,
                                 `EXT_NAME` varchar(8) DEFAULT NULL,
                                 PRIMARY KEY (`FILE_ITEM_ID`),
                                 KEY `FILE_ID` (`FILE_ID`),
                                 CONSTRAINT `BUSINESS_FILE_ibfk_1` FOREIGN KEY (`FILE_ID`) REFERENCES `BUSINESS_DOCUMENT` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUSINESS_FILE`
--

LOCK TABLES `BUSINESS_FILE` WRITE;
/*!40000 ALTER TABLE `BUSINESS_FILE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BUSINESS_FILE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BUSINESS_FILE_DEFINE`
--

DROP TABLE IF EXISTS `BUSINESS_FILE_DEFINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUSINESS_FILE_DEFINE` (
                                        `BUSINESS` varchar(32) NOT NULL,
                                        `_ORDER` int(11) NOT NULL,
                                        `NAME` varchar(512) NOT NULL,
                                        `TYPE` varchar(4) NOT NULL,
                                        `EL` varchar(512) DEFAULT NULL,
                                        `DESCRIPTION` varchar(1024) DEFAULT NULL,
                                        PRIMARY KEY (`BUSINESS`,`_ORDER`),
                                        CONSTRAINT `BUSINESS_FILE_DEFINE_ibfk_1` FOREIGN KEY (`BUSINESS`) REFERENCES `BUSINESS_DEFINE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUSINESS_FILE_DEFINE`
--

LOCK TABLES `BUSINESS_FILE_DEFINE` WRITE;
/*!40000 ALTER TABLE `BUSINESS_FILE_DEFINE` DISABLE KEYS */;
INSERT INTO `BUSINESS_FILE_DEFINE` VALUES ('FIRE_CHECK',1,'消防验收申请表','REQ',NULL,''),('FIRE_CHECK',2,'工程竣工验收报告','REQ',NULL,''),('FIRE_CHECK',3,'涉及消防的建设工程竣工图纸','REQ',NULL,''),('FIRE_RECORD',1,'消防验收备案表','REQ',NULL,''),('FIRE_RECORD',2,'工程竣工验收报告','REQ',NULL,''),('FIRE_RECORD',3,'涉及消防的建设工程竣工图纸','REQ',NULL,'');
/*!40000 ALTER TABLE `BUSINESS_FILE_DEFINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFINE_KEY`
--

DROP TABLE IF EXISTS `DEFINE_KEY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEFINE_KEY` (
                              `BUSINESS` bigint(20) NOT NULL,
                              `CATEGORY` varchar(16) NOT NULL,
                              `_KEYS` varchar(1024) NOT NULL,
                              PRIMARY KEY (`BUSINESS`,`CATEGORY`),
                              CONSTRAINT `DEFINE_KEY_ibfk_1` FOREIGN KEY (`BUSINESS`) REFERENCES `BUSINESS_DESCRIPTION` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFINE_KEY`
--

LOCK TABLES `DEFINE_KEY` WRITE;
/*!40000 ALTER TABLE `DEFINE_KEY` DISABLE KEYS */;
/*!40000 ALTER TABLE `DEFINE_KEY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OPERATION`
--

DROP TABLE IF EXISTS `OPERATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OPERATION` (
                             `BUSINESS_ID` bigint(20) NOT NULL,
                             `OPERATION_TIME` datetime NOT NULL,
                             `TYPE` varchar(16) NOT NULL,
                             `EMP_ID` varchar(36) DEFAULT NULL,
                             `EMP_NAME` varchar(32) DEFAULT NULL,
                             `TASK_NAME` varchar(32) DEFAULT NULL,
                             `DESCRIPTION` varchar(512) DEFAULT NULL,
                             `ID` bigint(20) NOT NULL,
                             PRIMARY KEY (`ID`),
                             KEY `BUSINESS_ID` (`BUSINESS_ID`),
                             CONSTRAINT `OPERATION_ibfk_1` FOREIGN KEY (`BUSINESS_ID`) REFERENCES `BUSINESS` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPERATION`
--

LOCK TABLES `OPERATION` WRITE;
/*!40000 ALTER TABLE `OPERATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OPERATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKER_NODE`
--

DROP TABLE IF EXISTS `WORKER_NODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORKER_NODE` (
                               `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'auto increment id',
                               `HOST_NAME` varchar(64) NOT NULL COMMENT 'host name',
                               `PORT` varchar(64) NOT NULL COMMENT 'port',
                               `TYPE` int(11) NOT NULL COMMENT 'node type: CONTAINER(1), ACTUAL(2), FAKE(3)',
                               `LAUNCH_DATE` date NOT NULL COMMENT 'launch date',
                               `MODIFIED` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'modified time',
                               `CREATED` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'created time',
                               PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='DB WorkerID Assigner for UID Generator';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKER_NODE`
--

LOCK TABLES `WORKER_NODE` WRITE;
/*!40000 ALTER TABLE `WORKER_NODE` DISABLE KEYS */;
INSERT INTO `WORKER_NODE` VALUES (1,'172.23.0.15','1594834697541-95748',2,'2020-07-16','2020-07-15 17:38:17','2020-07-15 17:38:17');
/*!40000 ALTER TABLE `WORKER_NODE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-16  1:50:33





DROP DATABASE IF EXISTS keycloak;

CREATE DATABASE keycloak;

USE keycloak;


-- MySQL dump 10.17  Distrib 10.3.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: keycloak
-- ------------------------------------------------------
-- Server version	10.3.14-MariaDB-1:10.3.14+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
                                      `ID` varchar(36) NOT NULL,
                                      `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
                                      `REALM_ID` varchar(255) DEFAULT NULL,
                                      `OPERATION_TYPE` varchar(255) DEFAULT NULL,
                                      `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
                                      `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
                                      `AUTH_USER_ID` varchar(255) DEFAULT NULL,
                                      `IP_ADDRESS` varchar(255) DEFAULT NULL,
                                      `RESOURCE_PATH` text DEFAULT NULL,
                                      `REPRESENTATION` text DEFAULT NULL,
                                      `ERROR` varchar(255) DEFAULT NULL,
                                      `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
                                      PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASSOCIATED_POLICY` (
                                     `POLICY_ID` varchar(36) NOT NULL,
                                     `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
                                     PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
                                     KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
                                     CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
                                     CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
                                            `ID` varchar(36) NOT NULL,
                                            `ALIAS` varchar(255) DEFAULT NULL,
                                            `AUTHENTICATOR` varchar(36) DEFAULT NULL,
                                            `REALM_ID` varchar(36) DEFAULT NULL,
                                            `FLOW_ID` varchar(36) DEFAULT NULL,
                                            `REQUIREMENT` int(11) DEFAULT NULL,
                                            `PRIORITY` int(11) DEFAULT NULL,
                                            `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
                                            `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
                                            `AUTH_CONFIG` varchar(36) DEFAULT NULL,
                                            PRIMARY KEY (`ID`),
                                            KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
                                            KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
                                            CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
                                            CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('025e5503-04c9-4524-a55c-e92a39e57965',NULL,'direct-grant-validate-username','trust','191e8b66-382b-4c8c-9955-44e46ae212d4',0,10,'\0',NULL,NULL),('02976fdf-e59e-4607-b1fb-ae4382cdd349',NULL,NULL,'construction','769c8375-cf4e-43de-941b-76dbce13094f',2,30,'','74eebe8c-11c9-430f-b1cc-ae3cef469cc6',NULL),('035461f9-7d6d-4b3a-9da1-388224574104',NULL,'conditional-user-configured','master','f27353da-b288-4078-8da7-194319803e0d',0,10,'\0',NULL,NULL),('0382fa78-3ed2-49ba-8cd9-6bcff78a88ff',NULL,'client-secret-jwt','trust','ff43bca3-7757-449b-b077-5f272d3449a8',2,30,'\0',NULL,NULL),('0449707f-2543-4f9d-b8eb-40a36a78a82f',NULL,'reset-password','master','dac46ecd-87f7-46da-8298-0bbb3e58b00b',0,30,'\0',NULL,NULL),('07313f4c-f60c-4be9-b40c-e92a238a6e1b',NULL,'conditional-user-configured','construction','914843dc-be55-48b7-8558-1d9c025b68a2',0,10,'\0',NULL,NULL),('08699447-c4ce-40be-87c3-e71143862c03',NULL,'identity-provider-redirector','trust','aac777ed-d472-484b-973e-80ece83c67a1',2,25,'\0',NULL,NULL),('0ce07878-7efb-4551-9f63-c3378c1b787b',NULL,'docker-http-basic-authenticator','trust','2cde326e-68aa-407f-84fe-3eb595a8cb1a',0,10,'\0',NULL,NULL),('0e5edf88-6ade-4c06-ab9a-0eb74b8dd1a4',NULL,'auth-username-password-form','master','56276fda-c40c-427c-9d1d-e45f0da46ac1',0,10,'\0',NULL,NULL),('0f462afd-cb27-4c8c-9a3c-a48e9b08fcd8',NULL,'basic-auth-otp','master','6c2024a5-a29f-4100-932c-802d2356c7ad',3,20,'\0',NULL,NULL),('10a087f4-0b3a-4ff3-bf52-94741f1dcf0b',NULL,NULL,'master','8f854879-029d-451f-b4d6-503ba61fb022',0,20,'','6c2024a5-a29f-4100-932c-802d2356c7ad',NULL),('12226c06-7de8-41e3-8c19-ca47161945c6',NULL,'idp-confirm-link','construction','ee25d170-09d1-4d11-a8b1-9882dd03fca3',0,10,'\0',NULL,NULL),('1303aa60-1957-484c-9d48-1417d380dc2f',NULL,NULL,'master','760d1d34-0248-428e-8462-424b296f0d5b',2,20,'','1890dcbd-9fb6-4b8f-b39f-badff8721b4c',NULL),('16a23bf0-416e-4a2a-a643-78d7f77090b6',NULL,NULL,'trust','08698fc7-19c2-447b-9e9d-c495920e1fc6',2,20,'','e4a059bd-4b78-4351-846b-02976a165c99',NULL),('1d47466c-22a8-4066-b7d7-dbb3614eff74',NULL,'http-basic-authenticator','master','7e5d5a9f-b5fa-4786-b6bc-512265be4b6d',0,10,'\0',NULL,NULL),('1d945514-d869-42af-a5f6-20e8ab874e76',NULL,'idp-create-user-if-unique','master','cc52369f-37de-463a-aaf7-c18c2db1a2bb',2,10,'\0',NULL,'09cab263-df14-415d-a0cd-ad437ff14347'),('1dea4aa8-45ed-4320-963d-25701a368764',NULL,'basic-auth','master','6c2024a5-a29f-4100-932c-802d2356c7ad',0,10,'\0',NULL,NULL),('1f770ae6-97d6-4c44-9750-cda96f4ec0b4',NULL,'client-jwt','master','4a4ba856-0f0b-4abf-953b-8e905304f630',2,20,'\0',NULL,NULL),('200b5c69-e4ac-4062-8917-cc354e277b65',NULL,'idp-email-verification','master','760d1d34-0248-428e-8462-424b296f0d5b',2,10,'\0',NULL,NULL),('20d3d460-776f-4189-b8f7-73ce80399687',NULL,'client-jwt','construction','58bf9963-0ca8-4695-a5c7-b212eb3c6ee6',2,20,'\0',NULL,NULL),('2325cab5-fb96-496c-b7af-1d0f3b60aa38',NULL,'auth-spnego','trust','cdc13578-df7f-482a-9cad-31014f1ffc9b',3,30,'\0',NULL,NULL),('248da709-5a43-4de9-9b34-a0101c86c794',NULL,NULL,'trust','0ffa977f-d054-4155-ab1e-6aa27d669fef',0,20,'','08698fc7-19c2-447b-9e9d-c495920e1fc6',NULL),('24dfa9bc-40e5-41d4-bd1d-3a7ac73d5c14',NULL,NULL,'trust','aac777ed-d472-484b-973e-80ece83c67a1',2,30,'','aa634e45-a82c-4ad8-8343-8da1f1692a4c',NULL),('257e5fbd-fc70-4fe7-9ed5-d4ef0df2a515',NULL,'client-secret','trust','ff43bca3-7757-449b-b077-5f272d3449a8',2,10,'\0',NULL,NULL),('3051f8e0-154b-4305-bc8e-3b6a46fba32b',NULL,'idp-username-password-form','trust','e4a059bd-4b78-4351-846b-02976a165c99',0,10,'\0',NULL,NULL),('316337d9-bae7-477f-9964-743aa657394e',NULL,'registration-user-creation','master','23aa340c-936b-4c1f-8ab0-e8e610ca77ba',0,20,'\0',NULL,NULL),('32accc30-0d53-4c3e-8fc7-5a2b5a0918ce',NULL,'auth-username-password-form','construction','74eebe8c-11c9-430f-b1cc-ae3cef469cc6',0,10,'\0',NULL,NULL),('33f3c60d-7a53-45fe-8704-509e2d3cc085',NULL,'registration-password-action','construction','555559b7-54db-4245-a636-c563d1328a63',0,50,'\0',NULL,NULL),('3435ce64-3f51-463b-b267-2a9050bdc0cc',NULL,NULL,'construction','373cc1eb-16d3-41e4-bccb-0ec04d6c9cfe',0,20,'','ab1b7fc6-ea68-4757-8c52-fc310999244d',NULL),('34609b6a-cb76-41a6-bcac-a07ca4d98bdc',NULL,'basic-auth-otp','trust','cdc13578-df7f-482a-9cad-31014f1ffc9b',3,20,'\0',NULL,NULL),('367dd33a-da5d-43ed-8281-908eeed175e3',NULL,NULL,'trust','17d781d4-3b60-4506-8579-f7ec1485aa4c',1,40,'','ade0f99c-cd36-4b98-9ad5-c90a1f8f041a',NULL),('3693d0b3-b316-461e-a6ed-82470643c8e5',NULL,'conditional-user-configured','master','035c10c5-44c8-4f83-8834-3c719d049c0b',0,10,'\0',NULL,NULL),('38a5fbf9-2fb0-494e-b3e5-7751f2941a1f',NULL,'client-secret','master','4a4ba856-0f0b-4abf-953b-8e905304f630',2,10,'\0',NULL,NULL),('3ae02edc-f77d-4feb-8e4c-befa37ee0ad9',NULL,'registration-user-creation','trust','08883e68-5ab2-4d67-b2d0-f265c8aa175a',0,20,'\0',NULL,NULL),('3c292f4c-6793-4056-9c24-f1bf4dd7ac90',NULL,'conditional-user-configured','construction','c6ac6b60-f7a9-46a0-a889-e66d8957a924',0,10,'\0',NULL,NULL),('3dc70260-7b3e-4d3a-a287-9f22a03b4e42',NULL,'idp-create-user-if-unique','construction','ab1b7fc6-ea68-4757-8c52-fc310999244d',2,10,'\0',NULL,'b378c661-8682-4d48-9f9b-228dbaf5232a'),('3e5c4212-3070-48e3-b5b3-628b6ddbbfc5',NULL,NULL,'master','1890dcbd-9fb6-4b8f-b39f-badff8721b4c',1,20,'','f27353da-b288-4078-8da7-194319803e0d',NULL),('3fdd891b-4434-481e-b506-075edad3d82a',NULL,'idp-create-user-if-unique','trust','28fe69dc-521c-40d5-bb0b-540a2677c6dc',2,10,'\0',NULL,'195cc158-09f0-4d07-b905-b213de99f114'),('401079f2-92f4-4945-b7d4-87beeb61d0aa',NULL,'basic-auth-otp','construction','003d4e2d-e66c-4fea-a0bf-4620538db002',3,20,'\0',NULL,NULL),('40a99199-67d4-4c18-9109-21ca248961c5',NULL,'http-basic-authenticator','trust','c4caf025-9112-4587-a00c-13bf5aad8f1e',0,10,'\0',NULL,NULL),('40d73d96-5813-4923-9aa8-c0b8ea2ea28e',NULL,'direct-grant-validate-password','master','56e6f31a-a533-4239-b797-5ab9f9dd9cfa',0,20,'\0',NULL,NULL),('48b8c10d-810b-4eb4-9901-45d53b4e89f5',NULL,'auth-cookie','construction','769c8375-cf4e-43de-941b-76dbce13094f',2,10,'\0',NULL,NULL),('49bd96da-36f2-43ad-b139-2398a547a128',NULL,'registration-page-form','construction','26493c0b-7097-41cf-bafc-7520ca576d19',0,10,'','555559b7-54db-4245-a636-c563d1328a63',NULL),('4aa18d69-2f7a-4357-8b4e-f05d8a83b3d6',NULL,'registration-password-action','trust','08883e68-5ab2-4d67-b2d0-f265c8aa175a',0,50,'\0',NULL,NULL),('4c0eb858-eb59-4535-878a-d753e01a7fb2',NULL,NULL,'construction','8c84620b-e028-41f6-b6f5-a26b521c59fa',1,40,'','c6ac6b60-f7a9-46a0-a889-e66d8957a924',NULL),('4c822c11-47fe-4ba2-9336-2999d6d056a3',NULL,'auth-spnego','construction','003d4e2d-e66c-4fea-a0bf-4620538db002',3,30,'\0',NULL,NULL),('4ec312f8-17bb-484e-a271-24b212e505a0',NULL,'direct-grant-validate-otp','master','a948412d-0521-4d07-a8de-45c41e136afb',0,20,'\0',NULL,NULL),('4fc5dc57-e3aa-4425-8514-1f40831649fa',NULL,NULL,'trust','e4a059bd-4b78-4351-846b-02976a165c99',1,20,'','5c6f8357-bfe6-4ed4-9003-a1800546c14b',NULL),('51722ab7-b19f-4692-9b6c-302fd951ee8d',NULL,'direct-grant-validate-password','construction','1a63f39d-40b8-4db0-b207-4e1f5a3c9017',0,20,'\0',NULL,NULL),('51e1c2de-3a52-4e04-adce-91e2c9957fe8',NULL,'registration-profile-action','trust','08883e68-5ab2-4d67-b2d0-f265c8aa175a',0,40,'\0',NULL,NULL),('55b2e701-4be9-47dd-ba65-82dd19d9dcf2',NULL,NULL,'master','56276fda-c40c-427c-9d1d-e45f0da46ac1',1,20,'','035c10c5-44c8-4f83-8834-3c719d049c0b',NULL),('56ed54d1-d9c5-46f3-9679-88c3a8cd8a7e',NULL,'auth-otp-form','trust','58ff0e9d-855f-4b19-81d4-8a3b8876f9a5',0,20,'\0',NULL,NULL),('5b49621d-7d5a-45a2-b50a-fb764c7fa92c',NULL,'auth-otp-form','construction','914843dc-be55-48b7-8558-1d9c025b68a2',0,20,'\0',NULL,NULL),('5b5618d8-9a2b-43cd-9c44-f50b7902f823',NULL,'client-secret-jwt','construction','58bf9963-0ca8-4695-a5c7-b212eb3c6ee6',2,30,'\0',NULL,NULL),('5d04e13b-fb80-4df7-9246-4da025dd3631',NULL,NULL,'trust','01c621c7-0df7-449f-8001-396ec63fed84',0,20,'','cdc13578-df7f-482a-9cad-31014f1ffc9b',NULL),('5e2040bd-ccec-4a8e-8cb1-60c1376fb577',NULL,'direct-grant-validate-password','trust','191e8b66-382b-4c8c-9955-44e46ae212d4',0,20,'\0',NULL,NULL),('641dfc44-6243-49d1-b96a-7fda4e2a71db',NULL,'auth-otp-form','master','035c10c5-44c8-4f83-8834-3c719d049c0b',0,20,'\0',NULL,NULL),('646daab9-536a-4321-bdc3-b9428bb2ff84',NULL,'reset-credential-email','construction','8c84620b-e028-41f6-b6f5-a26b521c59fa',0,20,'\0',NULL,NULL),('671470ba-d692-412c-be79-eee50e273597',NULL,NULL,'trust','84d3db43-80ca-4a82-884c-5cadca3fcc18',0,20,'','28fe69dc-521c-40d5-bb0b-540a2677c6dc',NULL),('6b0ce1e2-a596-44b2-8187-7b9f741b91ac',NULL,'idp-review-profile','trust','84d3db43-80ca-4a82-884c-5cadca3fcc18',0,10,'\0',NULL,'3b2a8651-6c60-4699-9268-443dbe525328'),('6c90e251-fa59-4596-b3c4-393e83b3aaed',NULL,NULL,'trust','191e8b66-382b-4c8c-9955-44e46ae212d4',1,30,'','6394b13f-9ea6-44d8-bb56-64d6ab71a486',NULL),('6d364747-9f77-48b3-a924-bf9a967c37d0',NULL,NULL,'construction','1a63f39d-40b8-4db0-b207-4e1f5a3c9017',1,30,'','ee7bd54b-b1f5-4404-9438-12896397d670',NULL),('6fe3a439-b6aa-4c74-b450-7235e7d254c5',NULL,'identity-provider-redirector','construction','769c8375-cf4e-43de-941b-76dbce13094f',2,25,'\0',NULL,NULL),('700007a9-817e-4e88-83e6-68e8e9c1793f',NULL,NULL,'construction','74eebe8c-11c9-430f-b1cc-ae3cef469cc6',1,20,'','914843dc-be55-48b7-8558-1d9c025b68a2',NULL),('70fdb9c2-7bf4-467c-a094-a033edb0f08c',NULL,'registration-page-form','trust','d043c06e-d72b-411a-b6c3-3ff4ab6b5683',0,10,'','08883e68-5ab2-4d67-b2d0-f265c8aa175a',NULL),('71b561da-0996-46cf-8779-d25062cf672c',NULL,NULL,'master','0c010811-d261-4b2f-97be-c468a4fa2a59',0,20,'','cc52369f-37de-463a-aaf7-c18c2db1a2bb',NULL),('73d2bf61-4386-4390-a423-1ccc48afc34f',NULL,'conditional-user-configured','construction','ee7bd54b-b1f5-4404-9438-12896397d670',0,10,'\0',NULL,NULL),('77474249-2cf6-4a8b-86bd-1f24d2ad74f3',NULL,NULL,'master','dac46ecd-87f7-46da-8298-0bbb3e58b00b',1,40,'','631dea08-e522-4fff-874e-40bf6cd2e3ed',NULL),('7de2b9f5-28bc-4ced-a43c-288e90c5db4b',NULL,'idp-email-verification','trust','08698fc7-19c2-447b-9e9d-c495920e1fc6',2,10,'\0',NULL,NULL),('7ffadd66-1a74-47da-9996-16e01f73cf3b',NULL,'direct-grant-validate-otp','trust','6394b13f-9ea6-44d8-bb56-64d6ab71a486',0,20,'\0',NULL,NULL),('81ca26da-83e3-477e-9607-56aa8e33792c',NULL,'client-secret','construction','58bf9963-0ca8-4695-a5c7-b212eb3c6ee6',2,10,'\0',NULL,NULL),('864feed2-a871-4233-a513-3ca000b1e3fc',NULL,'auth-spnego','trust','aac777ed-d472-484b-973e-80ece83c67a1',3,20,'\0',NULL,NULL),('875e0097-cb98-42e5-abf6-41f4a0255af3',NULL,'conditional-user-configured','trust','5c6f8357-bfe6-4ed4-9003-a1800546c14b',0,10,'\0',NULL,NULL),('88793db7-5c55-4fee-829e-38bb064c1548',NULL,'auth-otp-form','master','f27353da-b288-4078-8da7-194319803e0d',0,20,'\0',NULL,NULL),('89b6b9d2-313d-473f-b3d7-109ec1f18992',NULL,'conditional-user-configured','construction','28bf8646-ec1b-4909-90b8-894292ed31e3',0,10,'\0',NULL,NULL),('8ba594d2-1a2c-4e4f-bc42-86159fdce0ee',NULL,'idp-confirm-link','trust','0ffa977f-d054-4155-ab1e-6aa27d669fef',0,10,'\0',NULL,NULL),('8f43d904-b5ce-408c-a3fe-c2d0f88801eb',NULL,'conditional-user-configured','trust','6394b13f-9ea6-44d8-bb56-64d6ab71a486',0,10,'\0',NULL,NULL),('8f819dbd-f0d9-4415-b8fb-94518e3c5f5a',NULL,'reset-password','trust','17d781d4-3b60-4506-8579-f7ec1485aa4c',0,30,'\0',NULL,NULL),('908985d3-5dfc-4b1d-bffb-6f08cad174d3',NULL,'client-x509','master','4a4ba856-0f0b-4abf-953b-8e905304f630',2,40,'\0',NULL,NULL),('90940132-63d3-4e04-86f7-a2a2fe5b52ca',NULL,'client-x509','construction','58bf9963-0ca8-4695-a5c7-b212eb3c6ee6',2,40,'\0',NULL,NULL),('978a8094-8a25-4647-a6bf-98e10142f10c',NULL,'conditional-user-configured','trust','58ff0e9d-855f-4b19-81d4-8a3b8876f9a5',0,10,'\0',NULL,NULL),('9c2498c2-4808-4ebc-b489-24f41b288615',NULL,'reset-credentials-choose-user','master','dac46ecd-87f7-46da-8298-0bbb3e58b00b',0,10,'\0',NULL,NULL),('9d4fbeaf-3d2d-4ddd-ad5e-d589d5fdd385',NULL,NULL,'trust','28fe69dc-521c-40d5-bb0b-540a2677c6dc',2,20,'','0ffa977f-d054-4155-ab1e-6aa27d669fef',NULL),('9e4c29b8-9e49-4df6-9659-259d8ba48a78',NULL,'basic-auth','trust','cdc13578-df7f-482a-9cad-31014f1ffc9b',0,10,'\0',NULL,NULL),('9f4a6e05-a9ff-4e23-ace8-e3d0ef2061a2',NULL,'conditional-user-configured','master','a948412d-0521-4d07-a8de-45c41e136afb',0,10,'\0',NULL,NULL),('a093b28c-08de-4a25-a090-ab62da47f56b',NULL,'registration-password-action','master','23aa340c-936b-4c1f-8ab0-e8e610ca77ba',0,50,'\0',NULL,NULL),('a37c49bb-753f-45b1-a35a-fbf508069664',NULL,NULL,'trust','aa634e45-a82c-4ad8-8343-8da1f1692a4c',1,20,'','58ff0e9d-855f-4b19-81d4-8a3b8876f9a5',NULL),('a44bb5e0-a716-4dd2-8399-6ff8c4621c9e',NULL,'registration-profile-action','master','23aa340c-936b-4c1f-8ab0-e8e610ca77ba',0,40,'\0',NULL,NULL),('a51ff106-8e8c-459e-a403-4f72b4663f0e',NULL,NULL,'construction','a087583f-3ca8-457f-94b5-6f83f2192116',1,20,'','28bf8646-ec1b-4909-90b8-894292ed31e3',NULL),('a8911cd4-237d-49d7-bf97-b346d0e8bf85',NULL,'registration-recaptcha-action','trust','08883e68-5ab2-4d67-b2d0-f265c8aa175a',3,60,'\0',NULL,NULL),('aaf486de-8484-4fc8-a295-d516d7b00002',NULL,'direct-grant-validate-otp','construction','ee7bd54b-b1f5-4404-9438-12896397d670',0,20,'\0',NULL,NULL),('ab970fa2-5bfa-403e-a05b-d3daeeb0a547',NULL,'no-cookie-redirect','trust','01c621c7-0df7-449f-8001-396ec63fed84',0,10,'\0',NULL,NULL),('abaf6f72-fb09-45ad-bb4e-b0c432247afd',NULL,'auth-spnego','master','e96a88dd-b6af-44ed-870b-69a45e8bb002',3,20,'\0',NULL,NULL),('ae704967-6f35-41a7-9219-09820d9113ff',NULL,'conditional-user-configured','master','631dea08-e522-4fff-874e-40bf6cd2e3ed',0,10,'\0',NULL,NULL),('aedce3bf-c584-4126-be40-505f6e2a8385',NULL,'client-jwt','trust','ff43bca3-7757-449b-b077-5f272d3449a8',2,20,'\0',NULL,NULL),('b11f9692-2925-4691-a6ea-4098c8001fc7',NULL,'http-basic-authenticator','construction','cf38b50e-32cd-40b0-ba93-7900cd892539',0,10,'\0',NULL,NULL),('b552a079-c628-4e0e-941c-c8a371b7a4d1',NULL,'reset-credentials-choose-user','trust','17d781d4-3b60-4506-8579-f7ec1485aa4c',0,10,'\0',NULL,NULL),('b75bb6af-ff56-4def-add6-2605d1cbd9c6',NULL,NULL,'construction','ab1b7fc6-ea68-4757-8c52-fc310999244d',2,20,'','ee25d170-09d1-4d11-a8b1-9882dd03fca3',NULL),('b7c100b1-b5cc-4bc3-9ec7-a44f3ce8be64',NULL,'docker-http-basic-authenticator','construction','5646f563-a8f8-4337-8ac0-2f4bcb751975',0,10,'\0',NULL,NULL),('b81860e1-953d-4932-9feb-f3f6191ef3b2',NULL,'docker-http-basic-authenticator','master','850fe371-2f0e-42e3-939d-aa8d498bfc2d',0,10,'\0',NULL,NULL),('b978a05b-dffa-4e1c-9df0-274ed839ba87',NULL,'auth-username-password-form','trust','aa634e45-a82c-4ad8-8343-8da1f1692a4c',0,10,'\0',NULL,NULL),('bae8e22c-5339-41ae-9dca-3c4a8e292fad',NULL,'registration-profile-action','construction','555559b7-54db-4245-a636-c563d1328a63',0,40,'\0',NULL,NULL),('bb52bbd0-3e8a-458c-8ee3-7e230ad34dad',NULL,'auth-otp-form','trust','5c6f8357-bfe6-4ed4-9003-a1800546c14b',0,20,'\0',NULL,NULL),('bbbc8afe-5810-4c4d-9d20-a97e3608098f',NULL,NULL,'master','56e6f31a-a533-4239-b797-5ab9f9dd9cfa',1,30,'','a948412d-0521-4d07-a8de-45c41e136afb',NULL),('bd7a7e02-349c-4c07-9029-2fb5501b3047',NULL,'conditional-user-configured','trust','ade0f99c-cd36-4b98-9ad5-c90a1f8f041a',0,10,'\0',NULL,NULL),('bd80fa49-2bc7-42fb-af32-9d3fa01b3dc1',NULL,'reset-otp','trust','ade0f99c-cd36-4b98-9ad5-c90a1f8f041a',0,20,'\0',NULL,NULL),('bfdaac4e-afe4-45ea-a951-c41fa1d81b29',NULL,'idp-confirm-link','master','1fce13b2-2e7e-422c-aef3-db198cd071db',0,10,'\0',NULL,NULL),('c0801d14-ee9e-4971-bb0f-7a9ad0e27327',NULL,'no-cookie-redirect','master','8f854879-029d-451f-b4d6-503ba61fb022',0,10,'\0',NULL,NULL),('c0c1bcc6-32c2-4685-a5a9-609afafb3cb2',NULL,'auth-spnego','construction','769c8375-cf4e-43de-941b-76dbce13094f',3,20,'\0',NULL,NULL),('c1fed1de-9086-4cdc-987d-a541aae21ed5',NULL,'no-cookie-redirect','construction','cbc8c49d-9533-4a66-869c-5775c1e11d4c',0,10,'\0',NULL,NULL),('c35508af-7e96-4ea8-ac60-4c8bd5ef73fa',NULL,'idp-username-password-form','master','1890dcbd-9fb6-4b8f-b39f-badff8721b4c',0,10,'\0',NULL,NULL),('c7d086e4-643a-4fda-8c3a-a3c9173f6b59',NULL,'idp-email-verification','construction','ae56891a-be9c-4641-a076-e87a194b9ba5',2,10,'\0',NULL,NULL),('cc5b70dd-a8a9-4d62-ba3a-ec0abd083b8e',NULL,'reset-credentials-choose-user','construction','8c84620b-e028-41f6-b6f5-a26b521c59fa',0,10,'\0',NULL,NULL),('cdc55603-d82c-4dbf-ad01-daec5802f4ce',NULL,NULL,'construction','ee25d170-09d1-4d11-a8b1-9882dd03fca3',0,20,'','ae56891a-be9c-4641-a076-e87a194b9ba5',NULL),('d0efb8c7-9257-48aa-8b53-573244b80ef7',NULL,NULL,'master','1fce13b2-2e7e-422c-aef3-db198cd071db',0,20,'','760d1d34-0248-428e-8462-424b296f0d5b',NULL),('d2425254-cee8-4ba5-812b-9212840ef762',NULL,'idp-username-password-form','construction','a087583f-3ca8-457f-94b5-6f83f2192116',0,10,'\0',NULL,NULL),('d2d74099-8012-40fb-a850-5d61a2dda9ae',NULL,NULL,'construction','ae56891a-be9c-4641-a076-e87a194b9ba5',2,20,'','a087583f-3ca8-457f-94b5-6f83f2192116',NULL),('d323f0fe-825f-4e1c-9a82-0c3f0924411e',NULL,'auth-cookie','trust','aac777ed-d472-484b-973e-80ece83c67a1',2,10,'\0',NULL,NULL),('d410e4f4-4619-4726-97a3-28d914c0a7a9',NULL,NULL,'construction','cbc8c49d-9533-4a66-869c-5775c1e11d4c',0,20,'','003d4e2d-e66c-4fea-a0bf-4620538db002',NULL),('d5fa8224-6333-433b-ba52-c15ded7e759e',NULL,'registration-recaptcha-action','master','23aa340c-936b-4c1f-8ab0-e8e610ca77ba',3,60,'\0',NULL,NULL),('d612acde-d998-475f-90d8-65bca3c4aadb',NULL,'auth-cookie','master','e96a88dd-b6af-44ed-870b-69a45e8bb002',2,10,'\0',NULL,NULL),('d8ddd3a0-3ed8-44b0-9b56-8af6fcb60988',NULL,NULL,'master','e96a88dd-b6af-44ed-870b-69a45e8bb002',2,30,'','56276fda-c40c-427c-9d1d-e45f0da46ac1',NULL),('d99518c4-6d22-42e6-b2ab-044d25462e67',NULL,'reset-credential-email','master','dac46ecd-87f7-46da-8298-0bbb3e58b00b',0,20,'\0',NULL,NULL),('d9bf481f-fb8a-4f3c-9203-966b9f983b29',NULL,'idp-review-profile','master','0c010811-d261-4b2f-97be-c468a4fa2a59',0,10,'\0',NULL,'fb7de613-469b-4296-a995-c108b9eb0f3a'),('da824de0-0a7a-4973-86d3-801b2cb5f87f',NULL,'auth-otp-form','construction','28bf8646-ec1b-4909-90b8-894292ed31e3',0,20,'\0',NULL,NULL),('daa82e61-e3c4-4156-985f-f8df817324f2',NULL,'reset-password','construction','8c84620b-e028-41f6-b6f5-a26b521c59fa',0,30,'\0',NULL,NULL),('db6701a0-b6cd-4313-aced-e95c8a99a53e',NULL,'registration-page-form','master','5884c106-f26a-477a-b95e-0cb27048d161',0,10,'','23aa340c-936b-4c1f-8ab0-e8e610ca77ba',NULL),('db925528-5077-4a56-9a4d-57b99d33d947',NULL,'basic-auth','construction','003d4e2d-e66c-4fea-a0bf-4620538db002',0,10,'\0',NULL,NULL),('ddc4e10f-5997-4a3c-89c4-1cbd8aaad5f9',NULL,NULL,'master','cc52369f-37de-463a-aaf7-c18c2db1a2bb',2,20,'','1fce13b2-2e7e-422c-aef3-db198cd071db',NULL),('de181f2d-53c4-4f8e-ba74-271624ae5ea8',NULL,'client-x509','trust','ff43bca3-7757-449b-b077-5f272d3449a8',2,40,'\0',NULL,NULL),('df64d57e-da03-452b-9ced-d1cd1f9df639',NULL,'idp-review-profile','construction','373cc1eb-16d3-41e4-bccb-0ec04d6c9cfe',0,10,'\0',NULL,'bf4086fb-e9ea-4ab9-9563-aecc96f892ea'),('e02d4d0d-fc51-4368-9809-aeb82fa1de9b',NULL,'direct-grant-validate-username','construction','1a63f39d-40b8-4db0-b207-4e1f5a3c9017',0,10,'\0',NULL,NULL),('e3d5bbc6-b820-4180-9265-ad62f17bce95',NULL,'client-secret-jwt','master','4a4ba856-0f0b-4abf-953b-8e905304f630',2,30,'\0',NULL,NULL),('e5f95a90-09d9-48c5-95a5-1738eb1de74e',NULL,'registration-recaptcha-action','construction','555559b7-54db-4245-a636-c563d1328a63',3,60,'\0',NULL,NULL),('eebf61bd-2667-4ec9-8222-d84caa680767',NULL,'reset-credential-email','trust','17d781d4-3b60-4506-8579-f7ec1485aa4c',0,20,'\0',NULL,NULL),('f03c8cc8-0255-4723-885c-025466a46e87',NULL,'reset-otp','master','631dea08-e522-4fff-874e-40bf6cd2e3ed',0,20,'\0',NULL,NULL),('f03e245b-96a6-49f9-b9ca-f201fa57c463',NULL,'identity-provider-redirector','master','e96a88dd-b6af-44ed-870b-69a45e8bb002',2,25,'\0',NULL,NULL),('f704611e-7bc8-49e8-a722-8c83e9bc5340',NULL,'direct-grant-validate-username','master','56e6f31a-a533-4239-b797-5ab9f9dd9cfa',0,10,'\0',NULL,NULL),('f7da5fc5-00f6-4cf3-b0b4-9aa34f42c1b2',NULL,'reset-otp','construction','c6ac6b60-f7a9-46a0-a889-e66d8957a924',0,20,'\0',NULL,NULL),('fa2058b3-8dca-4da6-98ec-4f472596c71a',NULL,'registration-user-creation','construction','555559b7-54db-4245-a636-c563d1328a63',0,20,'\0',NULL,NULL),('faf16d96-0381-4331-b8dd-1ed491baa7aa',NULL,'auth-spnego','master','6c2024a5-a29f-4100-932c-802d2356c7ad',3,30,'\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
                                       `ID` varchar(36) NOT NULL,
                                       `ALIAS` varchar(255) DEFAULT NULL,
                                       `DESCRIPTION` varchar(255) DEFAULT NULL,
                                       `REALM_ID` varchar(36) DEFAULT NULL,
                                       `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
                                       `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
                                       `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
                                       PRIMARY KEY (`ID`),
                                       KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
                                       CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('003d4e2d-e66c-4fea-a0bf-4620538db002','Authentication Options','Authentication options.','construction','basic-flow','\0',''),('01c621c7-0df7-449f-8001-396ec63fed84','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','trust','basic-flow','',''),('035c10c5-44c8-4f83-8834-3c719d049c0b','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow','\0',''),('08698fc7-19c2-447b-9e9d-c495920e1fc6','Account verification options','Method with which to verity the existing account','trust','basic-flow','\0',''),('08883e68-5ab2-4d67-b2d0-f265c8aa175a','registration form','registration form','trust','form-flow','\0',''),('0c010811-d261-4b2f-97be-c468a4fa2a59','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow','',''),('0ffa977f-d054-4155-ab1e-6aa27d669fef','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','trust','basic-flow','\0',''),('17d781d4-3b60-4506-8579-f7ec1485aa4c','reset credentials','Reset credentials for a user if they forgot their password or something','trust','basic-flow','',''),('1890dcbd-9fb6-4b8f-b39f-badff8721b4c','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow','\0',''),('191e8b66-382b-4c8c-9955-44e46ae212d4','direct grant','OpenID Connect Resource Owner Grant','trust','basic-flow','',''),('1a63f39d-40b8-4db0-b207-4e1f5a3c9017','direct grant','OpenID Connect Resource Owner Grant','construction','basic-flow','',''),('1fce13b2-2e7e-422c-aef3-db198cd071db','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow','\0',''),('23aa340c-936b-4c1f-8ab0-e8e610ca77ba','registration form','registration form','master','form-flow','\0',''),('26493c0b-7097-41cf-bafc-7520ca576d19','registration','registration flow','construction','basic-flow','',''),('28bf8646-ec1b-4909-90b8-894292ed31e3','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','construction','basic-flow','\0',''),('28fe69dc-521c-40d5-bb0b-540a2677c6dc','User creation or linking','Flow for the existing/non-existing user alternatives','trust','basic-flow','\0',''),('2cde326e-68aa-407f-84fe-3eb595a8cb1a','docker auth','Used by Docker clients to authenticate against the IDP','trust','basic-flow','',''),('373cc1eb-16d3-41e4-bccb-0ec04d6c9cfe','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','construction','basic-flow','',''),('4a4ba856-0f0b-4abf-953b-8e905304f630','clients','Base authentication for clients','master','client-flow','',''),('555559b7-54db-4245-a636-c563d1328a63','registration form','registration form','construction','form-flow','\0',''),('56276fda-c40c-427c-9d1d-e45f0da46ac1','forms','Username, password, otp and other auth forms.','master','basic-flow','\0',''),('5646f563-a8f8-4337-8ac0-2f4bcb751975','docker auth','Used by Docker clients to authenticate against the IDP','construction','basic-flow','',''),('56e6f31a-a533-4239-b797-5ab9f9dd9cfa','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow','',''),('5884c106-f26a-477a-b95e-0cb27048d161','registration','registration flow','master','basic-flow','',''),('58bf9963-0ca8-4695-a5c7-b212eb3c6ee6','clients','Base authentication for clients','construction','client-flow','',''),('58ff0e9d-855f-4b19-81d4-8a3b8876f9a5','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','trust','basic-flow','\0',''),('5c6f8357-bfe6-4ed4-9003-a1800546c14b','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','trust','basic-flow','\0',''),('631dea08-e522-4fff-874e-40bf6cd2e3ed','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow','\0',''),('6394b13f-9ea6-44d8-bb56-64d6ab71a486','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','trust','basic-flow','\0',''),('6c2024a5-a29f-4100-932c-802d2356c7ad','Authentication Options','Authentication options.','master','basic-flow','\0',''),('74eebe8c-11c9-430f-b1cc-ae3cef469cc6','forms','Username, password, otp and other auth forms.','construction','basic-flow','\0',''),('760d1d34-0248-428e-8462-424b296f0d5b','Account verification options','Method with which to verity the existing account','master','basic-flow','\0',''),('769c8375-cf4e-43de-941b-76dbce13094f','browser','browser based authentication','construction','basic-flow','',''),('7e5d5a9f-b5fa-4786-b6bc-512265be4b6d','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow','',''),('84d3db43-80ca-4a82-884c-5cadca3fcc18','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','trust','basic-flow','',''),('850fe371-2f0e-42e3-939d-aa8d498bfc2d','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow','',''),('8c84620b-e028-41f6-b6f5-a26b521c59fa','reset credentials','Reset credentials for a user if they forgot their password or something','construction','basic-flow','',''),('8f854879-029d-451f-b4d6-503ba61fb022','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow','',''),('914843dc-be55-48b7-8558-1d9c025b68a2','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','construction','basic-flow','\0',''),('a087583f-3ca8-457f-94b5-6f83f2192116','Verify Existing Account by Re-authentication','Reauthentication of existing account','construction','basic-flow','\0',''),('a948412d-0521-4d07-a8de-45c41e136afb','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow','\0',''),('aa634e45-a82c-4ad8-8343-8da1f1692a4c','forms','Username, password, otp and other auth forms.','trust','basic-flow','\0',''),('aac777ed-d472-484b-973e-80ece83c67a1','browser','browser based authentication','trust','basic-flow','',''),('ab1b7fc6-ea68-4757-8c52-fc310999244d','User creation or linking','Flow for the existing/non-existing user alternatives','construction','basic-flow','\0',''),('ade0f99c-cd36-4b98-9ad5-c90a1f8f041a','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','trust','basic-flow','\0',''),('ae56891a-be9c-4641-a076-e87a194b9ba5','Account verification options','Method with which to verity the existing account','construction','basic-flow','\0',''),('c4caf025-9112-4587-a00c-13bf5aad8f1e','saml ecp','SAML ECP Profile Authentication Flow','trust','basic-flow','',''),('c6ac6b60-f7a9-46a0-a889-e66d8957a924','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','construction','basic-flow','\0',''),('cbc8c49d-9533-4a66-869c-5775c1e11d4c','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','construction','basic-flow','',''),('cc52369f-37de-463a-aaf7-c18c2db1a2bb','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow','\0',''),('cdc13578-df7f-482a-9cad-31014f1ffc9b','Authentication Options','Authentication options.','trust','basic-flow','\0',''),('cf38b50e-32cd-40b0-ba93-7900cd892539','saml ecp','SAML ECP Profile Authentication Flow','construction','basic-flow','',''),('d043c06e-d72b-411a-b6c3-3ff4ab6b5683','registration','registration flow','trust','basic-flow','',''),('dac46ecd-87f7-46da-8298-0bbb3e58b00b','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow','',''),('e4a059bd-4b78-4351-846b-02976a165c99','Verify Existing Account by Re-authentication','Reauthentication of existing account','trust','basic-flow','\0',''),('e96a88dd-b6af-44ed-870b-69a45e8bb002','browser','browser based authentication','master','basic-flow','',''),('ee25d170-09d1-4d11-a8b1-9882dd03fca3','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','construction','basic-flow','\0',''),('ee7bd54b-b1f5-4404-9438-12896397d670','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','construction','basic-flow','\0',''),('f27353da-b288-4078-8da7-194319803e0d','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow','\0',''),('ff43bca3-7757-449b-b077-5f272d3449a8','clients','Base authentication for clients','trust','client-flow','','');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
                                        `ID` varchar(36) NOT NULL,
                                        `ALIAS` varchar(255) DEFAULT NULL,
                                        `REALM_ID` varchar(36) DEFAULT NULL,
                                        PRIMARY KEY (`ID`),
                                        KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
                                        CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('09cab263-df14-415d-a0cd-ad437ff14347','create unique user config','master'),('195cc158-09f0-4d07-b905-b213de99f114','create unique user config','trust'),('3b2a8651-6c60-4699-9268-443dbe525328','review profile config','trust'),('b378c661-8682-4d48-9f9b-228dbaf5232a','create unique user config','construction'),('bf4086fb-e9ea-4ab9-9563-aecc96f892ea','review profile config','construction'),('fb7de613-469b-4296-a995-c108b9eb0f3a','review profile config','master');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
                                              `AUTHENTICATOR_ID` varchar(36) NOT NULL,
                                              `VALUE` longtext DEFAULT NULL,
                                              `NAME` varchar(255) NOT NULL,
                                              PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('09cab263-df14-415d-a0cd-ad437ff14347','false','require.password.update.after.registration'),('195cc158-09f0-4d07-b905-b213de99f114','false','require.password.update.after.registration'),('3b2a8651-6c60-4699-9268-443dbe525328','missing','update.profile.on.first.login'),('b378c661-8682-4d48-9f9b-228dbaf5232a','false','require.password.update.after.registration'),('bf4086fb-e9ea-4ab9-9563-aecc96f892ea','missing','update.profile.on.first.login'),('fb7de613-469b-4296-a995-c108b9eb0f3a','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BROKER_LINK` (
                               `IDENTITY_PROVIDER` varchar(255) NOT NULL,
                               `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
                               `REALM_ID` varchar(36) NOT NULL,
                               `BROKER_USER_ID` varchar(255) DEFAULT NULL,
                               `BROKER_USERNAME` varchar(255) DEFAULT NULL,
                               `TOKEN` text DEFAULT NULL,
                               `USER_ID` varchar(255) NOT NULL,
                               PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT` (
                          `ID` varchar(36) NOT NULL,
                          `ENABLED` bit(1) NOT NULL DEFAULT b'0',
                          `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
                          `CLIENT_ID` varchar(255) DEFAULT NULL,
                          `NOT_BEFORE` int(11) DEFAULT NULL,
                          `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
                          `SECRET` varchar(255) DEFAULT NULL,
                          `BASE_URL` varchar(255) DEFAULT NULL,
                          `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
                          `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
                          `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
                          `REALM_ID` varchar(36) DEFAULT NULL,
                          `PROTOCOL` varchar(255) DEFAULT NULL,
                          `NODE_REREG_TIMEOUT` int(11) DEFAULT 0,
                          `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
                          `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
                          `NAME` varchar(255) DEFAULT NULL,
                          `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                          `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
                          `ROOT_URL` varchar(255) DEFAULT NULL,
                          `DESCRIPTION` varchar(255) DEFAULT NULL,
                          `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
                          `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
                          `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                          `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                          `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
                          PRIMARY KEY (`ID`),
                          UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
                          KEY `IDX_CLIENT_ID` (`CLIENT_ID`),
                          CONSTRAINT `FK_P56CTINXXB9GSK57FO49F9TAC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('0435846b-6aa5-48b6-98b3-885a3cec91c8','','\0','admin-cli',0,'','b17300a6-9025-4754-99b3-4295069665f1',NULL,'\0',NULL,'\0','construction','openid-connect',0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0','','\0'),('0bd5b346-d57d-4efc-a702-40c3fd0203f7','','\0','security-admin-console',0,'','112354fc-3352-4d8f-94ad-962c6aca28dc','/admin/trust/console/','\0',NULL,'\0','trust','openid-connect',0,'\0','\0','${client_security-admin-console}','\0','client-secret','${authAdminUrl}',NULL,NULL,'','\0','\0','\0'),('215b05a7-f49b-4f55-9519-a54cf5f1f70a','','\0','account-console',0,'','28bb6991-6d9a-4f44-8484-2a0c0e52e9c8','/realms/master/account/','\0',NULL,'\0','master','openid-connect',0,'\0','\0','${client_account-console}','\0','client-secret','${authBaseUrl}',NULL,NULL,'','\0','\0','\0'),('220c4c49-dddd-4844-aed1-763a7d255c48','','\0','security-admin-console',0,'','5373cf77-5278-4d56-b721-acb051790442','/admin/construction/console/','\0',NULL,'\0','construction','openid-connect',0,'\0','\0','${client_security-admin-console}','\0','client-secret','${authAdminUrl}',NULL,NULL,'','\0','\0','\0'),('379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','\0','realm-management',0,'\0','395af4cd-4cb1-4285-880f-4779a56094ef',NULL,'',NULL,'\0','construction','openid-connect',0,'\0','\0','${client_realm-management}','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),('49d038c9-0c61-42eb-b467-4c912df46ddc','','\0','account-console',0,'','a3ea1da8-62e2-40f9-b1b6-fe7224f00678','/realms/trust/account/','\0',NULL,'\0','trust','openid-connect',0,'\0','\0','${client_account-console}','\0','client-secret','${authBaseUrl}',NULL,NULL,'','\0','\0','\0'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','','','corp',0,'','8e5b7665-9426-4ac0-8d87-6b27a753d135',NULL,'\0',NULL,'\0','trust','openid-connect',-1,'\0','\0',NULL,'\0','client-secret',NULL,NULL,NULL,'','\0','','\0'),('540a6346-7e98-4f0d-ad00-3b533b6959d3','','\0','security-admin-console',0,'','ca9a98ce-7be3-4771-8c5f-69f13929e1d1','/admin/master/console/','\0',NULL,'\0','master','openid-connect',0,'\0','\0','${client_security-admin-console}','\0','client-secret','${authAdminUrl}',NULL,NULL,'','\0','\0','\0'),('5b651231-7cfa-47b2-a23c-7d364fccc758','','\0','broker',0,'\0','eca5eb8d-54f3-454f-a99a-58e419962f24',NULL,'\0',NULL,'\0','trust','openid-connect',0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),('6e1f5847-bd66-46dd-88e4-19991a631b95','','\0','account',0,'\0','3ecd9ede-d564-4729-be63-da63ea3f3517','/realms/trust/account/','\0',NULL,'\0','trust','openid-connect',0,'\0','\0','${client_account}','\0','client-secret','${authBaseUrl}',NULL,NULL,'','\0','\0','\0'),('6fa31952-cca3-498d-8389-d4d0065ceeb0','','\0','admin-cli',0,'','f4ef8bd7-9cdb-42df-aac1-6e7a3c6d9b43',NULL,'\0',NULL,'\0','master','openid-connect',0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0','','\0'),('82468a88-24fb-43f2-bfcf-96f218188c5b','','','construction-realm',0,'\0','8d458593-1aeb-4c66-8955-c99820d532db',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','construction Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','','','corp-admin',0,'\0','916109ff-b3f9-4018-a251-8fb0a716dfd1',NULL,'\0',NULL,'\0','trust','openid-connect',-1,'\0','\0',NULL,'','client-secret',NULL,NULL,NULL,'','\0','','\0'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','','','extends',0,'\0','c8f7d947-b83c-4adf-bff8-93b1a49ba2a2',NULL,'\0',NULL,'\0','construction','openid-connect',-1,'\0','\0',NULL,'','client-secret',NULL,NULL,NULL,'','\0','','\0'),('931bf1fd-bd9a-4916-b11a-5ff899e0af74','','\0','broker',0,'\0','f65cb58a-0a44-47aa-abd8-c37f1322c1df',NULL,'\0',NULL,'\0','master','openid-connect',0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),('993444bd-7dc1-4332-95dd-ab8c6a4ebdee','','\0','broker',0,'\0','24e562e3-c8c7-4f01-a0c8-486454aa7b07',NULL,'\0',NULL,'\0','construction','openid-connect',0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','','','master',0,'','8b173c24-d9b2-4238-b8a2-c2e729feada5',NULL,'\0',NULL,'\0','construction','openid-connect',-1,'\0','\0',NULL,'\0','client-secret',NULL,NULL,NULL,'','\0','','\0'),('b22398b7-6b89-44bf-9e03-6935610362eb','','\0','realm-management',0,'\0','6977d398-c3a1-42c2-a6d2-eda49c57ef94',NULL,'',NULL,'\0','trust','openid-connect',0,'\0','\0','${client_realm-management}','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),('bc008dd4-1ecf-4906-900c-5e547094edf1','','\0','account-console',0,'','4d9e9361-8ceb-417b-8939-104a9a0be5c4','/realms/construction/account/','\0',NULL,'\0','construction','openid-connect',0,'\0','\0','${client_account-console}','\0','client-secret','${authBaseUrl}',NULL,NULL,'','\0','\0','\0'),('c0e394ec-dcae-4a2c-baa0-92a350359b95','','\0','account',0,'\0','077e024c-d01d-48dc-8a71-0a759abeb27e','/realms/master/account/','\0',NULL,'\0','master','openid-connect',0,'\0','\0','${client_account}','\0','client-secret','${authBaseUrl}',NULL,NULL,'','\0','\0','\0'),('d4ddb1f3-09e7-436b-831b-9b7ec2a5623f','','\0','admin-cli',0,'','cd74919b-b670-46f4-ad86-5b762315550b',NULL,'\0',NULL,'\0','trust','openid-connect',0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0','','\0'),('e0085400-94b1-4b08-b494-90cf04b32d5f','','','master-realm',0,'\0','d754316f-c560-4183-ac8d-71b8ae9c901c',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','master Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),('e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','','trust-realm',0,'\0','f55eda52-275b-4fbd-ada7-90ff2bcaa5d2',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','trust Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0','\0'),('f36a1425-06a7-4f80-9c6a-60de16abe424','','\0','account',0,'\0','b363c6fb-b619-4a0a-8577-a87db17e6caf','/realms/construction/account/','\0',NULL,'\0','construction','openid-connect',0,'\0','\0','${client_account}','\0','client-secret','${authBaseUrl}',NULL,NULL,'','\0','\0','\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
                                     `CLIENT_ID` varchar(36) NOT NULL,
                                     `VALUE` text DEFAULT NULL,
                                     `NAME` varchar(255) NOT NULL,
                                     PRIMARY KEY (`CLIENT_ID`,`NAME`),
                                     CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('0bd5b346-d57d-4efc-a702-40c3fd0203f7','S256','pkce.code.challenge.method'),('215b05a7-f49b-4f55-9519-a54cf5f1f70a','S256','pkce.code.challenge.method'),('220c4c49-dddd-4844-aed1-763a7d255c48','S256','pkce.code.challenge.method'),('49d038c9-0c61-42eb-b467-4c912df46ddc','S256','pkce.code.challenge.method'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','false','display.on.consent.screen'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','false','exclude.session.state.from.auth.response'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','false','saml.assertion.signature'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','false','saml.authnstatement'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','false','saml.client.signature'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','false','saml.encrypt'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','false','saml.force.post.binding'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','false','saml.multivalued.roles'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','false','saml.onetimeuse.condition'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','false','saml.server.signature'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','false','saml.server.signature.keyinfo.ext'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','false','saml_force_name_id_format'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','false','tls.client.certificate.bound.access.tokens'),('540a6346-7e98-4f0d-ad00-3b533b6959d3','S256','pkce.code.challenge.method'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','false','display.on.consent.screen'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','false','exclude.session.state.from.auth.response'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','false','saml.assertion.signature'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','false','saml.authnstatement'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','false','saml.client.signature'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','false','saml.encrypt'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','false','saml.force.post.binding'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','false','saml.multivalued.roles'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','false','saml.onetimeuse.condition'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','false','saml.server.signature'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','false','saml.server.signature.keyinfo.ext'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','false','saml_force_name_id_format'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','false','tls.client.certificate.bound.access.tokens'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','false','display.on.consent.screen'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','false','exclude.session.state.from.auth.response'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','false','saml.assertion.signature'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','false','saml.authnstatement'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','false','saml.client.signature'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','false','saml.encrypt'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','false','saml.force.post.binding'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','false','saml.multivalued.roles'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','false','saml.onetimeuse.condition'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','false','saml.server.signature'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','false','saml.server.signature.keyinfo.ext'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','false','saml_force_name_id_format'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','false','tls.client.certificate.bound.access.tokens'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e',NULL,'access.token.lifespan'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','false','display.on.consent.screen'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','false','exclude.session.state.from.auth.response'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','false','saml.assertion.signature'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','false','saml.authnstatement'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','false','saml.client.signature'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','false','saml.encrypt'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','false','saml.force.post.binding'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','false','saml.multivalued.roles'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','false','saml.onetimeuse.condition'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','false','saml.server.signature'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','false','saml.server.signature.keyinfo.ext'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','false','saml_force_name_id_format'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','false','tls.client.certificate.bound.access.tokens'),('bc008dd4-1ecf-4906-900c-5e547094edf1','S256','pkce.code.challenge.method');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
                                             `CLIENT_ID` varchar(36) NOT NULL,
                                             `FLOW_ID` varchar(36) DEFAULT NULL,
                                             `BINDING_NAME` varchar(255) NOT NULL,
                                             PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
INSERT INTO `CLIENT_AUTH_FLOW_BINDINGS` VALUES ('4b5b786e-975d-493f-9d72-f72fb75fa0e0','191e8b66-382b-4c8c-9955-44e46ae212d4','direct_grant'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','191e8b66-382b-4c8c-9955-44e46ae212d4','direct_grant'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','1a63f39d-40b8-4db0-b207-4e1f5a3c9017','direct_grant'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','1a63f39d-40b8-4db0-b207-4e1f5a3c9017','direct_grant');
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `CLIENT_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_DEFAULT_ROLES` (
                                        `CLIENT_ID` varchar(36) NOT NULL,
                                        `ROLE_ID` varchar(36) NOT NULL,
                                        PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
                                        UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`),
                                        KEY `IDX_CLIENT_DEF_ROLES_CLIENT` (`CLIENT_ID`),
                                        CONSTRAINT `FK_8AELWNIBJI49AVXSRTUF6XJOW` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
                                        CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_DEFAULT_ROLES`
--

LOCK TABLES `CLIENT_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `CLIENT_DEFAULT_ROLES` VALUES ('6e1f5847-bd66-46dd-88e4-19991a631b95','2db1209c-61fa-46c7-90bb-faa0d222f13a'),('6e1f5847-bd66-46dd-88e4-19991a631b95','e1aca465-d820-4c99-a787-b396bbb3a33d'),('c0e394ec-dcae-4a2c-baa0-92a350359b95','001b3850-326c-48df-a4f1-8498bc64ccf3'),('c0e394ec-dcae-4a2c-baa0-92a350359b95','7fa3323e-e047-4161-99c9-417eece03853'),('f36a1425-06a7-4f80-9c6a-60de16abe424','06e4bd27-f337-48da-a832-4df8b60cf928'),('f36a1425-06a7-4f80-9c6a-60de16abe424','3e7d3064-43ea-4faa-af29-4083f779dfb8');
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
                                         `ID` varchar(36) NOT NULL,
                                         `REALM_ID` varchar(36) NOT NULL,
                                         `TIMESTAMP` int(11) DEFAULT NULL,
                                         `EXPIRATION` int(11) DEFAULT NULL,
                                         `COUNT` int(11) DEFAULT NULL,
                                         `REMAINING_COUNT` int(11) DEFAULT NULL,
                                         PRIMARY KEY (`ID`),
                                         KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
                                         CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
                                             `CLIENT_ID` varchar(36) NOT NULL,
                                             `VALUE` int(11) DEFAULT NULL,
                                             `NAME` varchar(255) NOT NULL,
                                             PRIMARY KEY (`CLIENT_ID`,`NAME`),
                                             CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE` (
                                `ID` varchar(36) NOT NULL,
                                `NAME` varchar(255) DEFAULT NULL,
                                `REALM_ID` varchar(36) DEFAULT NULL,
                                `DESCRIPTION` varchar(255) DEFAULT NULL,
                                `PROTOCOL` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`ID`),
                                UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
                                KEY `IDX_REALM_CLSCOPE` (`REALM_ID`),
                                CONSTRAINT `FK_REALM_CLI_SCOPE` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('0888a299-af64-4825-95db-6733169b8469','offline_access','trust','OpenID Connect built-in scope: offline_access','openid-connect'),('0b1471a5-bdb0-43fa-bf0a-26ff7efd9cb9','Master','construction',NULL,'openid-connect'),('0e78a9f6-8400-495f-b3d7-6354c608c797','address','construction','OpenID Connect built-in scope: address','openid-connect'),('13d5a753-cea4-4415-a746-1c70ed5d57f9','microprofile-jwt','construction','Microprofile - JWT built-in scope','openid-connect'),('1bac2bcb-4e3d-4fda-ad61-639d0bd2b6e3','web-origins','trust','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('1effee3e-1734-42ed-a535-29e3c661ad11','role_list','trust','SAML role list','saml'),('27506d46-380c-4bb9-95cb-e8bf46ff33f0','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('2855ec8e-58c7-46aa-9dd2-86f1a6a037a1','phone','trust','OpenID Connect built-in scope: phone','openid-connect'),('2d62d5b9-3bec-4ce5-9209-932f5056a0c6','address','trust','OpenID Connect built-in scope: address','openid-connect'),('30e31c5b-fe12-4b55-9f26-a53d50233eb2','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('3257974f-b52a-4538-b2a9-689f32a4be2d','profile','construction','OpenID Connect built-in scope: profile','openid-connect'),('35e51935-479b-40a7-9d73-a69f5863ec13','email','trust','OpenID Connect built-in scope: email','openid-connect'),('4379d808-cca4-47bf-98e7-f10a03a8cf21','roles','trust','OpenID Connect scope for add user roles to the access token','openid-connect'),('48d6b2e1-c46c-41fb-ad16-4f572abe2864','email','master','OpenID Connect built-in scope: email','openid-connect'),('496a799c-9e6b-43a0-b8a0-40f4126449d1','role_list','master','SAML role list','saml'),('50920892-ce64-4d5e-8c74-cf1a17d8bb4e','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('57cb9d0c-0bc8-42b0-b20c-fc82995ff966','role_list','construction','SAML role list','saml'),('6a780e36-732b-4d58-a293-61e919265a55','profile','trust','OpenID Connect built-in scope: profile','openid-connect'),('6c8e6b24-c4ac-4f94-95e1-86b1250d2f91','CMS','construction',NULL,'openid-connect'),('726c7ef8-f786-4135-a815-a519eac86776','address','master','OpenID Connect built-in scope: address','openid-connect'),('7ebf6e4b-f469-4087-ac54-626895b64eb0','phone','construction','OpenID Connect built-in scope: phone','openid-connect'),('967c960c-61f0-426f-bb89-ad04ceecc1ca','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('9dc439ab-4342-4639-9ea0-a3cf838982fa','Extends','construction',NULL,'openid-connect'),('a8627868-8eaf-4b6d-863e-5cbd101a4eed','web-client','trust',NULL,'openid-connect'),('b1ab347a-2bf6-47e3-9ea4-99bdc6106c4f','offline_access','construction','OpenID Connect built-in scope: offline_access','openid-connect'),('be6a53d1-f80a-4316-b838-b34ca8f9e936','microprofile-jwt','trust','Microprofile - JWT built-in scope','openid-connect'),('c2620e25-b4f3-4015-8bf6-bc61bd597e4b','roles','construction','OpenID Connect scope for add user roles to the access token','openid-connect'),('c7ca3423-433b-4cbc-9b07-53bfc7095a91','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('cf947f87-1277-4482-afa3-248cdfdd4eb9','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('d1a9870e-c93c-4bd4-8982-f38b8ef67ad5','email','construction','OpenID Connect built-in scope: email','openid-connect'),('f6123a1d-8446-4431-a7db-ddb66a9b8aae','Trust','construction',NULL,'openid-connect'),('fcb30be2-a910-4037-b1e6-cb37981a9a6d','web-origins','construction','OpenID Connect scope for add allowed web origins to the access token','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
                                           `SCOPE_ID` varchar(36) NOT NULL,
                                           `VALUE` text DEFAULT NULL,
                                           `NAME` varchar(255) NOT NULL,
                                           PRIMARY KEY (`SCOPE_ID`,`NAME`),
                                           KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
                                           CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0888a299-af64-4825-95db-6733169b8469','${offlineAccessScopeConsentText}','consent.screen.text'),('0888a299-af64-4825-95db-6733169b8469','true','display.on.consent.screen'),('0b1471a5-bdb0-43fa-bf0a-26ff7efd9cb9','true','display.on.consent.screen'),('0b1471a5-bdb0-43fa-bf0a-26ff7efd9cb9','true','include.in.token.scope'),('0e78a9f6-8400-495f-b3d7-6354c608c797','${addressScopeConsentText}','consent.screen.text'),('0e78a9f6-8400-495f-b3d7-6354c608c797','true','display.on.consent.screen'),('0e78a9f6-8400-495f-b3d7-6354c608c797','true','include.in.token.scope'),('13d5a753-cea4-4415-a746-1c70ed5d57f9','false','display.on.consent.screen'),('13d5a753-cea4-4415-a746-1c70ed5d57f9','true','include.in.token.scope'),('1bac2bcb-4e3d-4fda-ad61-639d0bd2b6e3','','consent.screen.text'),('1bac2bcb-4e3d-4fda-ad61-639d0bd2b6e3','false','display.on.consent.screen'),('1bac2bcb-4e3d-4fda-ad61-639d0bd2b6e3','false','include.in.token.scope'),('1effee3e-1734-42ed-a535-29e3c661ad11','${samlRoleListScopeConsentText}','consent.screen.text'),('1effee3e-1734-42ed-a535-29e3c661ad11','true','display.on.consent.screen'),('27506d46-380c-4bb9-95cb-e8bf46ff33f0','${rolesScopeConsentText}','consent.screen.text'),('27506d46-380c-4bb9-95cb-e8bf46ff33f0','true','display.on.consent.screen'),('27506d46-380c-4bb9-95cb-e8bf46ff33f0','false','include.in.token.scope'),('2855ec8e-58c7-46aa-9dd2-86f1a6a037a1','${phoneScopeConsentText}','consent.screen.text'),('2855ec8e-58c7-46aa-9dd2-86f1a6a037a1','true','display.on.consent.screen'),('2855ec8e-58c7-46aa-9dd2-86f1a6a037a1','true','include.in.token.scope'),('2d62d5b9-3bec-4ce5-9209-932f5056a0c6','${addressScopeConsentText}','consent.screen.text'),('2d62d5b9-3bec-4ce5-9209-932f5056a0c6','true','display.on.consent.screen'),('2d62d5b9-3bec-4ce5-9209-932f5056a0c6','true','include.in.token.scope'),('30e31c5b-fe12-4b55-9f26-a53d50233eb2','false','display.on.consent.screen'),('30e31c5b-fe12-4b55-9f26-a53d50233eb2','true','include.in.token.scope'),('3257974f-b52a-4538-b2a9-689f32a4be2d','${profileScopeConsentText}','consent.screen.text'),('3257974f-b52a-4538-b2a9-689f32a4be2d','true','display.on.consent.screen'),('3257974f-b52a-4538-b2a9-689f32a4be2d','true','include.in.token.scope'),('35e51935-479b-40a7-9d73-a69f5863ec13','${emailScopeConsentText}','consent.screen.text'),('35e51935-479b-40a7-9d73-a69f5863ec13','true','display.on.consent.screen'),('35e51935-479b-40a7-9d73-a69f5863ec13','true','include.in.token.scope'),('4379d808-cca4-47bf-98e7-f10a03a8cf21','${rolesScopeConsentText}','consent.screen.text'),('4379d808-cca4-47bf-98e7-f10a03a8cf21','true','display.on.consent.screen'),('4379d808-cca4-47bf-98e7-f10a03a8cf21','false','include.in.token.scope'),('48d6b2e1-c46c-41fb-ad16-4f572abe2864','${emailScopeConsentText}','consent.screen.text'),('48d6b2e1-c46c-41fb-ad16-4f572abe2864','true','display.on.consent.screen'),('48d6b2e1-c46c-41fb-ad16-4f572abe2864','true','include.in.token.scope'),('496a799c-9e6b-43a0-b8a0-40f4126449d1','${samlRoleListScopeConsentText}','consent.screen.text'),('496a799c-9e6b-43a0-b8a0-40f4126449d1','true','display.on.consent.screen'),('50920892-ce64-4d5e-8c74-cf1a17d8bb4e','','consent.screen.text'),('50920892-ce64-4d5e-8c74-cf1a17d8bb4e','false','display.on.consent.screen'),('50920892-ce64-4d5e-8c74-cf1a17d8bb4e','false','include.in.token.scope'),('57cb9d0c-0bc8-42b0-b20c-fc82995ff966','${samlRoleListScopeConsentText}','consent.screen.text'),('57cb9d0c-0bc8-42b0-b20c-fc82995ff966','true','display.on.consent.screen'),('6a780e36-732b-4d58-a293-61e919265a55','${profileScopeConsentText}','consent.screen.text'),('6a780e36-732b-4d58-a293-61e919265a55','true','display.on.consent.screen'),('6a780e36-732b-4d58-a293-61e919265a55','true','include.in.token.scope'),('6c8e6b24-c4ac-4f94-95e1-86b1250d2f91','true','display.on.consent.screen'),('6c8e6b24-c4ac-4f94-95e1-86b1250d2f91','true','include.in.token.scope'),('726c7ef8-f786-4135-a815-a519eac86776','${addressScopeConsentText}','consent.screen.text'),('726c7ef8-f786-4135-a815-a519eac86776','true','display.on.consent.screen'),('726c7ef8-f786-4135-a815-a519eac86776','true','include.in.token.scope'),('7ebf6e4b-f469-4087-ac54-626895b64eb0','${phoneScopeConsentText}','consent.screen.text'),('7ebf6e4b-f469-4087-ac54-626895b64eb0','true','display.on.consent.screen'),('7ebf6e4b-f469-4087-ac54-626895b64eb0','true','include.in.token.scope'),('967c960c-61f0-426f-bb89-ad04ceecc1ca','${profileScopeConsentText}','consent.screen.text'),('967c960c-61f0-426f-bb89-ad04ceecc1ca','true','display.on.consent.screen'),('967c960c-61f0-426f-bb89-ad04ceecc1ca','true','include.in.token.scope'),('9dc439ab-4342-4639-9ea0-a3cf838982fa','true','display.on.consent.screen'),('9dc439ab-4342-4639-9ea0-a3cf838982fa','true','include.in.token.scope'),('a8627868-8eaf-4b6d-863e-5cbd101a4eed','true','display.on.consent.screen'),('a8627868-8eaf-4b6d-863e-5cbd101a4eed','true','include.in.token.scope'),('b1ab347a-2bf6-47e3-9ea4-99bdc6106c4f','${offlineAccessScopeConsentText}','consent.screen.text'),('b1ab347a-2bf6-47e3-9ea4-99bdc6106c4f','true','display.on.consent.screen'),('be6a53d1-f80a-4316-b838-b34ca8f9e936','false','display.on.consent.screen'),('be6a53d1-f80a-4316-b838-b34ca8f9e936','true','include.in.token.scope'),('c2620e25-b4f3-4015-8bf6-bc61bd597e4b','${rolesScopeConsentText}','consent.screen.text'),('c2620e25-b4f3-4015-8bf6-bc61bd597e4b','true','display.on.consent.screen'),('c2620e25-b4f3-4015-8bf6-bc61bd597e4b','false','include.in.token.scope'),('c7ca3423-433b-4cbc-9b07-53bfc7095a91','${offlineAccessScopeConsentText}','consent.screen.text'),('c7ca3423-433b-4cbc-9b07-53bfc7095a91','true','display.on.consent.screen'),('cf947f87-1277-4482-afa3-248cdfdd4eb9','${phoneScopeConsentText}','consent.screen.text'),('cf947f87-1277-4482-afa3-248cdfdd4eb9','true','display.on.consent.screen'),('cf947f87-1277-4482-afa3-248cdfdd4eb9','true','include.in.token.scope'),('d1a9870e-c93c-4bd4-8982-f38b8ef67ad5','${emailScopeConsentText}','consent.screen.text'),('d1a9870e-c93c-4bd4-8982-f38b8ef67ad5','true','display.on.consent.screen'),('d1a9870e-c93c-4bd4-8982-f38b8ef67ad5','true','include.in.token.scope'),('f6123a1d-8446-4431-a7db-ddb66a9b8aae','true','display.on.consent.screen'),('f6123a1d-8446-4431-a7db-ddb66a9b8aae','true','include.in.token.scope'),('fcb30be2-a910-4037-b1e6-cb37981a9a6d','','consent.screen.text'),('fcb30be2-a910-4037-b1e6-cb37981a9a6d','false','display.on.consent.screen'),('fcb30be2-a910-4037-b1e6-cb37981a9a6d','false','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
                                       `CLIENT_ID` varchar(36) NOT NULL,
                                       `SCOPE_ID` varchar(36) NOT NULL,
                                       `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
                                       PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
                                       KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
                                       KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`),
                                       CONSTRAINT `FK_C_CLI_SCOPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
                                       CONSTRAINT `FK_C_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('0435846b-6aa5-48b6-98b3-885a3cec91c8','0e78a9f6-8400-495f-b3d7-6354c608c797','\0'),('0435846b-6aa5-48b6-98b3-885a3cec91c8','13d5a753-cea4-4415-a746-1c70ed5d57f9','\0'),('0435846b-6aa5-48b6-98b3-885a3cec91c8','3257974f-b52a-4538-b2a9-689f32a4be2d',''),('0435846b-6aa5-48b6-98b3-885a3cec91c8','57cb9d0c-0bc8-42b0-b20c-fc82995ff966',''),('0435846b-6aa5-48b6-98b3-885a3cec91c8','7ebf6e4b-f469-4087-ac54-626895b64eb0','\0'),('0435846b-6aa5-48b6-98b3-885a3cec91c8','b1ab347a-2bf6-47e3-9ea4-99bdc6106c4f','\0'),('0435846b-6aa5-48b6-98b3-885a3cec91c8','c2620e25-b4f3-4015-8bf6-bc61bd597e4b',''),('0435846b-6aa5-48b6-98b3-885a3cec91c8','d1a9870e-c93c-4bd4-8982-f38b8ef67ad5',''),('0435846b-6aa5-48b6-98b3-885a3cec91c8','fcb30be2-a910-4037-b1e6-cb37981a9a6d',''),('0bd5b346-d57d-4efc-a702-40c3fd0203f7','0888a299-af64-4825-95db-6733169b8469','\0'),('0bd5b346-d57d-4efc-a702-40c3fd0203f7','1bac2bcb-4e3d-4fda-ad61-639d0bd2b6e3',''),('0bd5b346-d57d-4efc-a702-40c3fd0203f7','1effee3e-1734-42ed-a535-29e3c661ad11',''),('0bd5b346-d57d-4efc-a702-40c3fd0203f7','2855ec8e-58c7-46aa-9dd2-86f1a6a037a1','\0'),('0bd5b346-d57d-4efc-a702-40c3fd0203f7','2d62d5b9-3bec-4ce5-9209-932f5056a0c6','\0'),('0bd5b346-d57d-4efc-a702-40c3fd0203f7','35e51935-479b-40a7-9d73-a69f5863ec13',''),('0bd5b346-d57d-4efc-a702-40c3fd0203f7','4379d808-cca4-47bf-98e7-f10a03a8cf21',''),('0bd5b346-d57d-4efc-a702-40c3fd0203f7','6a780e36-732b-4d58-a293-61e919265a55',''),('0bd5b346-d57d-4efc-a702-40c3fd0203f7','be6a53d1-f80a-4316-b838-b34ca8f9e936','\0'),('215b05a7-f49b-4f55-9519-a54cf5f1f70a','27506d46-380c-4bb9-95cb-e8bf46ff33f0',''),('215b05a7-f49b-4f55-9519-a54cf5f1f70a','30e31c5b-fe12-4b55-9f26-a53d50233eb2','\0'),('215b05a7-f49b-4f55-9519-a54cf5f1f70a','48d6b2e1-c46c-41fb-ad16-4f572abe2864',''),('215b05a7-f49b-4f55-9519-a54cf5f1f70a','496a799c-9e6b-43a0-b8a0-40f4126449d1',''),('215b05a7-f49b-4f55-9519-a54cf5f1f70a','50920892-ce64-4d5e-8c74-cf1a17d8bb4e',''),('215b05a7-f49b-4f55-9519-a54cf5f1f70a','726c7ef8-f786-4135-a815-a519eac86776','\0'),('215b05a7-f49b-4f55-9519-a54cf5f1f70a','967c960c-61f0-426f-bb89-ad04ceecc1ca',''),('215b05a7-f49b-4f55-9519-a54cf5f1f70a','c7ca3423-433b-4cbc-9b07-53bfc7095a91','\0'),('215b05a7-f49b-4f55-9519-a54cf5f1f70a','cf947f87-1277-4482-afa3-248cdfdd4eb9','\0'),('220c4c49-dddd-4844-aed1-763a7d255c48','0e78a9f6-8400-495f-b3d7-6354c608c797','\0'),('220c4c49-dddd-4844-aed1-763a7d255c48','13d5a753-cea4-4415-a746-1c70ed5d57f9','\0'),('220c4c49-dddd-4844-aed1-763a7d255c48','3257974f-b52a-4538-b2a9-689f32a4be2d',''),('220c4c49-dddd-4844-aed1-763a7d255c48','57cb9d0c-0bc8-42b0-b20c-fc82995ff966',''),('220c4c49-dddd-4844-aed1-763a7d255c48','7ebf6e4b-f469-4087-ac54-626895b64eb0','\0'),('220c4c49-dddd-4844-aed1-763a7d255c48','b1ab347a-2bf6-47e3-9ea4-99bdc6106c4f','\0'),('220c4c49-dddd-4844-aed1-763a7d255c48','c2620e25-b4f3-4015-8bf6-bc61bd597e4b',''),('220c4c49-dddd-4844-aed1-763a7d255c48','d1a9870e-c93c-4bd4-8982-f38b8ef67ad5',''),('220c4c49-dddd-4844-aed1-763a7d255c48','fcb30be2-a910-4037-b1e6-cb37981a9a6d',''),('379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','0e78a9f6-8400-495f-b3d7-6354c608c797','\0'),('379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','13d5a753-cea4-4415-a746-1c70ed5d57f9','\0'),('379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','3257974f-b52a-4538-b2a9-689f32a4be2d',''),('379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','57cb9d0c-0bc8-42b0-b20c-fc82995ff966',''),('379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','7ebf6e4b-f469-4087-ac54-626895b64eb0','\0'),('379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','b1ab347a-2bf6-47e3-9ea4-99bdc6106c4f','\0'),('379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','c2620e25-b4f3-4015-8bf6-bc61bd597e4b',''),('379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','d1a9870e-c93c-4bd4-8982-f38b8ef67ad5',''),('379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','fcb30be2-a910-4037-b1e6-cb37981a9a6d',''),('49d038c9-0c61-42eb-b467-4c912df46ddc','0888a299-af64-4825-95db-6733169b8469','\0'),('49d038c9-0c61-42eb-b467-4c912df46ddc','1bac2bcb-4e3d-4fda-ad61-639d0bd2b6e3',''),('49d038c9-0c61-42eb-b467-4c912df46ddc','1effee3e-1734-42ed-a535-29e3c661ad11',''),('49d038c9-0c61-42eb-b467-4c912df46ddc','2855ec8e-58c7-46aa-9dd2-86f1a6a037a1','\0'),('49d038c9-0c61-42eb-b467-4c912df46ddc','2d62d5b9-3bec-4ce5-9209-932f5056a0c6','\0'),('49d038c9-0c61-42eb-b467-4c912df46ddc','35e51935-479b-40a7-9d73-a69f5863ec13',''),('49d038c9-0c61-42eb-b467-4c912df46ddc','4379d808-cca4-47bf-98e7-f10a03a8cf21',''),('49d038c9-0c61-42eb-b467-4c912df46ddc','6a780e36-732b-4d58-a293-61e919265a55',''),('49d038c9-0c61-42eb-b467-4c912df46ddc','be6a53d1-f80a-4316-b838-b34ca8f9e936','\0'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','0888a299-af64-4825-95db-6733169b8469','\0'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','1bac2bcb-4e3d-4fda-ad61-639d0bd2b6e3',''),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','1effee3e-1734-42ed-a535-29e3c661ad11',''),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','2855ec8e-58c7-46aa-9dd2-86f1a6a037a1','\0'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','2d62d5b9-3bec-4ce5-9209-932f5056a0c6','\0'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','35e51935-479b-40a7-9d73-a69f5863ec13',''),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','4379d808-cca4-47bf-98e7-f10a03a8cf21',''),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','6a780e36-732b-4d58-a293-61e919265a55',''),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','a8627868-8eaf-4b6d-863e-5cbd101a4eed','\0'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','be6a53d1-f80a-4316-b838-b34ca8f9e936','\0'),('540a6346-7e98-4f0d-ad00-3b533b6959d3','27506d46-380c-4bb9-95cb-e8bf46ff33f0',''),('540a6346-7e98-4f0d-ad00-3b533b6959d3','30e31c5b-fe12-4b55-9f26-a53d50233eb2','\0'),('540a6346-7e98-4f0d-ad00-3b533b6959d3','48d6b2e1-c46c-41fb-ad16-4f572abe2864',''),('540a6346-7e98-4f0d-ad00-3b533b6959d3','496a799c-9e6b-43a0-b8a0-40f4126449d1',''),('540a6346-7e98-4f0d-ad00-3b533b6959d3','50920892-ce64-4d5e-8c74-cf1a17d8bb4e',''),('540a6346-7e98-4f0d-ad00-3b533b6959d3','726c7ef8-f786-4135-a815-a519eac86776','\0'),('540a6346-7e98-4f0d-ad00-3b533b6959d3','967c960c-61f0-426f-bb89-ad04ceecc1ca',''),('540a6346-7e98-4f0d-ad00-3b533b6959d3','c7ca3423-433b-4cbc-9b07-53bfc7095a91','\0'),('540a6346-7e98-4f0d-ad00-3b533b6959d3','cf947f87-1277-4482-afa3-248cdfdd4eb9','\0'),('5b651231-7cfa-47b2-a23c-7d364fccc758','0888a299-af64-4825-95db-6733169b8469','\0'),('5b651231-7cfa-47b2-a23c-7d364fccc758','1bac2bcb-4e3d-4fda-ad61-639d0bd2b6e3',''),('5b651231-7cfa-47b2-a23c-7d364fccc758','1effee3e-1734-42ed-a535-29e3c661ad11',''),('5b651231-7cfa-47b2-a23c-7d364fccc758','2855ec8e-58c7-46aa-9dd2-86f1a6a037a1','\0'),('5b651231-7cfa-47b2-a23c-7d364fccc758','2d62d5b9-3bec-4ce5-9209-932f5056a0c6','\0'),('5b651231-7cfa-47b2-a23c-7d364fccc758','35e51935-479b-40a7-9d73-a69f5863ec13',''),('5b651231-7cfa-47b2-a23c-7d364fccc758','4379d808-cca4-47bf-98e7-f10a03a8cf21',''),('5b651231-7cfa-47b2-a23c-7d364fccc758','6a780e36-732b-4d58-a293-61e919265a55',''),('5b651231-7cfa-47b2-a23c-7d364fccc758','be6a53d1-f80a-4316-b838-b34ca8f9e936','\0'),('6e1f5847-bd66-46dd-88e4-19991a631b95','0888a299-af64-4825-95db-6733169b8469','\0'),('6e1f5847-bd66-46dd-88e4-19991a631b95','1bac2bcb-4e3d-4fda-ad61-639d0bd2b6e3',''),('6e1f5847-bd66-46dd-88e4-19991a631b95','1effee3e-1734-42ed-a535-29e3c661ad11',''),('6e1f5847-bd66-46dd-88e4-19991a631b95','2855ec8e-58c7-46aa-9dd2-86f1a6a037a1','\0'),('6e1f5847-bd66-46dd-88e4-19991a631b95','2d62d5b9-3bec-4ce5-9209-932f5056a0c6','\0'),('6e1f5847-bd66-46dd-88e4-19991a631b95','35e51935-479b-40a7-9d73-a69f5863ec13',''),('6e1f5847-bd66-46dd-88e4-19991a631b95','4379d808-cca4-47bf-98e7-f10a03a8cf21',''),('6e1f5847-bd66-46dd-88e4-19991a631b95','6a780e36-732b-4d58-a293-61e919265a55',''),('6e1f5847-bd66-46dd-88e4-19991a631b95','be6a53d1-f80a-4316-b838-b34ca8f9e936','\0'),('6fa31952-cca3-498d-8389-d4d0065ceeb0','27506d46-380c-4bb9-95cb-e8bf46ff33f0',''),('6fa31952-cca3-498d-8389-d4d0065ceeb0','30e31c5b-fe12-4b55-9f26-a53d50233eb2','\0'),('6fa31952-cca3-498d-8389-d4d0065ceeb0','48d6b2e1-c46c-41fb-ad16-4f572abe2864',''),('6fa31952-cca3-498d-8389-d4d0065ceeb0','496a799c-9e6b-43a0-b8a0-40f4126449d1',''),('6fa31952-cca3-498d-8389-d4d0065ceeb0','50920892-ce64-4d5e-8c74-cf1a17d8bb4e',''),('6fa31952-cca3-498d-8389-d4d0065ceeb0','726c7ef8-f786-4135-a815-a519eac86776','\0'),('6fa31952-cca3-498d-8389-d4d0065ceeb0','967c960c-61f0-426f-bb89-ad04ceecc1ca',''),('6fa31952-cca3-498d-8389-d4d0065ceeb0','c7ca3423-433b-4cbc-9b07-53bfc7095a91','\0'),('6fa31952-cca3-498d-8389-d4d0065ceeb0','cf947f87-1277-4482-afa3-248cdfdd4eb9','\0'),('82468a88-24fb-43f2-bfcf-96f218188c5b','27506d46-380c-4bb9-95cb-e8bf46ff33f0',''),('82468a88-24fb-43f2-bfcf-96f218188c5b','30e31c5b-fe12-4b55-9f26-a53d50233eb2','\0'),('82468a88-24fb-43f2-bfcf-96f218188c5b','48d6b2e1-c46c-41fb-ad16-4f572abe2864',''),('82468a88-24fb-43f2-bfcf-96f218188c5b','496a799c-9e6b-43a0-b8a0-40f4126449d1',''),('82468a88-24fb-43f2-bfcf-96f218188c5b','50920892-ce64-4d5e-8c74-cf1a17d8bb4e',''),('82468a88-24fb-43f2-bfcf-96f218188c5b','726c7ef8-f786-4135-a815-a519eac86776','\0'),('82468a88-24fb-43f2-bfcf-96f218188c5b','967c960c-61f0-426f-bb89-ad04ceecc1ca',''),('82468a88-24fb-43f2-bfcf-96f218188c5b','c7ca3423-433b-4cbc-9b07-53bfc7095a91','\0'),('82468a88-24fb-43f2-bfcf-96f218188c5b','cf947f87-1277-4482-afa3-248cdfdd4eb9','\0'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','0888a299-af64-4825-95db-6733169b8469','\0'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','1bac2bcb-4e3d-4fda-ad61-639d0bd2b6e3',''),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','1effee3e-1734-42ed-a535-29e3c661ad11',''),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','2855ec8e-58c7-46aa-9dd2-86f1a6a037a1','\0'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','2d62d5b9-3bec-4ce5-9209-932f5056a0c6','\0'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','35e51935-479b-40a7-9d73-a69f5863ec13',''),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','4379d808-cca4-47bf-98e7-f10a03a8cf21',''),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','6a780e36-732b-4d58-a293-61e919265a55',''),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','be6a53d1-f80a-4316-b838-b34ca8f9e936','\0'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','0b1471a5-bdb0-43fa-bf0a-26ff7efd9cb9','\0'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','0e78a9f6-8400-495f-b3d7-6354c608c797','\0'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','13d5a753-cea4-4415-a746-1c70ed5d57f9','\0'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','3257974f-b52a-4538-b2a9-689f32a4be2d',''),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','57cb9d0c-0bc8-42b0-b20c-fc82995ff966',''),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','7ebf6e4b-f469-4087-ac54-626895b64eb0','\0'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','9dc439ab-4342-4639-9ea0-a3cf838982fa',''),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','b1ab347a-2bf6-47e3-9ea4-99bdc6106c4f','\0'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','c2620e25-b4f3-4015-8bf6-bc61bd597e4b',''),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','d1a9870e-c93c-4bd4-8982-f38b8ef67ad5',''),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','f6123a1d-8446-4431-a7db-ddb66a9b8aae','\0'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','fcb30be2-a910-4037-b1e6-cb37981a9a6d',''),('931bf1fd-bd9a-4916-b11a-5ff899e0af74','27506d46-380c-4bb9-95cb-e8bf46ff33f0',''),('931bf1fd-bd9a-4916-b11a-5ff899e0af74','30e31c5b-fe12-4b55-9f26-a53d50233eb2','\0'),('931bf1fd-bd9a-4916-b11a-5ff899e0af74','48d6b2e1-c46c-41fb-ad16-4f572abe2864',''),('931bf1fd-bd9a-4916-b11a-5ff899e0af74','496a799c-9e6b-43a0-b8a0-40f4126449d1',''),('931bf1fd-bd9a-4916-b11a-5ff899e0af74','50920892-ce64-4d5e-8c74-cf1a17d8bb4e',''),('931bf1fd-bd9a-4916-b11a-5ff899e0af74','726c7ef8-f786-4135-a815-a519eac86776','\0'),('931bf1fd-bd9a-4916-b11a-5ff899e0af74','967c960c-61f0-426f-bb89-ad04ceecc1ca',''),('931bf1fd-bd9a-4916-b11a-5ff899e0af74','c7ca3423-433b-4cbc-9b07-53bfc7095a91','\0'),('931bf1fd-bd9a-4916-b11a-5ff899e0af74','cf947f87-1277-4482-afa3-248cdfdd4eb9','\0'),('993444bd-7dc1-4332-95dd-ab8c6a4ebdee','0e78a9f6-8400-495f-b3d7-6354c608c797','\0'),('993444bd-7dc1-4332-95dd-ab8c6a4ebdee','13d5a753-cea4-4415-a746-1c70ed5d57f9','\0'),('993444bd-7dc1-4332-95dd-ab8c6a4ebdee','3257974f-b52a-4538-b2a9-689f32a4be2d',''),('993444bd-7dc1-4332-95dd-ab8c6a4ebdee','57cb9d0c-0bc8-42b0-b20c-fc82995ff966',''),('993444bd-7dc1-4332-95dd-ab8c6a4ebdee','7ebf6e4b-f469-4087-ac54-626895b64eb0','\0'),('993444bd-7dc1-4332-95dd-ab8c6a4ebdee','b1ab347a-2bf6-47e3-9ea4-99bdc6106c4f','\0'),('993444bd-7dc1-4332-95dd-ab8c6a4ebdee','c2620e25-b4f3-4015-8bf6-bc61bd597e4b',''),('993444bd-7dc1-4332-95dd-ab8c6a4ebdee','d1a9870e-c93c-4bd4-8982-f38b8ef67ad5',''),('993444bd-7dc1-4332-95dd-ab8c6a4ebdee','fcb30be2-a910-4037-b1e6-cb37981a9a6d',''),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','0b1471a5-bdb0-43fa-bf0a-26ff7efd9cb9',''),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','0e78a9f6-8400-495f-b3d7-6354c608c797','\0'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','13d5a753-cea4-4415-a746-1c70ed5d57f9','\0'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','3257974f-b52a-4538-b2a9-689f32a4be2d',''),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','57cb9d0c-0bc8-42b0-b20c-fc82995ff966',''),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','6c8e6b24-c4ac-4f94-95e1-86b1250d2f91',''),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','7ebf6e4b-f469-4087-ac54-626895b64eb0','\0'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','b1ab347a-2bf6-47e3-9ea4-99bdc6106c4f','\0'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','c2620e25-b4f3-4015-8bf6-bc61bd597e4b',''),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','d1a9870e-c93c-4bd4-8982-f38b8ef67ad5',''),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','fcb30be2-a910-4037-b1e6-cb37981a9a6d',''),('b22398b7-6b89-44bf-9e03-6935610362eb','0888a299-af64-4825-95db-6733169b8469','\0'),('b22398b7-6b89-44bf-9e03-6935610362eb','1bac2bcb-4e3d-4fda-ad61-639d0bd2b6e3',''),('b22398b7-6b89-44bf-9e03-6935610362eb','1effee3e-1734-42ed-a535-29e3c661ad11',''),('b22398b7-6b89-44bf-9e03-6935610362eb','2855ec8e-58c7-46aa-9dd2-86f1a6a037a1','\0'),('b22398b7-6b89-44bf-9e03-6935610362eb','2d62d5b9-3bec-4ce5-9209-932f5056a0c6','\0'),('b22398b7-6b89-44bf-9e03-6935610362eb','35e51935-479b-40a7-9d73-a69f5863ec13',''),('b22398b7-6b89-44bf-9e03-6935610362eb','4379d808-cca4-47bf-98e7-f10a03a8cf21',''),('b22398b7-6b89-44bf-9e03-6935610362eb','6a780e36-732b-4d58-a293-61e919265a55',''),('b22398b7-6b89-44bf-9e03-6935610362eb','be6a53d1-f80a-4316-b838-b34ca8f9e936','\0'),('bc008dd4-1ecf-4906-900c-5e547094edf1','0e78a9f6-8400-495f-b3d7-6354c608c797','\0'),('bc008dd4-1ecf-4906-900c-5e547094edf1','13d5a753-cea4-4415-a746-1c70ed5d57f9','\0'),('bc008dd4-1ecf-4906-900c-5e547094edf1','3257974f-b52a-4538-b2a9-689f32a4be2d',''),('bc008dd4-1ecf-4906-900c-5e547094edf1','57cb9d0c-0bc8-42b0-b20c-fc82995ff966',''),('bc008dd4-1ecf-4906-900c-5e547094edf1','7ebf6e4b-f469-4087-ac54-626895b64eb0','\0'),('bc008dd4-1ecf-4906-900c-5e547094edf1','b1ab347a-2bf6-47e3-9ea4-99bdc6106c4f','\0'),('bc008dd4-1ecf-4906-900c-5e547094edf1','c2620e25-b4f3-4015-8bf6-bc61bd597e4b',''),('bc008dd4-1ecf-4906-900c-5e547094edf1','d1a9870e-c93c-4bd4-8982-f38b8ef67ad5',''),('bc008dd4-1ecf-4906-900c-5e547094edf1','fcb30be2-a910-4037-b1e6-cb37981a9a6d',''),('c0e394ec-dcae-4a2c-baa0-92a350359b95','27506d46-380c-4bb9-95cb-e8bf46ff33f0',''),('c0e394ec-dcae-4a2c-baa0-92a350359b95','30e31c5b-fe12-4b55-9f26-a53d50233eb2','\0'),('c0e394ec-dcae-4a2c-baa0-92a350359b95','48d6b2e1-c46c-41fb-ad16-4f572abe2864',''),('c0e394ec-dcae-4a2c-baa0-92a350359b95','496a799c-9e6b-43a0-b8a0-40f4126449d1',''),('c0e394ec-dcae-4a2c-baa0-92a350359b95','50920892-ce64-4d5e-8c74-cf1a17d8bb4e',''),('c0e394ec-dcae-4a2c-baa0-92a350359b95','726c7ef8-f786-4135-a815-a519eac86776','\0'),('c0e394ec-dcae-4a2c-baa0-92a350359b95','967c960c-61f0-426f-bb89-ad04ceecc1ca',''),('c0e394ec-dcae-4a2c-baa0-92a350359b95','c7ca3423-433b-4cbc-9b07-53bfc7095a91','\0'),('c0e394ec-dcae-4a2c-baa0-92a350359b95','cf947f87-1277-4482-afa3-248cdfdd4eb9','\0'),('d4ddb1f3-09e7-436b-831b-9b7ec2a5623f','0888a299-af64-4825-95db-6733169b8469','\0'),('d4ddb1f3-09e7-436b-831b-9b7ec2a5623f','1bac2bcb-4e3d-4fda-ad61-639d0bd2b6e3',''),('d4ddb1f3-09e7-436b-831b-9b7ec2a5623f','1effee3e-1734-42ed-a535-29e3c661ad11',''),('d4ddb1f3-09e7-436b-831b-9b7ec2a5623f','2855ec8e-58c7-46aa-9dd2-86f1a6a037a1','\0'),('d4ddb1f3-09e7-436b-831b-9b7ec2a5623f','2d62d5b9-3bec-4ce5-9209-932f5056a0c6','\0'),('d4ddb1f3-09e7-436b-831b-9b7ec2a5623f','35e51935-479b-40a7-9d73-a69f5863ec13',''),('d4ddb1f3-09e7-436b-831b-9b7ec2a5623f','4379d808-cca4-47bf-98e7-f10a03a8cf21',''),('d4ddb1f3-09e7-436b-831b-9b7ec2a5623f','6a780e36-732b-4d58-a293-61e919265a55',''),('d4ddb1f3-09e7-436b-831b-9b7ec2a5623f','be6a53d1-f80a-4316-b838-b34ca8f9e936','\0'),('e0085400-94b1-4b08-b494-90cf04b32d5f','27506d46-380c-4bb9-95cb-e8bf46ff33f0',''),('e0085400-94b1-4b08-b494-90cf04b32d5f','30e31c5b-fe12-4b55-9f26-a53d50233eb2','\0'),('e0085400-94b1-4b08-b494-90cf04b32d5f','48d6b2e1-c46c-41fb-ad16-4f572abe2864',''),('e0085400-94b1-4b08-b494-90cf04b32d5f','496a799c-9e6b-43a0-b8a0-40f4126449d1',''),('e0085400-94b1-4b08-b494-90cf04b32d5f','50920892-ce64-4d5e-8c74-cf1a17d8bb4e',''),('e0085400-94b1-4b08-b494-90cf04b32d5f','726c7ef8-f786-4135-a815-a519eac86776','\0'),('e0085400-94b1-4b08-b494-90cf04b32d5f','967c960c-61f0-426f-bb89-ad04ceecc1ca',''),('e0085400-94b1-4b08-b494-90cf04b32d5f','c7ca3423-433b-4cbc-9b07-53bfc7095a91','\0'),('e0085400-94b1-4b08-b494-90cf04b32d5f','cf947f87-1277-4482-afa3-248cdfdd4eb9','\0'),('e52b07fa-6d42-46bc-9c68-85f35dbe6f90','27506d46-380c-4bb9-95cb-e8bf46ff33f0',''),('e52b07fa-6d42-46bc-9c68-85f35dbe6f90','30e31c5b-fe12-4b55-9f26-a53d50233eb2','\0'),('e52b07fa-6d42-46bc-9c68-85f35dbe6f90','48d6b2e1-c46c-41fb-ad16-4f572abe2864',''),('e52b07fa-6d42-46bc-9c68-85f35dbe6f90','496a799c-9e6b-43a0-b8a0-40f4126449d1',''),('e52b07fa-6d42-46bc-9c68-85f35dbe6f90','50920892-ce64-4d5e-8c74-cf1a17d8bb4e',''),('e52b07fa-6d42-46bc-9c68-85f35dbe6f90','726c7ef8-f786-4135-a815-a519eac86776','\0'),('e52b07fa-6d42-46bc-9c68-85f35dbe6f90','967c960c-61f0-426f-bb89-ad04ceecc1ca',''),('e52b07fa-6d42-46bc-9c68-85f35dbe6f90','c7ca3423-433b-4cbc-9b07-53bfc7095a91','\0'),('e52b07fa-6d42-46bc-9c68-85f35dbe6f90','cf947f87-1277-4482-afa3-248cdfdd4eb9','\0'),('f36a1425-06a7-4f80-9c6a-60de16abe424','0e78a9f6-8400-495f-b3d7-6354c608c797','\0'),('f36a1425-06a7-4f80-9c6a-60de16abe424','13d5a753-cea4-4415-a746-1c70ed5d57f9','\0'),('f36a1425-06a7-4f80-9c6a-60de16abe424','3257974f-b52a-4538-b2a9-689f32a4be2d',''),('f36a1425-06a7-4f80-9c6a-60de16abe424','57cb9d0c-0bc8-42b0-b20c-fc82995ff966',''),('f36a1425-06a7-4f80-9c6a-60de16abe424','7ebf6e4b-f469-4087-ac54-626895b64eb0','\0'),('f36a1425-06a7-4f80-9c6a-60de16abe424','b1ab347a-2bf6-47e3-9ea4-99bdc6106c4f','\0'),('f36a1425-06a7-4f80-9c6a-60de16abe424','c2620e25-b4f3-4015-8bf6-bc61bd597e4b',''),('f36a1425-06a7-4f80-9c6a-60de16abe424','d1a9870e-c93c-4bd4-8982-f38b8ef67ad5',''),('f36a1425-06a7-4f80-9c6a-60de16abe424','fcb30be2-a910-4037-b1e6-cb37981a9a6d','');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
                                             `SCOPE_ID` varchar(36) NOT NULL,
                                             `ROLE_ID` varchar(36) NOT NULL,
                                             PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
                                             KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
                                             KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
                                             CONSTRAINT `FK_CL_SCOPE_RM_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
                                             CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('0888a299-af64-4825-95db-6733169b8469','231ef4e7-10a9-498f-b05a-c76000dcba93'),('b1ab347a-2bf6-47e3-9ea4-99bdc6106c4f','bbac728a-54fe-464d-8586-855ecd9e0bdd'),('c7ca3423-433b-4cbc-9b07-53bfc7095a91','c2ee4958-0d7c-40a6-8626-19ee684bc679');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION` (
                                  `ID` varchar(36) NOT NULL,
                                  `CLIENT_ID` varchar(36) DEFAULT NULL,
                                  `REDIRECT_URI` varchar(255) DEFAULT NULL,
                                  `STATE` varchar(255) DEFAULT NULL,
                                  `TIMESTAMP` int(11) DEFAULT NULL,
                                  `SESSION_ID` varchar(36) DEFAULT NULL,
                                  `AUTH_METHOD` varchar(255) DEFAULT NULL,
                                  `REALM_ID` varchar(255) DEFAULT NULL,
                                  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
                                  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
                                  PRIMARY KEY (`ID`),
                                  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
                                  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
                                              `AUTHENTICATOR` varchar(36) NOT NULL,
                                              `STATUS` int(11) DEFAULT NULL,
                                              `CLIENT_SESSION` varchar(36) NOT NULL,
                                              PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
                                              CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
                                       `NAME` varchar(255) NOT NULL,
                                       `VALUE` varchar(255) DEFAULT NULL,
                                       `CLIENT_SESSION` varchar(36) NOT NULL,
                                       PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
                                       CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
                                              `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
                                              `CLIENT_SESSION` varchar(36) NOT NULL,
                                              PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
                                              CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
                                       `ROLE_ID` varchar(255) NOT NULL,
                                       `CLIENT_SESSION` varchar(36) NOT NULL,
                                       PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
                                       CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
                                            `NAME` varchar(255) NOT NULL,
                                            `VALUE` text DEFAULT NULL,
                                            `CLIENT_SESSION` varchar(36) NOT NULL,
                                            PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
                                            CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPONENT` (
                             `ID` varchar(36) NOT NULL,
                             `NAME` varchar(255) DEFAULT NULL,
                             `PARENT_ID` varchar(36) DEFAULT NULL,
                             `PROVIDER_ID` varchar(36) DEFAULT NULL,
                             `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
                             `REALM_ID` varchar(36) DEFAULT NULL,
                             `SUB_TYPE` varchar(255) DEFAULT NULL,
                             PRIMARY KEY (`ID`),
                             KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
                             KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
                             CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('057e08ca-ccd6-4be0-af6a-d581d1095f87','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('0bbb2fa7-a91c-4719-a2ec-4c2cba6df98a','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('0fac33e0-509a-448b-b3ac-6eee4e704a50','Full Scope Disabled','construction','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','construction','anonymous'),('1c6b11b5-e150-4b7c-975b-103cec77f01b','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('238047a0-5692-4401-a321-db9556cabb22','Trusted Hosts','trust','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','trust','anonymous'),('3482557f-2613-4afa-88f0-c905e6c40cef','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('3ca1c3e0-56e8-4fe5-9eac-45eeaefdeca4','Allowed Client Scopes','construction','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','construction','anonymous'),('503e842e-d96e-43b0-8e60-eb42fe62f31f','Full Scope Disabled','trust','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','trust','anonymous'),('558a1b6f-3a18-411e-9906-68358ae3995b','Allowed Client Scopes','trust','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','trust','anonymous'),('72040fcf-ac07-4c0c-a3ff-cee2df100108','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('728f0944-f78e-4443-a318-4da50cd6ae65','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('7780d960-4358-4f09-bfd6-968f9ad7397f','Consent Required','trust','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','trust','anonymous'),('7cb9719e-73de-4fb6-9213-500f44539a3a','Allowed Protocol Mapper Types','trust','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','trust','anonymous'),('886e94f6-d2dc-433f-87a0-7f15843878a0','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('8930c9e5-1c33-40ce-8705-52995adb4e4e','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('959de45d-754d-49b4-851e-1871af0aa38a','rsa-generated','construction','rsa-generated','org.keycloak.keys.KeyProvider','construction',NULL),('97f0b8d9-8f4a-4643-a30f-a27395c105a1','Consent Required','construction','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','construction','anonymous'),('9a43f950-b9e1-4d20-b69d-45eaf05bbc73','rsa-generated','trust','rsa-generated','org.keycloak.keys.KeyProvider','trust',NULL),('a4344742-8599-4d34-9c3b-aebd439c6039','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('c4f092fc-cc9a-4ae3-b21b-a6ab33225be2','Max Clients Limit','construction','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','construction','anonymous'),('cc13b903-e3dc-4173-8e0a-8eb705926e11','aes-generated','construction','aes-generated','org.keycloak.keys.KeyProvider','construction',NULL),('cc83813c-c902-470a-a957-67e1fa362f21','hmac-generated','trust','hmac-generated','org.keycloak.keys.KeyProvider','trust',NULL),('cf7678e1-146d-444a-879e-0779d8094dba','Allowed Protocol Mapper Types','trust','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','trust','authenticated'),('d61677da-59f4-4338-9f2e-defea52f9cea','Allowed Protocol Mapper Types','construction','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','construction','anonymous'),('dde99598-88c4-4923-b86c-9944ebe1fb63','hmac-generated','construction','hmac-generated','org.keycloak.keys.KeyProvider','construction',NULL),('e1655636-d3c7-4f8a-ad4f-d447e1bc860b','aes-generated','trust','aes-generated','org.keycloak.keys.KeyProvider','trust',NULL),('e2932a72-b26d-4161-bdf4-f80c6f419c5b','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('e81c641a-a736-445d-8d21-e8fcab586be6','Allowed Client Scopes','construction','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','construction','authenticated'),('e9683ba8-dc42-423a-b092-4939f34ea435','Trusted Hosts','construction','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','construction','anonymous'),('ee74a979-cc06-4b3f-92f1-6d9d4873cf17','Max Clients Limit','trust','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','trust','anonymous'),('f063bb7c-97ab-4643-98bc-424e88db106c','Allowed Protocol Mapper Types','construction','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','construction','authenticated'),('f0672007-7cbd-4527-9c1c-46909731344e','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('ff213a1d-3b85-4af1-bcef-dfaba7c41a19','Allowed Client Scopes','trust','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','trust','authenticated');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPONENT_CONFIG` (
                                    `ID` varchar(36) NOT NULL,
                                    `COMPONENT_ID` varchar(36) NOT NULL,
                                    `NAME` varchar(255) NOT NULL,
                                    `VALUE` varchar(4000) DEFAULT NULL,
                                    PRIMARY KEY (`ID`),
                                    KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
                                    CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('017281fe-1f23-4f9f-b62f-b111629dceff','cf7678e1-146d-444a-879e-0779d8094dba','allowed-protocol-mapper-types','oidc-address-mapper'),('08dcb5e1-757c-4abc-a29f-0b3bee3aedd2','959de45d-754d-49b4-851e-1871af0aa38a','privateKey','MIIEowIBAAKCAQEAjJmYIhWqDJt2CIkZNfYypUEDlS3efBYaf1+8rl9wtNQYGE7DYPmrxPdExsvNhXqtMKCxh9slXbrtd8skw+2ZlSBhBMfxKndagI19XSFwFulMz+A7q8CJjv7otrHtAFjuQTDLRypEC6sMSl6xI8LdUhcMlD6CY+IEetNkGliLvvhX/SWiJjjjVOW1LusSFeEpe4yaPFTdXvTqGpL+p7rpY7wWVLkczCPpqpECGmPGEzeqQiRimxA+WwaOfnc6fcGrqOGBTJ7Mshhcl77uZVNUrAAXkwpUfzjixa7zCsyjtUU9w9R5dOZeeeLqXZzGtPpJ3hg4hYnsDQpMJaXuJ6oQAwIDAQABAoIBAEdvDgVbPm9zWM/TYBSzhl3Bn2Fe0af3zvSiHon1gZzOGYPYGJofn67N9oqOJ1hG0NFhA3HD3MM3Ysk3U/GbuSk0Lzavow7xXvDrciMsBvgNBnKjOY30n68gQfn4gjJn/HzwnocEqVfIStFKNPO3YJ0BiumSrMq0nZQN7NEZ5b5bTAjB2bdY0obxmL2HiOIWYa3DXbrGBKwb/ryiHZ5ko5JbqlLrkF3mE2hbXpM0BTSWvaX7YqHwlPcasJhKYk4uYcYoo7YO+iblWxuUoba0dpxRAqs2IykXdtWEncu7zpyQgz4NIpdYURLA6kXtN1GUOFMpxs5uNUgiY/1bLmn1ywECgYEAvb8CtOKyYev/BvBpuRpFwfxxPlfe99HBbEg8roNe4tOat4KfO2VM5cudy0JXAGbdOJTZM0908Kt4LkxAEXoYbckyanRYqvBxGm7iGTCCTw6VqD2mAu58Jvu71kY2bRdx3jgQfvt81wR9XaTMMtb922DYvV72QSLYP9bJvqMs7YECgYEAvbGET9e49ScGrp6zPfQSBbzWJu0Uxg0hcrML7RDOUkVAW2UWoj7tFgr7rf56wk0SVTlv7jP4jnpotnPGQmuIlPDFo+fmLePDRl2bXygFi+jXeLwYQS3/jcgfwaKFyc7E2fLFhNKuxnD16BGcnh4IqCgm9oo31v9TYFIoN8AuB4MCgYAlKRp7mIY8/T4V+tGJyeZthmYbQpRNTowmC8OundXgcHa1h+Rtenpj6su9egGV949NvIEJNn99fudrkc1eXt4X6jZweNbAq5RLC/pF2qU6nG2c5G311wUDkXuJDHkuRlArqCk65T/e0GdJBrRjJI3VABOSit2Jhix53DPonQZ4gQKBgQCSLOcut6eZknc9vKGXDiuNLFVCLdOiQqARyRNZnWfAUgkj5KQqZp9AKzqCe+WRMN79uYMdZgMVmBJ09oZCzKa1T0yd36eqmSbzZFLEYwzTIZxZN2jhYVbapOqDxn+eYa2j3caDce6okIeOS3QLDE3Tdw1/Ukdxb9OKGAVR4NAXjQKBgEJ3tBMYiIRrvJPROli865w6bMg+fOEC03gF3QUlPIwmrNqRL8WClaRFysgD+YpuThW1fndVS9VR1PMNudK1x2SBQ0+qt6PDQis/7fzBZmKTx50csKdUq7vgQwZRXA+0tT55KTrNl7P/3IQdyrNBEj1RofRYGFqz5C+UrmstkSal'),('09489e22-629e-48c3-9770-4e746a792c91','e1655636-d3c7-4f8a-ad4f-d447e1bc860b','secret','RIsK9BOHcEcDfY7lVgm4tg'),('0b1ac5cc-c995-438c-a7e2-902290d67401','f0672007-7cbd-4527-9c1c-46909731344e','allowed-protocol-mapper-types','saml-role-list-mapper'),('11b36d8a-3f48-44df-af36-178bffa21615','ee74a979-cc06-4b3f-92f1-6d9d4873cf17','max-clients','200'),('13879909-f9c2-4546-a7da-cca69c7f5561','cc13b903-e3dc-4173-8e0a-8eb705926e11','priority','100'),('1ce7fa18-ae81-4f9a-a42b-2df63d452918','7cb9719e-73de-4fb6-9213-500f44539a3a','allowed-protocol-mapper-types','oidc-address-mapper'),('1f64e012-b0e1-4854-a3b3-64e65e5624c9','238047a0-5692-4401-a321-db9556cabb22','client-uris-must-match','true'),('1fa8e20a-9c1b-4924-ac0a-2210752fd631','f063bb7c-97ab-4643-98bc-424e88db106c','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('21c60a7f-f380-4fc5-b7da-9f861110ba87','cf7678e1-146d-444a-879e-0779d8094dba','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('22449a0f-c413-404e-9cb2-ed9ea8e71fc3','e9683ba8-dc42-423a-b092-4939f34ea435','client-uris-must-match','true'),('2299b8b3-811e-4d71-af2d-998aa8c6c16b','f0672007-7cbd-4527-9c1c-46909731344e','allowed-protocol-mapper-types','oidc-address-mapper'),('241c49d0-f6ea-4450-b70b-297b598b62d0','d61677da-59f4-4338-9f2e-defea52f9cea','allowed-protocol-mapper-types','saml-user-property-mapper'),('278635d1-50cb-4814-bbb1-3ffe18699ff5','057e08ca-ccd6-4be0-af6a-d581d1095f87','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('2d4d9a71-298a-4c7a-895f-fc0ceeedabb4','72040fcf-ac07-4c0c-a3ff-cee2df100108','priority','100'),('3570f186-cbee-4a75-9d07-26ffdbb2e5bd','7cb9719e-73de-4fb6-9213-500f44539a3a','allowed-protocol-mapper-types','oidc-full-name-mapper'),('3786297b-0900-481a-9caf-0b5a615c485b','558a1b6f-3a18-411e-9906-68358ae3995b','allow-default-scopes','true'),('3ad1d431-f66f-402a-bc2e-f38166c41086','057e08ca-ccd6-4be0-af6a-d581d1095f87','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('3cfa2318-c107-4a4f-9fc8-fbc2300695b4','238047a0-5692-4401-a321-db9556cabb22','host-sending-registration-request-must-match','true'),('45cc9bbb-ab38-4e11-8946-268d1510b3a8','057e08ca-ccd6-4be0-af6a-d581d1095f87','allowed-protocol-mapper-types','saml-role-list-mapper'),('4751759a-9584-4aaf-84bb-cc90e945d2a5','dde99598-88c4-4923-b86c-9944ebe1fb63','algorithm','HS256'),('48af1891-19d2-4d0f-bb12-313232d94246','7cb9719e-73de-4fb6-9213-500f44539a3a','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('4a47d07d-3afd-43ad-a662-647117be2048','cc13b903-e3dc-4173-8e0a-8eb705926e11','secret','q4wV_WlgV-D21MYdNMfJvA'),('4c604eb7-5fe6-4d39-9357-d033bba95cd3','057e08ca-ccd6-4be0-af6a-d581d1095f87','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('51c85497-c32e-41f5-9e29-6880b48765c5','f063bb7c-97ab-4643-98bc-424e88db106c','allowed-protocol-mapper-types','saml-role-list-mapper'),('530fd08c-bb88-487a-a45d-98ea17262409','f063bb7c-97ab-4643-98bc-424e88db106c','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('5606ecd7-ff30-481c-94e2-a5c67ea5e275','f0672007-7cbd-4527-9c1c-46909731344e','allowed-protocol-mapper-types','saml-user-property-mapper'),('57b13bb0-a41f-40a9-94dd-82db2ce368ff','7cb9719e-73de-4fb6-9213-500f44539a3a','allowed-protocol-mapper-types','saml-user-property-mapper'),('58b815f3-8dda-44fb-ac44-ddd502b82044','e1655636-d3c7-4f8a-ad4f-d447e1bc860b','priority','100'),('5c981fcb-b595-4451-a9f4-58b142ac7974','cc83813c-c902-470a-a957-67e1fa362f21','algorithm','HS256'),('5c9c4914-aa8d-45ce-b431-fe6aaedb8a5d','7cb9719e-73de-4fb6-9213-500f44539a3a','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('5cfaf4b8-6ccb-44dd-b0d5-72e37ff326bf','7cb9719e-73de-4fb6-9213-500f44539a3a','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('5f77c3a2-2a01-4aab-88b5-b573ed013d1d','e9683ba8-dc42-423a-b092-4939f34ea435','host-sending-registration-request-must-match','true'),('63a4cc5b-23b4-462d-b64e-4be1341b278e','7cb9719e-73de-4fb6-9213-500f44539a3a','allowed-protocol-mapper-types','saml-role-list-mapper'),('645e2e11-f3f2-416d-9181-9b2ef3505970','dde99598-88c4-4923-b86c-9944ebe1fb63','secret','IEg7Bd8B6fxmlZ1FDWf_OWu1IaSSn8aLObMas0aqofa-t4e70tZ2GZvVANy3tZMO34MchnT3B_hJ-o3qQyTeRg'),('6e276c53-6380-4c1a-8fa8-a91ba62d05f6','f063bb7c-97ab-4643-98bc-424e88db106c','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('719a8a25-10b4-4c5c-b7cd-397c53cbe068','f0672007-7cbd-4527-9c1c-46909731344e','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('7605c838-77fc-4b58-a6ef-2f70624c0f2e','72040fcf-ac07-4c0c-a3ff-cee2df100108','kid','b925e5cf-0b9c-4aee-baf7-095c02983439'),('79781cf4-bbd4-44d9-a04e-5970cfb57c92','886e94f6-d2dc-433f-87a0-7f15843878a0','kid','373049ef-45ce-47fb-8a10-746f117c3100'),('798c11ee-201b-4fc6-905d-d775b86287f5','9a43f950-b9e1-4d20-b69d-45eaf05bbc73','priority','100'),('79e454d6-3c28-4a6d-b990-bcc1390fb631','3482557f-2613-4afa-88f0-c905e6c40cef','allow-default-scopes','true'),('7ddcbacd-9fa0-4ef8-8120-e4c1c4f367a0','886e94f6-d2dc-433f-87a0-7f15843878a0','priority','100'),('7e447d90-0b32-47d6-bb36-c90fa1084f76','f063bb7c-97ab-4643-98bc-424e88db106c','allowed-protocol-mapper-types','oidc-address-mapper'),('7ec39505-6326-4a20-9084-78285c3696e2','cf7678e1-146d-444a-879e-0779d8094dba','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('7f25d573-5855-4ae4-ad89-6968f804da7e','d61677da-59f4-4338-9f2e-defea52f9cea','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('8171cdcc-5be4-41cf-a9b6-ac3d4a5109b4','f0672007-7cbd-4527-9c1c-46909731344e','allowed-protocol-mapper-types','oidc-full-name-mapper'),('8197b599-4363-4fd0-9425-b3d8602adb1c','057e08ca-ccd6-4be0-af6a-d581d1095f87','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('8b390b85-84bf-41fc-a408-707bcdf713e3','959de45d-754d-49b4-851e-1871af0aa38a','certificate','MIICpzCCAY8CBgFzGUz//zANBgkqhkiG9w0BAQsFADAXMRUwEwYDVQQDDAxjb25zdHJ1Y3Rpb24wHhcNMjAwNzA0MTAwNzIzWhcNMzAwNzA0MTAwOTAzWjAXMRUwEwYDVQQDDAxjb25zdHJ1Y3Rpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCMmZgiFaoMm3YIiRk19jKlQQOVLd58Fhp/X7yuX3C01BgYTsNg+avE90TGy82Feq0woLGH2yVduu13yyTD7ZmVIGEEx/Eqd1qAjX1dIXAW6UzP4DurwImO/ui2se0AWO5BMMtHKkQLqwxKXrEjwt1SFwyUPoJj4gR602QaWIu++Ff9JaImOONU5bUu6xIV4Sl7jJo8VN1e9Ooakv6nuuljvBZUuRzMI+mqkQIaY8YTN6pCJGKbED5bBo5+dzp9wauo4YFMnsyyGFyXvu5lU1SsABeTClR/OOLFrvMKzKO1RT3D1Hl05l554updnMa0+kneGDiFiewNCkwlpe4nqhADAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAD9xlaG1WusJPZvBeTdpizcuZO7+YczHz1vSgG/Q62A+CCfxSt8Og044Hewiytcm/ArKqochKdKLm8briwOdic1nND9fTj+ntzDogjo0FeIvb65Q1/I7zEfyAxPjDgmiP/bQd4Xvvm0hHokAxWL+66a1zxWj4r9VXpjsAHlQt6KEbBNSOJYFpTGGZbNym65DkRTt4Xt2Dme81aumqLB4Rtf8d4MSB8LQxvislwAaymwWiXv6p3P9GQWakC/v0Fw/5DhEbGAE+6uKqimgzJ5DxVvF5hIc59TcIbiErGzq0arg/PUUFWWu331Kco8YPtKJSlMuSGHy7WGJABWq2FXyljM='),('8bd7c18a-432f-490d-b3d6-0cb4f0515f27','886e94f6-d2dc-433f-87a0-7f15843878a0','secret','GC9il4g4_4s2veSBD2zsjp1t22VdMdp1daNwK9yScGYaq60c-508IAIjKtjvtec1qs-OvYgQLcqtD_FPsOW3jg'),('8c3a0016-ef08-4af1-84b4-be87367779db','d61677da-59f4-4338-9f2e-defea52f9cea','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('91cf76e8-7dfa-405a-a599-e6ff4ab30076','dde99598-88c4-4923-b86c-9944ebe1fb63','kid','e728ef00-ce47-43e9-bf33-a18a74d2048f'),('9251887b-cb25-46c1-8e16-c40628c374d7','a4344742-8599-4d34-9c3b-aebd439c6039','privateKey','MIIEpAIBAAKCAQEA0wm5Wuh0Do4oO6EbA4+tKo9kRNzowI39xgWw22A98KsLIWVHCeSDEVOK2QoGybauShohTR+zbm2pjGHUrfmYQGk8WJUM9NL4mfmNP7HiO+ja4R3J09mWP1oQiT922q2D2dDroqC5TO1SF4xleosEe/7yBRA9JElGWE6TjxENH+ayIxPojDen6o+zR7Z7MjajXavHk+crC853Y1T0JJtqzcnwA4eG4zaRDEXtGYNwCOJFkHqVO7Sw6vfN8xr4jtPkNsTjbzFP5xAjfkMKUbWOpWmzgHhf/5gelT8H4NCutYqO3Q2T3CMv+QUnCf+6WIv6fGYc/c2M97Cjf3cRQopXWQIDAQABAoIBAQCv5zEKZyslXrSGT1jW9REfonmvNHsE1NWsEt5BXM0EJ22VnndB9aiR7pKTKdpSk+Ree706Law/5UQncPv3L04KkizsoQA1qQvyO6HSb5Dk4sheT5gE7x5fG9EgtTd6OprmGU/vNAx/5GhCnJGRPQK13+EW+1wbPMBXptczrsDDzuEeGROrAeyFrYRCPj2l9OhnJK3v2GCDvmYIJ0CckA+u/wZE0U1ZbC7jmm5pB/05J+sw5uNHpGIm73KiEAVK2JcMBnaiUOjxgS8JF1hLf6iA+KGYyRyJu9YekWajjisl/Rkrvb5ibtezAqqucG+lSsz7vJqFMrHEvrjInWZu7w/pAoGBAO5bqhseOb3DHgtiAcgp7bXE3QR53z91GRDiGnva8+OwXLIvCSyc50goJ/mJRFn8AaC1GJ13W/9wRmJtRM26zKgAySrlxrUOHXmLIR3+S9vxgvUOU9or/vubj5BEe9yg9Ulv3HP9NAa00CzAK2/WHQd6nf2Jz8V7qOPdRusrJ653AoGBAOKoaDXOF+X5xR8EhXhd7mAkWGDVos317EBRO8dKyQ2g+JTWt4kUQtFB4GZm33afXpNdCWACUje18MhHURhNsCccGQuav7kVDiR4U/VKqxLRcG2W1+TJvt9PniP9v6rkUj2dcsMF1cdqMXuqa51sPIgR4tzByhoxZGRMaDi0R4yvAoGAH+3hhI5w962KecXgLTsIn7/GR5I3yJ1cBTn0iEDVSNvYHvpUBUjjZnQSnse3g0JRyYBY0scpaLdWhlrSy6hJP/wS9o8fJiPE6QItJoJpEQZyH3eS3ffkyTmWaqHx4aUiFntIkbUKYheYh1Yau3l4HAdd4Je0YGTnQ9bhaCE4yJMCgYBDsxeFUqyStXrqW9hd7nh/4PtA2S7Ko/TP9TOMwEqzNmxpUIT7fcDDbhDPpVSDwvBlxblCIw9Zso9b0ulm//VoiRz1+V/gsWhK/mHdd1MHyOTy5sZPgO7xFn/esjEoow/pdXjMxZZn/NEQ5gNEvwqJfgYr9/ocvroEt0m9/iMM4wKBgQDH5bwbVXCOiicfLcPL9djn1YtBquNkrtgbvv+DwPhbXSEQoT5+myU2PiLgqhdmWX1xwlac9BJC4Ec/a3kq4Ac4GGIo5adqsAUuJ9waCApD8pxTa3vHQYE+TDZo1IMM6ms2uMV9ECYz8ujywRxN4vuwWvHO/j3sIgvZRKsqF7AtlQ=='),('93d5262d-4f36-4e59-a331-687d798131f7','f0672007-7cbd-4527-9c1c-46909731344e','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('96343fff-ba6c-44b8-b97d-0a854a278e8f','f063bb7c-97ab-4643-98bc-424e88db106c','allowed-protocol-mapper-types','oidc-full-name-mapper'),('96fce3a4-3ba0-448d-b3ce-25693e1b98f4','f063bb7c-97ab-4643-98bc-424e88db106c','allowed-protocol-mapper-types','saml-user-property-mapper'),('9a06b3e0-80b9-4fcb-ab41-f82cfc6ffa4e','ff213a1d-3b85-4af1-bcef-dfaba7c41a19','allow-default-scopes','true'),('a4480c25-71cb-4550-a755-229310b1fe11','a4344742-8599-4d34-9c3b-aebd439c6039','priority','100'),('a7471f9c-6614-4e5b-8a12-4cab03791b2f','9a43f950-b9e1-4d20-b69d-45eaf05bbc73','certificate','MIICmTCCAYECBgFzGWHa7DANBgkqhkiG9w0BAQsFADAQMQ4wDAYDVQQDDAV0cnVzdDAeFw0yMDA3MDQxMDMwMTBaFw0zMDA3MDQxMDMxNTBaMBAxDjAMBgNVBAMMBXRydXN0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAt14ES1Zn64N574JG1N8Lq9z98xX0w9q9ydRHQbQXmUqcdOrS15cGfpwP1Yde0hIslRdWnYVc50xAYVy1GVaXukd7TpY28OIpAEa0Aom5rGF5r7BohLe9zPYiQVlfMfYFalh43r0qqGC5hJ9ysR32NNYUybr936eZRx1W45khS37iU+1t/yfgcDehbbwMWqlFilR9tQQ19XoDRRIBKDEq1T8X+gdWbk+YifmD2DYXvzg+ANKR53VVY8473Af6kjVryXqFzONSw7Mx/kEbDDJQVi6q+VbeWi6WgMsbS43u2Kplcc8n759Xo5/7ugL4FUZxJNLZs1HpgjjjfsoKEoi2+QIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAv8qFAPrh/8rj1aYvavB0kSj4MVMHb9IN0iNR1vR4dpNk7JfZhUnBKPQwlRZvbqaJ93rPinD0VwZh7KRRlwR9Yam1wc3YHbs1Q3q/A0GG4OqRHt9i+nK53VpsLqN3MixV/ZJaweckCcGEPQi4lmzk4lfQdPQ+rEDmitjjs9rQ6GrIP3zJAHJ/kNot1BfGyukBBZ625XbfMDsVaya3MkZ+oC1dYqZ6lueCcMp71UjGGPKvG0g1A8R45colJboavnQDNqlpC9XLJo3OHSApoYKqU72VzqVVSYl69n3859EBmDHLH5p+NMy+hHUS+PSKHKZs7bC7WiTOLHytCfjfVoIy5'),('ac189f58-cc91-4702-9ff4-953cb447efbf','057e08ca-ccd6-4be0-af6a-d581d1095f87','allowed-protocol-mapper-types','oidc-address-mapper'),('ada6bcc7-dbfe-47e3-9054-e3b59cc9fd93','cf7678e1-146d-444a-879e-0779d8094dba','allowed-protocol-mapper-types','oidc-full-name-mapper'),('ae4385aa-7f60-4202-ae79-c0134788f777','cc13b903-e3dc-4173-8e0a-8eb705926e11','kid','158189e2-f288-4c70-a9b7-b71ed200ebad'),('b21805ab-01b4-4d37-a539-fb450ddc14b0','057e08ca-ccd6-4be0-af6a-d581d1095f87','allowed-protocol-mapper-types','saml-user-property-mapper'),('b501352d-3eab-4038-a8f4-d14c99f624e4','cf7678e1-146d-444a-879e-0779d8094dba','allowed-protocol-mapper-types','saml-role-list-mapper'),('b60d9e36-9779-45f9-818b-762a0bfc442d','cf7678e1-146d-444a-879e-0779d8094dba','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('b67a2e53-b056-4ab6-8399-51f5813bfebe','728f0944-f78e-4443-a318-4da50cd6ae65','max-clients','200'),('b8b4ff85-e941-4a74-aea2-64dc99e9dcb2','cc83813c-c902-470a-a957-67e1fa362f21','secret','gmQ6IvxvUX2J26jFL8Lj5yAVt-Nhd3bRoJ7iZfpoByNXpJKHdKSrZDPUa1vp1XPh-V-7C24nZ-IoPuCAJjUGig'),('b93f3fa5-b81b-4100-82ae-25f79f9e0c41','d61677da-59f4-4338-9f2e-defea52f9cea','allowed-protocol-mapper-types','saml-role-list-mapper'),('be766852-8621-4db9-b4cb-c0e30c0812ca','c4f092fc-cc9a-4ae3-b21b-a6ab33225be2','max-clients','200'),('c2a03331-e5bd-42af-a3d9-d80b87226e56','1c6b11b5-e150-4b7c-975b-103cec77f01b','host-sending-registration-request-must-match','true'),('c2de7b9a-6880-47d6-b70b-db369151b55d','0bbb2fa7-a91c-4719-a2ec-4c2cba6df98a','allow-default-scopes','true'),('c3411100-f344-473b-a212-5a1166fcf7cf','cc83813c-c902-470a-a957-67e1fa362f21','kid','44e894e2-34b3-443a-9e8e-3d81839d6b3a'),('c5285da1-8286-4a45-9607-cba80ca67105','dde99598-88c4-4923-b86c-9944ebe1fb63','priority','100'),('c53ef0a2-f973-45ad-9d26-d9af263ade40','959de45d-754d-49b4-851e-1871af0aa38a','priority','100'),('c6274208-d6d8-482e-8cc6-54c8fd221012','1c6b11b5-e150-4b7c-975b-103cec77f01b','client-uris-must-match','true'),('cbed8a8e-a866-474f-a6e6-454c1fb78faa','d61677da-59f4-4338-9f2e-defea52f9cea','allowed-protocol-mapper-types','oidc-full-name-mapper'),('cc19cc5d-e4fa-4515-bfc7-2c2fa2d45cfc','f063bb7c-97ab-4643-98bc-424e88db106c','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('d5889672-a795-4f0a-9f64-2cac05ac6e7c','886e94f6-d2dc-433f-87a0-7f15843878a0','algorithm','HS256'),('d665119d-ba0e-445c-b70f-b50761750e33','cf7678e1-146d-444a-879e-0779d8094dba','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('d67ab173-aba3-4121-a747-12cc221cf872','cc83813c-c902-470a-a957-67e1fa362f21','priority','100'),('d695792d-5e87-4594-b1bb-03c242469d4f','057e08ca-ccd6-4be0-af6a-d581d1095f87','allowed-protocol-mapper-types','oidc-full-name-mapper'),('d6bf3217-5903-4f0d-a660-cfca7163a885','d61677da-59f4-4338-9f2e-defea52f9cea','allowed-protocol-mapper-types','oidc-address-mapper'),('da602f4d-0037-4519-9cf5-1b66b181b512','d61677da-59f4-4338-9f2e-defea52f9cea','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('de775f0f-8921-4173-b6c0-442d01e095ac','e1655636-d3c7-4f8a-ad4f-d447e1bc860b','kid','ece255f4-3b44-4b59-b491-13e72e1f8180'),('de8f8f70-d821-4c1c-a930-fd009b4995cc','3ca1c3e0-56e8-4fe5-9eac-45eeaefdeca4','allow-default-scopes','true'),('e0957ca1-2885-4317-a498-8933a7e34702','f0672007-7cbd-4527-9c1c-46909731344e','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('e5c364ca-9993-4d2c-8a9e-4fe44fcb813d','72040fcf-ac07-4c0c-a3ff-cee2df100108','secret','exvebAAPxXPnarUVeAiQ5w'),('e67d881a-e905-4122-9b40-c952d3ab3d92','e81c641a-a736-445d-8d21-e8fcab586be6','allow-default-scopes','true'),('e77def8d-c947-4364-bbf8-684aa56d2e51','d61677da-59f4-4338-9f2e-defea52f9cea','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('e7b30177-c1db-45a4-91b6-9a6f22df0a03','f0672007-7cbd-4527-9c1c-46909731344e','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('e8edecdb-a454-439b-8e6f-6d1dfe5ce106','cf7678e1-146d-444a-879e-0779d8094dba','allowed-protocol-mapper-types','saml-user-property-mapper'),('f45ebf34-8b2b-4bc8-a20b-1b475340a33c','7cb9719e-73de-4fb6-9213-500f44539a3a','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('f6b2376e-0aa5-4550-a95e-01c8202816a6','a4344742-8599-4d34-9c3b-aebd439c6039','certificate','MIICmzCCAYMCBgFzGUscFzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjAwNzA0MTAwNTE5WhcNMzAwNzA0MTAwNjU5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDTCbla6HQOjig7oRsDj60qj2RE3OjAjf3GBbDbYD3wqwshZUcJ5IMRU4rZCgbJtq5KGiFNH7NubamMYdSt+ZhAaTxYlQz00viZ+Y0/seI76NrhHcnT2ZY/WhCJP3barYPZ0OuioLlM7VIXjGV6iwR7/vIFED0kSUZYTpOPEQ0f5rIjE+iMN6fqj7NHtnsyNqNdq8eT5ysLzndjVPQkm2rNyfADh4bjNpEMRe0Zg3AI4kWQepU7tLDq983zGviO0+Q2xONvMU/nECN+QwpRtY6labOAeF//mB6VPwfg0K61io7dDZPcIy/5BScJ/7pYi/p8Zhz9zYz3sKN/dxFCildZAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAUJta0c+kYpSe8K+0mbN/mt9ZyDtsXMk1EQiHX52PHv7ZUDOellAnlXnqlzKypdqQy8Q6hpVmcoPxn42b5NBKu7brkidhxxaPidKBDl7/rsdcGVAtfrdYFUiA4GyWld4Mj1izMcynKYZ7iFaCRhnEiO/pav3nNPqNEHgZMUgMBDgXxUx5LGJaGlJKwX+gwwswaKmooWtlRgI1KGTQ5PaYg4VcisifFIGSLow1EesAYHrBRYSRywBn7t6QGZh2hDQ+2nkVnnT7pNRHAdcASCN/5r0HuW9fkYQQSbEA8AB282bmEZydw6z34oAQmX4LLmElEYsyAkhWtJwIVxk559giQ='),('f7079ab1-5cbb-4531-9f89-acd4aada395f','9a43f950-b9e1-4d20-b69d-45eaf05bbc73','privateKey','MIIEpQIBAAKCAQEAt14ES1Zn64N574JG1N8Lq9z98xX0w9q9ydRHQbQXmUqcdOrS15cGfpwP1Yde0hIslRdWnYVc50xAYVy1GVaXukd7TpY28OIpAEa0Aom5rGF5r7BohLe9zPYiQVlfMfYFalh43r0qqGC5hJ9ysR32NNYUybr936eZRx1W45khS37iU+1t/yfgcDehbbwMWqlFilR9tQQ19XoDRRIBKDEq1T8X+gdWbk+YifmD2DYXvzg+ANKR53VVY8473Af6kjVryXqFzONSw7Mx/kEbDDJQVi6q+VbeWi6WgMsbS43u2Kplcc8n759Xo5/7ugL4FUZxJNLZs1HpgjjjfsoKEoi2+QIDAQABAoIBAEpS7WKsD0tC63XNVHCMR+rNlJGnYKLSUwMv7AIRwU79ExXA6N1B9fvzvedLC4ASpcd4wj7vA40tNxs/vJgcpTt4Jd7gvDw/L2dRQT2WHZBlojE4S+UfpOsjCRd75j4V/nPwkG2YN2YwboH3L0HjZxxbeemaxbSV9mcA2Ws/cmNqxswGy/B8xjM+fsXGSxaALojRX6OawBLdV4YTvOaCaikjzQLO1nnOCCsPvMXq1oDMJbu/oqqhkyrXOKK1ABCxejFU2dq/DzrSmF2NdHwS5zhsqWVG+tl8/umX2X68JC5na8090SKBCWwVurotAU5R73Sd0esnWr43L919zqqlQNECgYEA5tWtQ2357pqr2YmGhvtzC9oTboFBUJ7nj+Iqq6suARrmP+SZ+j6pNC6WzRNHYBgComj+IaIvoqkHFPeLNmgs+Pp0d2DovD3ZyGTRhIfyTV56SsCETk6mGIkliPx4+hjR0GJLqzn8dDYHWJo6JmOavOns8mIKg5kTiMxFdKMpEO8CgYEAy1uUjJBm0PPC4rfx+dGrSXH19nHW+5CmoIg5wqLCAn1r8YAhcicMfNz8fDLCusdy6faHtDWoZz9wRNN4xOFauLVcENDQDM9OEVxRsXxagEuCjcR600TbLK6vwdBvPzNNZrgR+kwR3rbii8PFn+VfF1ocJ8LUi0mdLmYPbv935pcCgYEAji1iULv2Sz69RnnsgEt0KwKhIVk/j5awbfER8za2WTvmQcheBsJ9mYRwodOUDN39EWe1z6WDzZ5qnEF0X4h+2sP45GauMvOtpj5ixkyts3XTwSMe2tSafVZL5joLkY+j+8Pvc4F9u15j2/DyjB6hemZi6U/1xeSNIZ8f0J2Gd8UCgYEAoy8UH0/pEZfqNWCCboPPvZoTU/W6HBjRfVSTdRqCMNlQe3TkYePv42q5uThKhvNxxUktUHEWd/OyNai06tgjosD15hCKQx0/ejLo41H0lasCUpzuKwbAEjUDmLWX79FNNTZURtQwKtX7KUiqF0tKaUTH/ygawsMJvKftjpa2MnUCgYEAoLtmNGIDEhaMZA4BiZszEey4z2CrsSVtZnuPTwCybuChiKbBqA35rpFbmrwf+ky1e9KjkBYRbTZ4580Q14uwltSV1hy87mX6RZh85SAzi4tQ6XNnEnRtXHmGgX5qMoOFb8WSiZLFORklxdLFHjuD/yf2YAxu+S2C7y7H/1X6tx8=');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPOSITE_ROLE` (
                                  `COMPOSITE` varchar(36) NOT NULL,
                                  `CHILD_ROLE` varchar(36) NOT NULL,
                                  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
                                  KEY `IDX_COMPOSITE` (`COMPOSITE`),
                                  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
                                  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
                                  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('0369876f-4420-4db3-a03e-b6d0c4bde399','0e072e51-3d89-45a9-adfe-3f399e1727cd'),('06e4bd27-f337-48da-a832-4df8b60cf928','a991248a-0673-4acb-8ae5-377594afd20f'),('09712555-ade5-4632-a3a9-0f4b30abfcc0','97361edc-c8f1-493e-a41e-d2ea5d125d0b'),('09712555-ade5-4632-a3a9-0f4b30abfcc0','e6d68a06-9714-45e1-90f7-ab2f2be015cc'),('2a8fe9ff-8c0d-4183-b879-6ac49d81c299','739b326f-23cc-48cd-8fe2-5c704fea1828'),('2db1209c-61fa-46c7-90bb-faa0d222f13a','2a3b5c59-24d1-46e6-885c-6f185a67662a'),('3279b938-8f41-45a2-95d6-abdf5c5ef99c','3020ee06-680e-45ec-90bb-ff8d0148e739'),('49659bf3-e3b8-4b2d-b52b-4e7f16a39efd','f483ee12-3ec6-453c-8020-7210a917f63c'),('7fa3323e-e047-4161-99c9-417eece03853','11d07b70-6872-47c0-8667-59f5d0f24168'),('80194120-40cc-4535-a036-e3841ae4c735','02685a2e-8e46-4b4e-a19a-9acb11f3970e'),('80194120-40cc-4535-a036-e3841ae4c735','12da1c4e-6928-4bef-85df-99425a5cb601'),('80194120-40cc-4535-a036-e3841ae4c735','1d0d1ccd-5a01-4c3b-b2d4-ef2a0e5557dd'),('80194120-40cc-4535-a036-e3841ae4c735','20058878-ce3c-4cec-a21f-9de74c8652e5'),('80194120-40cc-4535-a036-e3841ae4c735','2d364271-3492-4ee9-b9d9-e7e7fff71f9a'),('80194120-40cc-4535-a036-e3841ae4c735','30476834-22cf-4c77-a6fb-460455a802b7'),('80194120-40cc-4535-a036-e3841ae4c735','39ef115e-77e6-4a6e-be68-874569108ada'),('80194120-40cc-4535-a036-e3841ae4c735','3ce5d9fc-8dfc-4f18-9dd6-7bb2c3c20dde'),('80194120-40cc-4535-a036-e3841ae4c735','71c88144-0f11-4ba2-9a49-c41bed8fe340'),('80194120-40cc-4535-a036-e3841ae4c735','74be5058-a182-44e5-975a-e35a49cd3273'),('80194120-40cc-4535-a036-e3841ae4c735','7f182e34-b800-4b5e-b71c-10c779fc0d00'),('80194120-40cc-4535-a036-e3841ae4c735','8824f56f-2c11-4174-b604-0f28cf15a23c'),('80194120-40cc-4535-a036-e3841ae4c735','9955b2e7-2fb9-4978-952d-00e24495c198'),('80194120-40cc-4535-a036-e3841ae4c735','a04598c3-302c-4261-b864-493866849e8a'),('80194120-40cc-4535-a036-e3841ae4c735','b9e10c3d-6851-48ec-a9c2-4454afe4d58e'),('80194120-40cc-4535-a036-e3841ae4c735','c0dec8af-aa0b-4d63-9f00-b008054c1063'),('80194120-40cc-4535-a036-e3841ae4c735','d81d4f94-592b-45af-aca1-ccad17e21fc7'),('80194120-40cc-4535-a036-e3841ae4c735','fb3ffac3-963e-492d-b612-f86b2148dbae'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','0488feae-f170-4613-9f2e-55c3ae6991ed'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','19050e9d-20df-4e6a-bb1f-ecece2cef2ed'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','19f16403-264a-48fc-b3e7-604f4fa07c7f'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','1fba64ca-aff4-4b7c-a0b8-35af4e0cb369'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','25c6de32-a912-4da2-9f35-602aa7574205'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','2a8fe9ff-8c0d-4183-b879-6ac49d81c299'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','6ed17899-9491-43b3-9269-3080ea3c5c77'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','739b326f-23cc-48cd-8fe2-5c704fea1828'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','78e7cbff-e287-4da0-8c13-f752674c0445'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','84ddd9fe-f3e1-4624-961d-35aaab7c4f2e'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','8f23867a-6c85-46a6-b7f3-f2584b719020'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','985d6914-d71b-4a45-a251-86b2a1a1847c'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','a7a9b922-ecde-42de-8ec3-6e4e35218191'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','ab1dc866-66ff-4343-afec-c803bf56240a'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','ab7c6f2a-735e-4f8b-9075-92c2b8ffe459'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','c4da6867-2d6a-4dc5-bfde-0c1b4498c039'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','e33da4b5-6368-4c1f-964e-3c25938e83ef'),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','f99a1d31-92f2-4122-a71b-820f3312c0ea'),('9955b2e7-2fb9-4978-952d-00e24495c198','39ef115e-77e6-4a6e-be68-874569108ada'),('ab7c6f2a-735e-4f8b-9075-92c2b8ffe459','0488feae-f170-4613-9f2e-55c3ae6991ed'),('ab7c6f2a-735e-4f8b-9075-92c2b8ffe459','1fba64ca-aff4-4b7c-a0b8-35af4e0cb369'),('af140dcc-ede9-4146-aeb5-3415ff764e17','3eee7b7a-9b46-48ad-90fc-6761fa2409a2'),('af140dcc-ede9-4146-aeb5-3415ff764e17','fc673464-4734-4413-a224-e0a24d4ef414'),('b30389e6-591d-4e0c-a2a5-b5765e0f06c6','907b4ea9-eafb-460e-ba90-1160c6939a57'),('b4c44206-db69-417e-b1be-839037f8fe22','08fcbc1f-6b94-4a30-9cac-a4e53f9c9c25'),('b4c44206-db69-417e-b1be-839037f8fe22','09712555-ade5-4632-a3a9-0f4b30abfcc0'),('b4c44206-db69-417e-b1be-839037f8fe22','0cbc9e22-b1c6-43e5-be65-7dd60d03679c'),('b4c44206-db69-417e-b1be-839037f8fe22','0e85f6ed-9b36-49c2-9ea5-204cc3b431a8'),('b4c44206-db69-417e-b1be-839037f8fe22','127a91c7-b080-4e2c-97d6-b32c18c14895'),('b4c44206-db69-417e-b1be-839037f8fe22','1733e0ea-5b9a-41e0-9dad-bdd95fb404fa'),('b4c44206-db69-417e-b1be-839037f8fe22','1ae6591a-d0b9-4412-ac73-25bfe4ae0786'),('b4c44206-db69-417e-b1be-839037f8fe22','23716696-03f8-484b-9d0f-ca690431311e'),('b4c44206-db69-417e-b1be-839037f8fe22','244f67f5-3cc4-4530-8b8f-1202c9f64296'),('b4c44206-db69-417e-b1be-839037f8fe22','2ad8b60d-ba65-4138-9b01-683dd88bcc09'),('b4c44206-db69-417e-b1be-839037f8fe22','303310d9-d868-476c-ad4e-7de47e38f5f4'),('b4c44206-db69-417e-b1be-839037f8fe22','32038870-dc7a-4b1a-99ae-36aad916bbdc'),('b4c44206-db69-417e-b1be-839037f8fe22','32d434aa-c5d2-4665-9288-f7c26b00a06e'),('b4c44206-db69-417e-b1be-839037f8fe22','3eee7b7a-9b46-48ad-90fc-6761fa2409a2'),('b4c44206-db69-417e-b1be-839037f8fe22','402615f0-d838-4bfc-9743-68bfff84e78c'),('b4c44206-db69-417e-b1be-839037f8fe22','46d7c91d-f84f-4610-8b9e-cb2838572948'),('b4c44206-db69-417e-b1be-839037f8fe22','4cf69a17-d638-4e41-994c-e1f9199e957b'),('b4c44206-db69-417e-b1be-839037f8fe22','5225258f-d2fd-462b-8e49-8985c0e28bff'),('b4c44206-db69-417e-b1be-839037f8fe22','58d888bb-8d35-4951-b50c-6e69ae574188'),('b4c44206-db69-417e-b1be-839037f8fe22','5bc689fa-0e84-413b-9c46-39a818da0b6a'),('b4c44206-db69-417e-b1be-839037f8fe22','63958519-e8b8-4cfc-9945-ad7bac2bca25'),('b4c44206-db69-417e-b1be-839037f8fe22','7140102b-994b-481b-bd8f-0123bf27b346'),('b4c44206-db69-417e-b1be-839037f8fe22','73891b29-c00a-4d98-b659-5c9e61890a42'),('b4c44206-db69-417e-b1be-839037f8fe22','7c72f0f2-024c-4e78-9b14-fc752afd1093'),('b4c44206-db69-417e-b1be-839037f8fe22','7cdad9f1-4128-4f84-9a5f-203d34c1e88f'),('b4c44206-db69-417e-b1be-839037f8fe22','8ae25a1f-65cb-4548-957c-51eac1b718dc'),('b4c44206-db69-417e-b1be-839037f8fe22','907b4ea9-eafb-460e-ba90-1160c6939a57'),('b4c44206-db69-417e-b1be-839037f8fe22','917b1de0-8f52-4fb3-a1ce-5da72cca057b'),('b4c44206-db69-417e-b1be-839037f8fe22','96940093-2c49-4216-89e2-5e6fbc137ce2'),('b4c44206-db69-417e-b1be-839037f8fe22','97361edc-c8f1-493e-a41e-d2ea5d125d0b'),('b4c44206-db69-417e-b1be-839037f8fe22','a43e955a-0377-49bf-b6fb-803d8390fa77'),('b4c44206-db69-417e-b1be-839037f8fe22','aaa6efa8-353d-47b6-9cac-05b09ba0af37'),('b4c44206-db69-417e-b1be-839037f8fe22','ac1bd0bc-2cc5-4b3b-9051-9186d96e6b30'),('b4c44206-db69-417e-b1be-839037f8fe22','accd0ba0-60b7-4665-89a0-174a3f2fe61f'),('b4c44206-db69-417e-b1be-839037f8fe22','af140dcc-ede9-4146-aeb5-3415ff764e17'),('b4c44206-db69-417e-b1be-839037f8fe22','b2b5c711-b8b8-4316-bfbd-34a4d0fd382c'),('b4c44206-db69-417e-b1be-839037f8fe22','b30389e6-591d-4e0c-a2a5-b5765e0f06c6'),('b4c44206-db69-417e-b1be-839037f8fe22','b4b77aa3-0fa9-4f29-a932-55f1040cd193'),('b4c44206-db69-417e-b1be-839037f8fe22','b86e6d8b-d5b0-49b0-8a3a-9760e5de3ac3'),('b4c44206-db69-417e-b1be-839037f8fe22','baec615d-3022-4ebb-ba54-142dc53753e6'),('b4c44206-db69-417e-b1be-839037f8fe22','c0b8823b-47d4-4daf-8a4d-75b8766da0a2'),('b4c44206-db69-417e-b1be-839037f8fe22','c2866d54-1868-4871-b99d-a739aa92d568'),('b4c44206-db69-417e-b1be-839037f8fe22','c499667b-a16a-40f2-9bfa-b6625745d0d5'),('b4c44206-db69-417e-b1be-839037f8fe22','c5d687e6-094c-45f9-b93a-071318478bd9'),('b4c44206-db69-417e-b1be-839037f8fe22','c66b5597-bf68-4292-8efc-c0b5eca140a6'),('b4c44206-db69-417e-b1be-839037f8fe22','d1431c71-7dd7-4464-bae7-d2d0000b16eb'),('b4c44206-db69-417e-b1be-839037f8fe22','d25ae37d-a0dc-412d-8565-72c324a064fa'),('b4c44206-db69-417e-b1be-839037f8fe22','e1e36fe2-0ddd-45c0-835b-b29b1927b7d5'),('b4c44206-db69-417e-b1be-839037f8fe22','e6d68a06-9714-45e1-90f7-ab2f2be015cc'),('b4c44206-db69-417e-b1be-839037f8fe22','eab0b069-c6ae-4a42-b7c7-c8eed7d02325'),('b4c44206-db69-417e-b1be-839037f8fe22','ef114a41-dad9-487a-aabc-4ffae258ca85'),('b4c44206-db69-417e-b1be-839037f8fe22','ef1e1cca-e09a-43ae-a83e-b95242f55dbd'),('b4c44206-db69-417e-b1be-839037f8fe22','fc673464-4734-4413-a224-e0a24d4ef414'),('b4c44206-db69-417e-b1be-839037f8fe22','fd163e81-0b5c-4c23-bbe7-fab4e440df48'),('b4c44206-db69-417e-b1be-839037f8fe22','fe4922c2-630a-43dc-b35c-4764625e90b5'),('baec615d-3022-4ebb-ba54-142dc53753e6','ac1bd0bc-2cc5-4b3b-9051-9186d96e6b30'),('c0dec8af-aa0b-4d63-9f00-b008054c1063','7f182e34-b800-4b5e-b71c-10c779fc0d00'),('c0dec8af-aa0b-4d63-9f00-b008054c1063','d81d4f94-592b-45af-aca1-ccad17e21fc7'),('d25ae37d-a0dc-412d-8565-72c324a064fa','accd0ba0-60b7-4665-89a0-174a3f2fe61f'),('d25ae37d-a0dc-412d-8565-72c324a064fa','c499667b-a16a-40f2-9bfa-b6625745d0d5'),('ef1e1cca-e09a-43ae-a83e-b95242f55dbd','4cf69a17-d638-4e41-994c-e1f9199e957b');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDENTIAL` (
                              `ID` varchar(36) NOT NULL,
                              `SALT` tinyblob DEFAULT NULL,
                              `TYPE` varchar(255) DEFAULT NULL,
                              `USER_ID` varchar(36) DEFAULT NULL,
                              `CREATED_DATE` bigint(20) DEFAULT NULL,
                              `USER_LABEL` varchar(255) DEFAULT NULL,
                              `SECRET_DATA` longtext DEFAULT NULL,
                              `CREDENTIAL_DATA` longtext DEFAULT NULL,
                              `PRIORITY` int(11) DEFAULT NULL,
                              PRIMARY KEY (`ID`),
                              KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
                              CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('06bebb67-4339-455e-98e3-fb766a075c32',NULL,'password','e68eacdc-251c-4df5-8e47-c04a9cbe41b6',1594820433581,NULL,'{\"value\":\"shNo2uz2Q+r7xuuPob0W5Vjudpq56qcyRYtk3uDARWX6a92NFkHQOuEM7EBn/HPCJNjEuzhPUY4gVRYvjx+V3w==\",\"salt\":\"EyiPglcj20dlwFmcoM5SOg==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('0ae88b81-b8ab-40f5-9e3c-8e669f24ce83',NULL,'password','531fa566-e204-4b17-86eb-7e196cbca4ed',1593857471816,NULL,'{\"value\":\"UgXYQwBR/u+iTqp1QwDYayxMuWdhC9gN9yJO2MEn3Z8Frv0K983gRpYygMzzOAWee4/5Apdyn7kj2ImboekXpQ==\",\"salt\":\"JdjGGH+E/+Pt1Y9uMsgYvQ==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('9c1938ea-d6ad-40f0-a041-de25b7075e2a',NULL,'password','674e2f04-71dd-430b-ab10-ea66a2e165ca',1594214021161,NULL,'{\"value\":\"SicC+d0rTiEwR6EMniEKagfNqm6lcXYYoxLx3OboeJ1MUFCDAGXgFMQNVKxqz3FfDEl+KgZnwlBPhEjPIzgHdw==\",\"salt\":\"PwC+xTNXcwUzCkVsv/94YA==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
                                     `ID` varchar(255) NOT NULL,
                                     `AUTHOR` varchar(255) NOT NULL,
                                     `FILENAME` varchar(255) NOT NULL,
                                     `DATEEXECUTED` datetime NOT NULL,
                                     `ORDEREXECUTED` int(11) NOT NULL,
                                     `EXECTYPE` varchar(10) NOT NULL,
                                     `MD5SUM` varchar(35) DEFAULT NULL,
                                     `DESCRIPTION` varchar(255) DEFAULT NULL,
                                     `COMMENTS` varchar(255) DEFAULT NULL,
                                     `TAG` varchar(255) DEFAULT NULL,
                                     `LIQUIBASE` varchar(20) DEFAULT NULL,
                                     `CONTEXTS` varchar(255) DEFAULT NULL,
                                     `LABELS` varchar(255) DEFAULT NULL,
                                     `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2020-07-04 18:06:30',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2020-07-04 18:06:30',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2020-07-04 18:06:30',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2020-07-04 18:06:30',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2020-07-04 18:06:31',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2020-07-04 18:06:31',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2020-07-04 18:06:32',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2020-07-04 18:06:32',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2020-07-04 18:06:32',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2020-07-04 18:06:33',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2020-07-04 18:06:33',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2020-07-04 18:06:33',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2020-07-04 18:06:33',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-07-04 18:06:33',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-07-04 18:06:33',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-07-04 18:06:33',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-07-04 18:06:34',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2020-07-04 18:06:34',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2020-07-04 18:06:35',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2020-07-04 18:06:35',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2020-07-04 18:06:35',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2020-07-04 18:06:35',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2020-07-04 18:06:35',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2020-07-04 18:06:35',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2020-07-04 18:06:35',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3857187413'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2020-07-04 18:06:35',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2020-07-04 18:06:36',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2020-07-04 18:06:36',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'3857187413'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2020-07-04 18:06:36',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2020-07-04 18:06:37',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2020-07-04 18:06:37',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2020-07-04 18:06:37',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'3857187413'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-07-04 18:06:37',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'3857187413'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-07-04 18:06:37',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-07-04 18:06:37',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2020-07-04 18:06:37',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3857187413'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-07-04 18:06:37',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'3857187413'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2020-07-04 18:06:37',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'3857187413'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2020-07-04 18:06:37',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'3857187413'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2020-07-04 18:06:37',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'3857187413'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2020-07-04 18:06:37',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'3857187413'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2020-07-04 18:06:37',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'3857187413'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2020-07-04 18:06:38',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2020-07-04 18:06:38',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'3857187413'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-07-04 18:06:38',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'3857187413'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-07-04 18:06:38',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'3857187413'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-07-04 18:06:38',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'3857187413'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-07-04 18:06:38',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-07-04 18:06:38',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3857187413'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2020-07-04 18:06:39',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2020-07-04 18:06:39',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2020-07-04 18:06:39',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3857187413'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2020-07-04 18:06:39',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3857187413'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2020-07-04 18:06:39',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'3857187413'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-07-04 18:06:39',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'3857187413'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-07-04 18:06:39',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'3857187413'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-07-04 18:06:39',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-07-04 18:06:41',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2020-07-04 18:06:41',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2020-07-04 18:06:41',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'3857187413'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2020-07-04 18:06:41',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2020-07-04 18:06:41',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'3857187413'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2020-07-04 18:06:41',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'3857187413'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2020-07-04 18:06:41',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'3857187413'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2020-07-04 18:06:41',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'3857187413'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2020-07-04 18:06:41',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2020-07-04 18:06:41',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'3857187413'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2020-07-04 18:06:41',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3857187413'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2020-07-04 18:06:41',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2020-07-04 18:06:41',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'3857187413'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2020-07-04 18:06:41',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'3857187413'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-07-04 18:06:41',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3857187413'),('8.0.0-updating-credential-data-not-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-07-04 18:06:41',73,'EXECUTED','7:03b3f4b264c3c68ba082250a80b74216','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3857187413'),('8.0.0-updating-credential-data-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-07-04 18:06:41',74,'MARK_RAN','7:64c5728f5ca1f5aa4392217701c4fe23','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3857187413'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-07-04 18:06:42',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-07-04 18:06:42',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'3857187413'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-07-04 18:06:42',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'3857187413'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-07-04 18:06:42',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-07-04 18:06:42',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-07-04 18:06:42',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'3857187413'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-07-04 18:06:42',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'3857187413'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-07-04 18:06:42',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'3857187413'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-07-04 18:06:42',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'3857187413'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-07-04 18:06:42',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'3857187413'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-07-04 18:06:42',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'3857187413');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
                                         `ID` int(11) NOT NULL,
                                         `LOCKED` bit(1) NOT NULL,
                                         `LOCKGRANTED` datetime DEFAULT NULL,
                                         `LOCKEDBY` varchar(255) DEFAULT NULL,
                                         PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL),(1000,'\0',NULL,NULL),(1001,'\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
                                        `REALM_ID` varchar(36) NOT NULL,
                                        `SCOPE_ID` varchar(36) NOT NULL,
                                        `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
                                        PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
                                        KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
                                        KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
                                        CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
                                        CONSTRAINT `FK_R_DEF_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('construction','0e78a9f6-8400-495f-b3d7-6354c608c797','\0'),('construction','13d5a753-cea4-4415-a746-1c70ed5d57f9','\0'),('construction','3257974f-b52a-4538-b2a9-689f32a4be2d',''),('construction','57cb9d0c-0bc8-42b0-b20c-fc82995ff966',''),('construction','7ebf6e4b-f469-4087-ac54-626895b64eb0','\0'),('construction','b1ab347a-2bf6-47e3-9ea4-99bdc6106c4f','\0'),('construction','c2620e25-b4f3-4015-8bf6-bc61bd597e4b',''),('construction','d1a9870e-c93c-4bd4-8982-f38b8ef67ad5',''),('construction','fcb30be2-a910-4037-b1e6-cb37981a9a6d',''),('master','27506d46-380c-4bb9-95cb-e8bf46ff33f0',''),('master','30e31c5b-fe12-4b55-9f26-a53d50233eb2','\0'),('master','48d6b2e1-c46c-41fb-ad16-4f572abe2864',''),('master','496a799c-9e6b-43a0-b8a0-40f4126449d1',''),('master','50920892-ce64-4d5e-8c74-cf1a17d8bb4e',''),('master','726c7ef8-f786-4135-a815-a519eac86776','\0'),('master','967c960c-61f0-426f-bb89-ad04ceecc1ca',''),('master','c7ca3423-433b-4cbc-9b07-53bfc7095a91','\0'),('master','cf947f87-1277-4482-afa3-248cdfdd4eb9','\0'),('trust','0888a299-af64-4825-95db-6733169b8469','\0'),('trust','1bac2bcb-4e3d-4fda-ad61-639d0bd2b6e3',''),('trust','1effee3e-1734-42ed-a535-29e3c661ad11',''),('trust','2855ec8e-58c7-46aa-9dd2-86f1a6a037a1','\0'),('trust','2d62d5b9-3bec-4ce5-9209-932f5056a0c6','\0'),('trust','35e51935-479b-40a7-9d73-a69f5863ec13',''),('trust','4379d808-cca4-47bf-98e7-f10a03a8cf21',''),('trust','6a780e36-732b-4d58-a293-61e919265a55',''),('trust','be6a53d1-f80a-4316-b838-b34ca8f9e936','\0');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENT_ENTITY` (
                                `ID` varchar(36) NOT NULL,
                                `CLIENT_ID` varchar(255) DEFAULT NULL,
                                `DETAILS_JSON` text DEFAULT NULL,
                                `ERROR` varchar(255) DEFAULT NULL,
                                `IP_ADDRESS` varchar(255) DEFAULT NULL,
                                `REALM_ID` varchar(255) DEFAULT NULL,
                                `SESSION_ID` varchar(255) DEFAULT NULL,
                                `EVENT_TIME` bigint(20) DEFAULT NULL,
                                `TYPE` varchar(255) DEFAULT NULL,
                                `USER_ID` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`ID`),
                                KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_IDENTITY` (
                                      `IDENTITY_PROVIDER` varchar(255) NOT NULL,
                                      `REALM_ID` varchar(36) DEFAULT NULL,
                                      `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
                                      `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
                                      `TOKEN` text DEFAULT NULL,
                                      `USER_ID` varchar(36) NOT NULL,
                                      PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
                                      KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
                                      KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
                                      CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_USER` (
                                  `ID` varchar(255) NOT NULL,
                                  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
                                  `REALM_ID` varchar(36) NOT NULL,
                                  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
                                      `ID` varchar(36) NOT NULL,
                                      `NAME` varchar(255) NOT NULL,
                                      `USER_ID` varchar(255) NOT NULL,
                                      `REALM_ID` varchar(36) NOT NULL,
                                      `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                      `VALUE` text DEFAULT NULL,
                                      PRIMARY KEY (`ID`),
                                      KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT` (
                                    `ID` varchar(36) NOT NULL,
                                    `CLIENT_ID` varchar(255) DEFAULT NULL,
                                    `USER_ID` varchar(255) NOT NULL,
                                    `REALM_ID` varchar(36) NOT NULL,
                                    `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                    `CREATED_DATE` bigint(20) DEFAULT NULL,
                                    `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
                                    `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
                                    `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
                                    PRIMARY KEY (`ID`),
                                    KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
                                    KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
                                    KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
                                             `USER_CONSENT_ID` varchar(36) NOT NULL,
                                             `SCOPE_ID` varchar(36) NOT NULL,
                                             PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
                                       `ID` varchar(36) NOT NULL,
                                       `SALT` tinyblob DEFAULT NULL,
                                       `TYPE` varchar(255) DEFAULT NULL,
                                       `CREATED_DATE` bigint(20) DEFAULT NULL,
                                       `USER_ID` varchar(255) NOT NULL,
                                       `REALM_ID` varchar(36) NOT NULL,
                                       `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                       `USER_LABEL` varchar(255) DEFAULT NULL,
                                       `SECRET_DATA` longtext DEFAULT NULL,
                                       `CREDENTIAL_DATA` longtext DEFAULT NULL,
                                       `PRIORITY` int(11) DEFAULT NULL,
                                       PRIMARY KEY (`ID`),
                                       KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
                                       KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
                                             `GROUP_ID` varchar(36) NOT NULL,
                                             `USER_ID` varchar(255) NOT NULL,
                                             `REALM_ID` varchar(36) NOT NULL,
                                             `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                             PRIMARY KEY (`GROUP_ID`,`USER_ID`),
                                             KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
                                             KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
                                            `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
                                            `USER_ID` varchar(255) NOT NULL,
                                            `REALM_ID` varchar(36) NOT NULL,
                                            `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                            PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
                                            KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
                                            KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
                                         `ROLE_ID` varchar(36) NOT NULL,
                                         `USER_ID` varchar(255) NOT NULL,
                                         `REALM_ID` varchar(36) NOT NULL,
                                         `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                         PRIMARY KEY (`ROLE_ID`,`USER_ID`),
                                         KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
                                         KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
                                   `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
                                   `NAME` varchar(255) NOT NULL,
                                   `VALUE` varchar(255) DEFAULT NULL,
                                   `GROUP_ID` varchar(36) NOT NULL,
                                   PRIMARY KEY (`ID`),
                                   KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
                                   CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
                                      `ROLE_ID` varchar(36) NOT NULL,
                                      `GROUP_ID` varchar(36) NOT NULL,
                                      PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
                                      KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
                                      CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
                                      CONSTRAINT `FK_GROUP_ROLE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER` (
                                     `INTERNAL_ID` varchar(36) NOT NULL,
                                     `ENABLED` bit(1) NOT NULL DEFAULT b'0',
                                     `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
                                     `PROVIDER_ID` varchar(255) DEFAULT NULL,
                                     `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
                                     `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
                                     `REALM_ID` varchar(36) DEFAULT NULL,
                                     `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
                                     `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
                                     `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
                                     `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
                                     `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
                                     `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
                                     PRIMARY KEY (`INTERNAL_ID`),
                                     UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
                                     KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
                                     CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
                                            `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
                                            `VALUE` longtext DEFAULT NULL,
                                            `NAME` varchar(255) NOT NULL,
                                            PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
                                            CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
                                            `ID` varchar(36) NOT NULL,
                                            `NAME` varchar(255) NOT NULL,
                                            `IDP_ALIAS` varchar(255) NOT NULL,
                                            `IDP_MAPPER_NAME` varchar(255) NOT NULL,
                                            `REALM_ID` varchar(36) NOT NULL,
                                            PRIMARY KEY (`ID`),
                                            KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
                                            CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
                                     `IDP_MAPPER_ID` varchar(36) NOT NULL,
                                     `VALUE` longtext DEFAULT NULL,
                                     `NAME` varchar(255) NOT NULL,
                                     PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
                                     CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_GROUP` (
                                  `ID` varchar(36) NOT NULL,
                                  `NAME` varchar(255) DEFAULT NULL,
                                  `PARENT_GROUP` varchar(36) NOT NULL,
                                  `REALM_ID` varchar(36) DEFAULT NULL,
                                  PRIMARY KEY (`ID`),
                                  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`),
                                  CONSTRAINT `FK_GROUP_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_ROLE` (
                                 `ID` varchar(36) NOT NULL,
                                 `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
                                 `CLIENT_ROLE` bit(1) DEFAULT NULL,
                                 `DESCRIPTION` varchar(255) DEFAULT NULL,
                                 `NAME` varchar(255) DEFAULT NULL,
                                 `REALM_ID` varchar(255) DEFAULT NULL,
                                 `CLIENT` varchar(36) DEFAULT NULL,
                                 `REALM` varchar(36) DEFAULT NULL,
                                 PRIMARY KEY (`ID`),
                                 UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
                                 KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
                                 KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
                                 CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`),
                                 CONSTRAINT `FK_KJHO5LE2C0RAL09FL8CM9WFW9` FOREIGN KEY (`CLIENT`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('001b3850-326c-48df-a4f1-8498bc64ccf3','c0e394ec-dcae-4a2c-baa0-92a350359b95','','${role_view-profile}','view-profile','master','c0e394ec-dcae-4a2c-baa0-92a350359b95',NULL),('02685a2e-8e46-4b4e-a19a-9acb11f3970e','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_manage-users}','manage-users','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('0369876f-4420-4db3-a03e-b6d0c4bde399','6e1f5847-bd66-46dd-88e4-19991a631b95','','${role_manage-consent}','manage-consent','trust','6e1f5847-bd66-46dd-88e4-19991a631b95',NULL),('0466938f-8e9d-4002-bb33-bcdbd2fc6138','9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','','工作流管理组, 拥有工作流引擎全部功能','camunda-admin','construction','9a2d56b5-7611-40d1-afda-b1e3ea0fe55e',NULL),('0488feae-f170-4613-9f2e-55c3ae6991ed','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_query-users}','query-users','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('06e4bd27-f337-48da-a832-4df8b60cf928','f36a1425-06a7-4f80-9c6a-60de16abe424','','${role_manage-account}','manage-account','construction','f36a1425-06a7-4f80-9c6a-60de16abe424',NULL),('08fcbc1f-6b94-4a30-9cac-a4e53f9c9c25','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_view-events}','view-events','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('09712555-ade5-4632-a3a9-0f4b30abfcc0','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_view-users}','view-users','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('0cbc9e22-b1c6-43e5-be65-7dd60d03679c','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_create-client}','create-client','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('0e072e51-3d89-45a9-adfe-3f399e1727cd','6e1f5847-bd66-46dd-88e4-19991a631b95','','${role_view-consent}','view-consent','trust','6e1f5847-bd66-46dd-88e4-19991a631b95',NULL),('0e85f6ed-9b36-49c2-9ea5-204cc3b431a8','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_view-events}','view-events','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('11d07b70-6872-47c0-8667-59f5d0f24168','c0e394ec-dcae-4a2c-baa0-92a350359b95','','${role_manage-account-links}','manage-account-links','master','c0e394ec-dcae-4a2c-baa0-92a350359b95',NULL),('127a91c7-b080-4e2c-97d6-b32c18c14895','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_query-realms}','query-realms','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('12da1c4e-6928-4bef-85df-99425a5cb601','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_manage-authorization}','manage-authorization','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('14129e9c-79f9-4246-96cb-cda2a73de8c6','6e1f5847-bd66-46dd-88e4-19991a631b95','','${role_view-applications}','view-applications','trust','6e1f5847-bd66-46dd-88e4-19991a631b95',NULL),('1733e0ea-5b9a-41e0-9dad-bdd95fb404fa','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_view-identity-providers}','view-identity-providers','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('19050e9d-20df-4e6a-bb1f-ecece2cef2ed','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_view-authorization}','view-authorization','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('19f16403-264a-48fc-b3e7-604f4fa07c7f','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_manage-events}','manage-events','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('1ae6591a-d0b9-4412-ac73-25bfe4ae0786','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_manage-realm}','manage-realm','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('1d0d1ccd-5a01-4c3b-b2d4-ef2a0e5557dd','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_manage-identity-providers}','manage-identity-providers','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('1fba64ca-aff4-4b7c-a0b8-35af4e0cb369','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_query-groups}','query-groups','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('20058878-ce3c-4cec-a21f-9de74c8652e5','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_query-realms}','query-realms','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('21c21002-06bd-462a-a68c-b225f894c811','construction','\0','${role_uma_authorization}','uma_authorization','construction',NULL,'construction'),('231ef4e7-10a9-498f-b05a-c76000dcba93','trust','\0','${role_offline-access}','offline_access','trust',NULL,'trust'),('23716696-03f8-484b-9d0f-ca690431311e','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_manage-realm}','manage-realm','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('244f67f5-3cc4-4530-8b8f-1202c9f64296','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_impersonation}','impersonation','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('25c6de32-a912-4da2-9f35-602aa7574205','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_manage-clients}','manage-clients','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('2a3b5c59-24d1-46e6-885c-6f185a67662a','6e1f5847-bd66-46dd-88e4-19991a631b95','','${role_manage-account-links}','manage-account-links','trust','6e1f5847-bd66-46dd-88e4-19991a631b95',NULL),('2a8fe9ff-8c0d-4183-b879-6ac49d81c299','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_view-clients}','view-clients','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('2ad8b60d-ba65-4138-9b01-683dd88bcc09','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_manage-events}','manage-events','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('2d364271-3492-4ee9-b9d9-e7e7fff71f9a','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_manage-clients}','manage-clients','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('2db1209c-61fa-46c7-90bb-faa0d222f13a','6e1f5847-bd66-46dd-88e4-19991a631b95','','${role_manage-account}','manage-account','trust','6e1f5847-bd66-46dd-88e4-19991a631b95',NULL),('3020ee06-680e-45ec-90bb-ff8d0148e739','f36a1425-06a7-4f80-9c6a-60de16abe424','','${role_view-consent}','view-consent','construction','f36a1425-06a7-4f80-9c6a-60de16abe424',NULL),('303310d9-d868-476c-ad4e-7de47e38f5f4','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_manage-users}','manage-users','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('30476834-22cf-4c77-a6fb-460455a802b7','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_manage-events}','manage-events','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('32038870-dc7a-4b1a-99ae-36aad916bbdc','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_view-identity-providers}','view-identity-providers','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('3279b938-8f41-45a2-95d6-abdf5c5ef99c','f36a1425-06a7-4f80-9c6a-60de16abe424','','${role_manage-consent}','manage-consent','construction','f36a1425-06a7-4f80-9c6a-60de16abe424',NULL),('32d434aa-c5d2-4665-9288-f7c26b00a06e','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_manage-users}','manage-users','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('39ef115e-77e6-4a6e-be68-874569108ada','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_query-clients}','query-clients','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('3ce5d9fc-8dfc-4f18-9dd6-7bb2c3c20dde','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_create-client}','create-client','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('3e7d3064-43ea-4faa-af29-4083f779dfb8','f36a1425-06a7-4f80-9c6a-60de16abe424','','${role_view-profile}','view-profile','construction','f36a1425-06a7-4f80-9c6a-60de16abe424',NULL),('3eee7b7a-9b46-48ad-90fc-6761fa2409a2','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_query-groups}','query-groups','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('402615f0-d838-4bfc-9743-68bfff84e78c','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_manage-events}','manage-events','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('46d7c91d-f84f-4610-8b9e-cb2838572948','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_manage-clients}','manage-clients','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('49659bf3-e3b8-4b2d-b52b-4e7f16a39efd','c0e394ec-dcae-4a2c-baa0-92a350359b95','','${role_manage-consent}','manage-consent','master','c0e394ec-dcae-4a2c-baa0-92a350359b95',NULL),('4cf69a17-d638-4e41-994c-e1f9199e957b','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_query-clients}','query-clients','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('5225258f-d2fd-462b-8e49-8985c0e28bff','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_query-realms}','query-realms','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('58d888bb-8d35-4951-b50c-6e69ae574188','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_view-authorization}','view-authorization','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('5bc689fa-0e84-413b-9c46-39a818da0b6a','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_view-identity-providers}','view-identity-providers','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('6188adff-5828-4919-87a9-7c78d376011c','5b651231-7cfa-47b2-a23c-7d364fccc758','','${role_read-token}','read-token','trust','5b651231-7cfa-47b2-a23c-7d364fccc758',NULL),('62ec6a52-58ba-4e4d-b25e-102d30971bde','9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','','消防验收业务办理权限-受理','camunda-fire-apply','construction','9a2d56b5-7611-40d1-afda-b1e3ea0fe55e',NULL),('63958519-e8b8-4cfc-9945-ad7bac2bca25','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_query-realms}','query-realms','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('6ed17899-9491-43b3-9269-3080ea3c5c77','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_manage-realm}','manage-realm','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('7140102b-994b-481b-bd8f-0123bf27b346','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_manage-events}','manage-events','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('71c88144-0f11-4ba2-9a49-c41bed8fe340','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_view-events}','view-events','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('73891b29-c00a-4d98-b659-5c9e61890a42','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_manage-authorization}','manage-authorization','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('739b326f-23cc-48cd-8fe2-5c704fea1828','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_query-clients}','query-clients','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('74be5058-a182-44e5-975a-e35a49cd3273','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_view-authorization}','view-authorization','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('78e7cbff-e287-4da0-8c13-f752674c0445','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_view-realm}','view-realm','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('7c72f0f2-024c-4e78-9b14-fc752afd1093','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_manage-identity-providers}','manage-identity-providers','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('7cdad9f1-4128-4f84-9a5f-203d34c1e88f','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_view-authorization}','view-authorization','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('7f182e34-b800-4b5e-b71c-10c779fc0d00','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_query-groups}','query-groups','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('7fa3323e-e047-4161-99c9-417eece03853','c0e394ec-dcae-4a2c-baa0-92a350359b95','','${role_manage-account}','manage-account','master','c0e394ec-dcae-4a2c-baa0-92a350359b95',NULL),('80194120-40cc-4535-a036-e3841ae4c735','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_realm-admin}','realm-admin','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('84ddd9fe-f3e1-4624-961d-35aaab7c4f2e','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_create-client}','create-client','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('86ffe7d0-b3cd-4872-8890-369f46b9a54e','trust','\0','${role_uma_authorization}','uma_authorization','trust',NULL,'trust'),('8824f56f-2c11-4174-b604-0f28cf15a23c','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_manage-realm}','manage-realm','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('8ae25a1f-65cb-4548-957c-51eac1b718dc','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_manage-users}','manage-users','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('8f23867a-6c85-46a6-b7f3-f2584b719020','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_manage-authorization}','manage-authorization','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('907b4ea9-eafb-460e-ba90-1160c6939a57','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_query-clients}','query-clients','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('917b1de0-8f52-4fb3-a1ce-5da72cca057b','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_create-client}','create-client','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('920f3bc0-9156-4e60-865e-1e6d9f07d01e','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_realm-admin}','realm-admin','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('96940093-2c49-4216-89e2-5e6fbc137ce2','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_manage-authorization}','manage-authorization','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('96c37320-9ea4-49b3-b2f8-cce229064215','993444bd-7dc1-4332-95dd-ab8c6a4ebdee','','${role_read-token}','read-token','construction','993444bd-7dc1-4332-95dd-ab8c6a4ebdee',NULL),('97361edc-c8f1-493e-a41e-d2ea5d125d0b','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_query-users}','query-users','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('985d6914-d71b-4a45-a251-86b2a1a1847c','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_view-events}','view-events','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('9955b2e7-2fb9-4978-952d-00e24495c198','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_view-clients}','view-clients','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('9c819947-5cd0-4836-bfd7-da1874d832fa','c0e394ec-dcae-4a2c-baa0-92a350359b95','','${role_view-applications}','view-applications','master','c0e394ec-dcae-4a2c-baa0-92a350359b95',NULL),('a04598c3-302c-4261-b864-493866849e8a','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_impersonation}','impersonation','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('a43e955a-0377-49bf-b6fb-803d8390fa77','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_manage-clients}','manage-clients','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('a7a9b922-ecde-42de-8ec3-6e4e35218191','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_view-identity-providers}','view-identity-providers','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('a991248a-0673-4acb-8ae5-377594afd20f','f36a1425-06a7-4f80-9c6a-60de16abe424','','${role_manage-account-links}','manage-account-links','construction','f36a1425-06a7-4f80-9c6a-60de16abe424',NULL),('aaa6efa8-353d-47b6-9cac-05b09ba0af37','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_impersonation}','impersonation','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('ab1dc866-66ff-4343-afec-c803bf56240a','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_manage-users}','manage-users','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('ab7c6f2a-735e-4f8b-9075-92c2b8ffe459','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_view-users}','view-users','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('ac1bd0bc-2cc5-4b3b-9051-9186d96e6b30','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_query-clients}','query-clients','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('accd0ba0-60b7-4665-89a0-174a3f2fe61f','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_query-groups}','query-groups','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('ae79ec82-cb1a-4e6c-8664-4a257c34f0f0','9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','','消防验收业务办理权限-现场勘查','camunda-fire-site','construction','9a2d56b5-7611-40d1-afda-b1e3ea0fe55e',NULL),('af140dcc-ede9-4146-aeb5-3415ff764e17','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_view-users}','view-users','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('b2b5c711-b8b8-4316-bfbd-34a4d0fd382c','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_view-realm}','view-realm','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('b30389e6-591d-4e0c-a2a5-b5765e0f06c6','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_view-clients}','view-clients','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('b4b77aa3-0fa9-4f29-a932-55f1040cd193','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_manage-realm}','manage-realm','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('b4c44206-db69-417e-b1be-839037f8fe22','master','\0','${role_admin}','admin','master',NULL,'master'),('b86e6d8b-d5b0-49b0-8a3a-9760e5de3ac3','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_manage-clients}','manage-clients','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('b9e10c3d-6851-48ec-a9c2-4454afe4d58e','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_view-realm}','view-realm','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('baec615d-3022-4ebb-ba54-142dc53753e6','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_view-clients}','view-clients','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('bbac728a-54fe-464d-8586-855ecd9e0bdd','construction','\0','${role_offline-access}','offline_access','construction',NULL,'construction'),('c0b8823b-47d4-4daf-8a4d-75b8766da0a2','master','\0','${role_create-realm}','create-realm','master',NULL,'master'),('c0dec8af-aa0b-4d63-9f00-b008054c1063','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_view-users}','view-users','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('c2866d54-1868-4871-b99d-a739aa92d568','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_impersonation}','impersonation','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('c2ee4958-0d7c-40a6-8626-19ee684bc679','master','\0','${role_offline-access}','offline_access','master',NULL,'master'),('c499667b-a16a-40f2-9bfa-b6625745d0d5','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_query-users}','query-users','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('c4da6867-2d6a-4dc5-bfde-0c1b4498c039','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_manage-identity-providers}','manage-identity-providers','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('c5d687e6-094c-45f9-b93a-071318478bd9','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_manage-identity-providers}','manage-identity-providers','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('c66b5597-bf68-4292-8efc-c0b5eca140a6','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_view-authorization}','view-authorization','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('cdebafb3-f38d-4a2f-bdd2-038131bd15de','master','\0','${role_uma_authorization}','uma_authorization','master',NULL,'master'),('d1431c71-7dd7-4464-bae7-d2d0000b16eb','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_view-realm}','view-realm','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('d25ae37d-a0dc-412d-8565-72c324a064fa','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_view-users}','view-users','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('d49f5ca3-4f0a-4c91-aae5-e78180c50521','9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','','参建单位管理','CONSTRUCT.CORP','construction','9a2d56b5-7611-40d1-afda-b1e3ea0fe55e',NULL),('d81d4f94-592b-45af-aca1-ccad17e21fc7','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_query-users}','query-users','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('e1aca465-d820-4c99-a787-b396bbb3a33d','6e1f5847-bd66-46dd-88e4-19991a631b95','','${role_view-profile}','view-profile','trust','6e1f5847-bd66-46dd-88e4-19991a631b95',NULL),('e1e36fe2-0ddd-45c0-835b-b29b1927b7d5','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_view-realm}','view-realm','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('e33da4b5-6368-4c1f-964e-3c25938e83ef','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_query-realms}','query-realms','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('e6d68a06-9714-45e1-90f7-ab2f2be015cc','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_query-groups}','query-groups','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('eab0b069-c6ae-4a42-b7c7-c8eed7d02325','e0085400-94b1-4b08-b494-90cf04b32d5f','','${role_view-events}','view-events','master','e0085400-94b1-4b08-b494-90cf04b32d5f',NULL),('ee1e6aad-f478-4d36-ab00-ca044c4d498d','931bf1fd-bd9a-4916-b11a-5ff899e0af74','','${role_read-token}','read-token','master','931bf1fd-bd9a-4916-b11a-5ff899e0af74',NULL),('ef114a41-dad9-487a-aabc-4ffae258ca85','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_manage-authorization}','manage-authorization','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('ef1e1cca-e09a-43ae-a83e-b95242f55dbd','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_view-clients}','view-clients','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('f483ee12-3ec6-453c-8020-7210a917f63c','c0e394ec-dcae-4a2c-baa0-92a350359b95','','${role_view-consent}','view-consent','master','c0e394ec-dcae-4a2c-baa0-92a350359b95',NULL),('f99a1d31-92f2-4122-a71b-820f3312c0ea','b22398b7-6b89-44bf-9e03-6935610362eb','','${role_impersonation}','impersonation','trust','b22398b7-6b89-44bf-9e03-6935610362eb',NULL),('fb3ffac3-963e-492d-b612-f86b2148dbae','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c','','${role_view-identity-providers}','view-identity-providers','construction','379a1139-94a4-4429-9b6a-a0bd1bf3fd9c',NULL),('fbec83c3-5114-4965-88b2-830acd4a64c4','9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','','数据管理员,可进行数据补录,可不通过业务修改数据','DATA.MGR','construction','9a2d56b5-7611-40d1-afda-b1e3ea0fe55e',NULL),('fc673464-4734-4413-a224-e0a24d4ef414','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_query-users}','query-users','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL),('fd163e81-0b5c-4c23-bbe7-fab4e440df48','e52b07fa-6d42-46bc-9c68-85f35dbe6f90','','${role_create-client}','create-client','master','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',NULL),('fda66742-8528-40f8-a501-6707f36d1d28','f36a1425-06a7-4f80-9c6a-60de16abe424','','${role_view-applications}','view-applications','construction','f36a1425-06a7-4f80-9c6a-60de16abe424',NULL),('fe4922c2-630a-43dc-b35c-4764625e90b5','82468a88-24fb-43f2-bfcf-96f218188c5b','','${role_manage-identity-providers}','manage-identity-providers','master','82468a88-24fb-43f2-bfcf-96f218188c5b',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MIGRATION_MODEL` (
                                   `ID` varchar(36) NOT NULL,
                                   `VERSION` varchar(36) DEFAULT NULL,
                                   `UPDATE_TIME` bigint(20) NOT NULL DEFAULT 0,
                                   PRIMARY KEY (`ID`),
                                   KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('x4e6t','10.0.2',1593857213);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
                                          `USER_SESSION_ID` varchar(36) NOT NULL,
                                          `CLIENT_ID` varchar(255) NOT NULL,
                                          `OFFLINE_FLAG` varchar(4) NOT NULL,
                                          `TIMESTAMP` int(11) DEFAULT NULL,
                                          `DATA` longtext DEFAULT NULL,
                                          `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
                                          `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
                                          PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
                                          KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
                                        `USER_SESSION_ID` varchar(36) NOT NULL,
                                        `USER_ID` varchar(255) DEFAULT NULL,
                                        `REALM_ID` varchar(36) NOT NULL,
                                        `CREATED_ON` int(11) NOT NULL,
                                        `OFFLINE_FLAG` varchar(4) NOT NULL,
                                        `DATA` longtext DEFAULT NULL,
                                        `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT 0,
                                        PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
                                        KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POLICY_CONFIG` (
                                 `POLICY_ID` varchar(36) NOT NULL,
                                 `NAME` varchar(255) NOT NULL,
                                 `VALUE` longtext DEFAULT NULL,
                                 PRIMARY KEY (`POLICY_ID`,`NAME`),
                                 CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER` (
                                   `ID` varchar(36) NOT NULL,
                                   `NAME` varchar(255) NOT NULL,
                                   `PROTOCOL` varchar(255) NOT NULL,
                                   `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
                                   `CLIENT_ID` varchar(36) DEFAULT NULL,
                                   `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
                                   PRIMARY KEY (`ID`),
                                   KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
                                   KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
                                   CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
                                   CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('026e8bd3-72ab-4057-9fe7-b465edbb7397','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','88169c24-3c36-43d5-8ac6-2fd0dca21e23',NULL),('04110ea5-3c95-4ca5-a32e-6f00f2fe5ef0','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a780e36-732b-4d58-a293-61e919265a55'),('09334ec8-8fee-477b-88a7-4d5c9f0e8a8f','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'50920892-ce64-4d5e-8c74-cf1a17d8bb4e'),('0a9f8a05-31ed-408b-a7da-23d26e0551e8','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a780e36-732b-4d58-a293-61e919265a55'),('0ae25341-c18d-4d25-8dde-198fe8554c72','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a780e36-732b-4d58-a293-61e919265a55'),('0b2e0f01-e8e1-4a07-9766-6c5ca1a1238e','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'967c960c-61f0-426f-bb89-ad04ceecc1ca'),('0d06c6db-6af4-4faf-b4dd-a81957117eb2','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'27506d46-380c-4bb9-95cb-e8bf46ff33f0'),('11cbd629-3bed-46f7-9f48-1299586e89a4','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'967c960c-61f0-426f-bb89-ad04ceecc1ca'),('1295a8c1-868c-4eae-8f5a-c1f202f8d2eb','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'27506d46-380c-4bb9-95cb-e8bf46ff33f0'),('13cdaf63-35e1-483c-b1bb-967dda307d66','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a780e36-732b-4d58-a293-61e919265a55'),('172578d8-0ee0-4b59-bd77-85f3b7b7c064','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'35e51935-479b-40a7-9d73-a69f5863ec13'),('176174ee-6b77-4ebe-99f5-d37acde1d24c','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'967c960c-61f0-426f-bb89-ad04ceecc1ca'),('2186a51f-7d63-446f-a830-e1aca4715206','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'fcb30be2-a910-4037-b1e6-cb37981a9a6d'),('22126f9a-74e4-492b-bc92-d98081d31880','username','openid-connect','oidc-usermodel-property-mapper',NULL,'6a780e36-732b-4d58-a293-61e919265a55'),('2642817e-03e5-43a8-9a1a-ccb05fce9cfd','locale','openid-connect','oidc-usermodel-attribute-mapper','220c4c49-dddd-4844-aed1-763a7d255c48',NULL),('2671516c-e8b2-4225-8f57-36bf9cbd07ae','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3257974f-b52a-4538-b2a9-689f32a4be2d'),('29c339d9-58eb-4d93-b95f-dfbb70bd9d5a','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'967c960c-61f0-426f-bb89-ad04ceecc1ca'),('2a97a286-cf95-45cc-9f5f-4871916ce483','email','openid-connect','oidc-usermodel-property-mapper',NULL,'35e51935-479b-40a7-9d73-a69f5863ec13'),('2c8df702-6af1-4113-a3da-eb2f5ed97d66','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'4379d808-cca4-47bf-98e7-f10a03a8cf21'),('2ef7576c-c14d-4c99-8ee0-9018b2dac1c1','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a780e36-732b-4d58-a293-61e919265a55'),('3251a88a-b559-47dd-bee4-6a2222c38297','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3257974f-b52a-4538-b2a9-689f32a4be2d'),('3987eb7b-82bb-4550-981b-94986e7eb37a','username','openid-connect','oidc-usermodel-property-mapper',NULL,'3257974f-b52a-4538-b2a9-689f32a4be2d'),('39918b08-ce5b-4088-89bf-9c5279b250f6','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'967c960c-61f0-426f-bb89-ad04ceecc1ca'),('3a848962-fbad-4508-b8c9-78411948a644','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'6a780e36-732b-4d58-a293-61e919265a55'),('3ef7d259-d826-4054-85ca-849c63d3053c','email','openid-connect','oidc-usermodel-property-mapper',NULL,'48d6b2e1-c46c-41fb-ad16-4f572abe2864'),('44bc9080-7be9-4532-becc-533a719f0009','address','openid-connect','oidc-address-mapper',NULL,'0e78a9f6-8400-495f-b3d7-6354c608c797'),('4525ae94-ca8b-460f-8bc2-7a0e836c590c','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'967c960c-61f0-426f-bb89-ad04ceecc1ca'),('47061e11-0921-4f65-b1f6-5eb65d7ff502','locale','openid-connect','oidc-usermodel-attribute-mapper','540a6346-7e98-4f0d-ad00-3b533b6959d3',NULL),('4a894708-4670-4c55-8ec5-414cc3a4818d','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','86cd7d42-1b68-47ee-aa6e-d895b904fcaf',NULL),('4b16f401-496c-4fdd-8fa6-094ad80a73de','full name','openid-connect','oidc-full-name-mapper',NULL,'967c960c-61f0-426f-bb89-ad04ceecc1ca'),('4d8aa157-169d-4171-b7b9-4d18a1378734','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'4379d808-cca4-47bf-98e7-f10a03a8cf21'),('4e0ed034-61ab-43d4-81b4-a0c441e344b5','address','openid-connect','oidc-address-mapper',NULL,'726c7ef8-f786-4135-a815-a519eac86776'),('51953d63-595b-44d2-a84d-6cd267b519ac','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'30e31c5b-fe12-4b55-9f26-a53d50233eb2'),('52c23f5a-d175-4c8b-9603-7ba40fa09060','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a780e36-732b-4d58-a293-61e919265a55'),('55ec37cb-d85b-4106-beb9-c0150702c7b3','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cf947f87-1277-4482-afa3-248cdfdd4eb9'),('59ff06c0-897d-4c35-bab2-e722cd856116','full name','openid-connect','oidc-full-name-mapper',NULL,'3257974f-b52a-4538-b2a9-689f32a4be2d'),('5ba6a7ca-72db-4853-ae16-d94e4e6cc734','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'d1a9870e-c93c-4bd4-8982-f38b8ef67ad5'),('60ba7607-dc48-4d98-b7ba-476cbaea5797','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3257974f-b52a-4538-b2a9-689f32a4be2d'),('647c0970-3f1d-45a8-b592-c84095f0fa64','email','openid-connect','oidc-usermodel-property-mapper',NULL,'d1a9870e-c93c-4bd4-8982-f38b8ef67ad5'),('65d89115-4992-4a72-83da-bbf035ebe055','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'c2620e25-b4f3-4015-8bf6-bc61bd597e4b'),('6ab87893-7207-4a78-9d81-3fb1a1fa07bb','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a780e36-732b-4d58-a293-61e919265a55'),('6c6b1c7e-17c7-460c-a2b3-e04d60dced52','audience resolve','openid-connect','oidc-audience-resolve-mapper','49d038c9-0c61-42eb-b467-4c912df46ddc',NULL),('72b560f4-699f-4224-9c17-f48bcc2f0de6','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'27506d46-380c-4bb9-95cb-e8bf46ff33f0'),('73419a47-f9c6-4de4-b5dc-5360cb36954a','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3257974f-b52a-4538-b2a9-689f32a4be2d'),('76c18b9d-ea76-4c56-9250-e32ec328a411','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7ebf6e4b-f469-4087-ac54-626895b64eb0'),('79b37bbf-c833-4f53-ba53-290442d33bc2','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','86cd7d42-1b68-47ee-aa6e-d895b904fcaf',NULL),('7a88a701-4179-408c-884d-adb42370ee93','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2855ec8e-58c7-46aa-9dd2-86f1a6a037a1'),('7ba35dfa-3bb5-4ea2-927a-1bc3fa2a12ad','role list','saml','saml-role-list-mapper',NULL,'1effee3e-1734-42ed-a535-29e3c661ad11'),('7cb94dea-1600-4a68-bab3-f4e0dfbdfc12','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'be6a53d1-f80a-4316-b838-b34ca8f9e936'),('800f87d1-4707-4364-9d1d-8f1c10fa192f','role list','saml','saml-role-list-mapper',NULL,'496a799c-9e6b-43a0-b8a0-40f4126449d1'),('80f1bf95-8e5d-4d42-bbc5-24a4d0312d13','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3257974f-b52a-4538-b2a9-689f32a4be2d'),('88fc503a-853e-4cb8-9b41-d8f19cbd3437','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'be6a53d1-f80a-4316-b838-b34ca8f9e936'),('895421c7-9c62-4e50-b847-33e76ae1e89b','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cf947f87-1277-4482-afa3-248cdfdd4eb9'),('8b68f121-3b9f-4e69-bfff-e9b429c22544','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3257974f-b52a-4538-b2a9-689f32a4be2d'),('8ba93f9d-adb5-45ee-8bf1-0dab297f3b79','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3257974f-b52a-4538-b2a9-689f32a4be2d'),('8d000386-5aeb-4444-8613-7c49ba7ed8ac','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'13d5a753-cea4-4415-a746-1c70ed5d57f9'),('8e860b69-fc8e-4fa4-a19d-401d47cbb663','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3257974f-b52a-4538-b2a9-689f32a4be2d'),('92120076-b436-4e14-9108-62119ae8de13','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'3257974f-b52a-4538-b2a9-689f32a4be2d'),('9822dba8-8910-4a3c-85de-c867765fe366','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'967c960c-61f0-426f-bb89-ad04ceecc1ca'),('997c05a6-296a-4245-a8f0-5153a878b0fb','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'967c960c-61f0-426f-bb89-ad04ceecc1ca'),('9c612a01-6287-41fa-8901-6540d04ae70f','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'967c960c-61f0-426f-bb89-ad04ceecc1ca'),('9d9ba65b-8b4e-4018-a40f-5c5a599b7cb4','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2855ec8e-58c7-46aa-9dd2-86f1a6a037a1'),('9df90736-a0a8-4b5e-ae36-c5285bf215bc','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'13d5a753-cea4-4415-a746-1c70ed5d57f9'),('a02d86b6-5098-47b2-aace-d3c92abfc040','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3257974f-b52a-4538-b2a9-689f32a4be2d'),('a1bbe4d1-76eb-43bf-81eb-dfd8095999b6','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'30e31c5b-fe12-4b55-9f26-a53d50233eb2'),('a36bd1ac-47b6-4847-8473-fba575691c92','address','openid-connect','oidc-address-mapper',NULL,'2d62d5b9-3bec-4ce5-9209-932f5056a0c6'),('a9ca8088-537b-49c1-be0d-7f9f9a1cf319','username','openid-connect','oidc-usermodel-property-mapper',NULL,'967c960c-61f0-426f-bb89-ad04ceecc1ca'),('ab84e720-1f55-4ac4-a9e0-1b29f9d8448a','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a780e36-732b-4d58-a293-61e919265a55'),('ad392efc-9c90-494e-a7c6-3bfd8fe428e6','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'1bac2bcb-4e3d-4fda-ad61-639d0bd2b6e3'),('af22489a-5f79-4060-8642-665d1e559ce4','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'c2620e25-b4f3-4015-8bf6-bc61bd597e4b'),('b761b6f0-f51f-4776-bc7b-0069f2e5209f','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'3257974f-b52a-4538-b2a9-689f32a4be2d'),('b76343c9-7d67-4c26-b3a4-b3714291e886','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'6a780e36-732b-4d58-a293-61e919265a55'),('bb06cb79-086b-4bd7-813f-dbe5ee868c4b','audience resolve','openid-connect','oidc-audience-resolve-mapper','bc008dd4-1ecf-4906-900c-5e547094edf1',NULL),('bf5e42c4-95f8-44e0-ba86-3c9406565b7c','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','88169c24-3c36-43d5-8ac6-2fd0dca21e23',NULL),('cae8372d-0f77-4de9-ac62-a3d2953e5037','full name','openid-connect','oidc-full-name-mapper',NULL,'6a780e36-732b-4d58-a293-61e919265a55'),('cdee1774-611f-4b41-9c04-cca9b1353612','audience resolve','openid-connect','oidc-audience-resolve-mapper','215b05a7-f49b-4f55-9519-a54cf5f1f70a',NULL),('cef83eb0-6644-44b4-b35d-03e2e1cc4acc','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'c2620e25-b4f3-4015-8bf6-bc61bd597e4b'),('d16d9c4d-ded5-4992-b214-3b8fae865a05','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3257974f-b52a-4538-b2a9-689f32a4be2d'),('dc84a706-50a4-4c85-9d8a-3410c2321951','locale','openid-connect','oidc-usermodel-attribute-mapper','0bd5b346-d57d-4efc-a702-40c3fd0203f7',NULL),('dda0d552-e4f3-434f-b289-dc2d2dd88ea2','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a780e36-732b-4d58-a293-61e919265a55'),('e397e7cf-7bec-4e02-bb53-078c1c1e1ea2','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'967c960c-61f0-426f-bb89-ad04ceecc1ca'),('e39aaca5-1b30-47a5-9810-c6422910654d','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','86cd7d42-1b68-47ee-aa6e-d895b904fcaf',NULL),('e8a478ba-02d8-4386-8000-1748ad27ea57','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'967c960c-61f0-426f-bb89-ad04ceecc1ca'),('ea555417-b835-451e-81b4-f10082399c08','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'967c960c-61f0-426f-bb89-ad04ceecc1ca'),('edc86678-1d6f-4ca3-8043-57a9f60d1d61','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','88169c24-3c36-43d5-8ac6-2fd0dca21e23',NULL),('f039a4d0-2d35-4f3c-b3a1-c13fd2be2b88','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'48d6b2e1-c46c-41fb-ad16-4f572abe2864'),('f1e657a5-eecf-4ca6-97e3-a024460783fd','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'4379d808-cca4-47bf-98e7-f10a03a8cf21'),('fbc74c9a-49c2-4b35-9870-76dba128f123','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6a780e36-732b-4d58-a293-61e919265a55'),('fcbf7293-bd48-4106-a8e5-271c18c5b303','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7ebf6e4b-f469-4087-ac54-626895b64eb0'),('ffe1f7b4-6160-40de-ae25-f9d22c5ff6f4','role list','saml','saml-role-list-mapper',NULL,'57cb9d0c-0bc8-42b0-b20c-fc82995ff966');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
                                          `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
                                          `VALUE` longtext DEFAULT NULL,
                                          `NAME` varchar(255) NOT NULL,
                                          PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
                                          CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('026e8bd3-72ab-4057-9fe7-b465edbb7397','true','access.token.claim'),('026e8bd3-72ab-4057-9fe7-b465edbb7397','clientAddress','claim.name'),('026e8bd3-72ab-4057-9fe7-b465edbb7397','true','id.token.claim'),('026e8bd3-72ab-4057-9fe7-b465edbb7397','String','jsonType.label'),('026e8bd3-72ab-4057-9fe7-b465edbb7397','clientAddress','user.session.note'),('04110ea5-3c95-4ca5-a32e-6f00f2fe5ef0','true','access.token.claim'),('04110ea5-3c95-4ca5-a32e-6f00f2fe5ef0','updated_at','claim.name'),('04110ea5-3c95-4ca5-a32e-6f00f2fe5ef0','true','id.token.claim'),('04110ea5-3c95-4ca5-a32e-6f00f2fe5ef0','String','jsonType.label'),('04110ea5-3c95-4ca5-a32e-6f00f2fe5ef0','updatedAt','user.attribute'),('04110ea5-3c95-4ca5-a32e-6f00f2fe5ef0','true','userinfo.token.claim'),('0a9f8a05-31ed-408b-a7da-23d26e0551e8','true','access.token.claim'),('0a9f8a05-31ed-408b-a7da-23d26e0551e8','website','claim.name'),('0a9f8a05-31ed-408b-a7da-23d26e0551e8','true','id.token.claim'),('0a9f8a05-31ed-408b-a7da-23d26e0551e8','String','jsonType.label'),('0a9f8a05-31ed-408b-a7da-23d26e0551e8','website','user.attribute'),('0a9f8a05-31ed-408b-a7da-23d26e0551e8','true','userinfo.token.claim'),('0ae25341-c18d-4d25-8dde-198fe8554c72','true','access.token.claim'),('0ae25341-c18d-4d25-8dde-198fe8554c72','nickname','claim.name'),('0ae25341-c18d-4d25-8dde-198fe8554c72','true','id.token.claim'),('0ae25341-c18d-4d25-8dde-198fe8554c72','String','jsonType.label'),('0ae25341-c18d-4d25-8dde-198fe8554c72','nickname','user.attribute'),('0ae25341-c18d-4d25-8dde-198fe8554c72','true','userinfo.token.claim'),('0b2e0f01-e8e1-4a07-9766-6c5ca1a1238e','true','access.token.claim'),('0b2e0f01-e8e1-4a07-9766-6c5ca1a1238e','family_name','claim.name'),('0b2e0f01-e8e1-4a07-9766-6c5ca1a1238e','true','id.token.claim'),('0b2e0f01-e8e1-4a07-9766-6c5ca1a1238e','String','jsonType.label'),('0b2e0f01-e8e1-4a07-9766-6c5ca1a1238e','lastName','user.attribute'),('0b2e0f01-e8e1-4a07-9766-6c5ca1a1238e','true','userinfo.token.claim'),('11cbd629-3bed-46f7-9f48-1299586e89a4','true','access.token.claim'),('11cbd629-3bed-46f7-9f48-1299586e89a4','updated_at','claim.name'),('11cbd629-3bed-46f7-9f48-1299586e89a4','true','id.token.claim'),('11cbd629-3bed-46f7-9f48-1299586e89a4','String','jsonType.label'),('11cbd629-3bed-46f7-9f48-1299586e89a4','updatedAt','user.attribute'),('11cbd629-3bed-46f7-9f48-1299586e89a4','true','userinfo.token.claim'),('1295a8c1-868c-4eae-8f5a-c1f202f8d2eb','true','access.token.claim'),('1295a8c1-868c-4eae-8f5a-c1f202f8d2eb','resource_access.${client_id}.roles','claim.name'),('1295a8c1-868c-4eae-8f5a-c1f202f8d2eb','String','jsonType.label'),('1295a8c1-868c-4eae-8f5a-c1f202f8d2eb','true','multivalued'),('1295a8c1-868c-4eae-8f5a-c1f202f8d2eb','foo','user.attribute'),('13cdaf63-35e1-483c-b1bb-967dda307d66','true','access.token.claim'),('13cdaf63-35e1-483c-b1bb-967dda307d66','zoneinfo','claim.name'),('13cdaf63-35e1-483c-b1bb-967dda307d66','true','id.token.claim'),('13cdaf63-35e1-483c-b1bb-967dda307d66','String','jsonType.label'),('13cdaf63-35e1-483c-b1bb-967dda307d66','zoneinfo','user.attribute'),('13cdaf63-35e1-483c-b1bb-967dda307d66','true','userinfo.token.claim'),('172578d8-0ee0-4b59-bd77-85f3b7b7c064','true','access.token.claim'),('172578d8-0ee0-4b59-bd77-85f3b7b7c064','email_verified','claim.name'),('172578d8-0ee0-4b59-bd77-85f3b7b7c064','true','id.token.claim'),('172578d8-0ee0-4b59-bd77-85f3b7b7c064','boolean','jsonType.label'),('172578d8-0ee0-4b59-bd77-85f3b7b7c064','emailVerified','user.attribute'),('172578d8-0ee0-4b59-bd77-85f3b7b7c064','true','userinfo.token.claim'),('176174ee-6b77-4ebe-99f5-d37acde1d24c','true','access.token.claim'),('176174ee-6b77-4ebe-99f5-d37acde1d24c','birthdate','claim.name'),('176174ee-6b77-4ebe-99f5-d37acde1d24c','true','id.token.claim'),('176174ee-6b77-4ebe-99f5-d37acde1d24c','String','jsonType.label'),('176174ee-6b77-4ebe-99f5-d37acde1d24c','birthdate','user.attribute'),('176174ee-6b77-4ebe-99f5-d37acde1d24c','true','userinfo.token.claim'),('22126f9a-74e4-492b-bc92-d98081d31880','true','access.token.claim'),('22126f9a-74e4-492b-bc92-d98081d31880','preferred_username','claim.name'),('22126f9a-74e4-492b-bc92-d98081d31880','true','id.token.claim'),('22126f9a-74e4-492b-bc92-d98081d31880','String','jsonType.label'),('22126f9a-74e4-492b-bc92-d98081d31880','username','user.attribute'),('22126f9a-74e4-492b-bc92-d98081d31880','true','userinfo.token.claim'),('2642817e-03e5-43a8-9a1a-ccb05fce9cfd','true','access.token.claim'),('2642817e-03e5-43a8-9a1a-ccb05fce9cfd','locale','claim.name'),('2642817e-03e5-43a8-9a1a-ccb05fce9cfd','true','id.token.claim'),('2642817e-03e5-43a8-9a1a-ccb05fce9cfd','String','jsonType.label'),('2642817e-03e5-43a8-9a1a-ccb05fce9cfd','locale','user.attribute'),('2642817e-03e5-43a8-9a1a-ccb05fce9cfd','true','userinfo.token.claim'),('2671516c-e8b2-4225-8f57-36bf9cbd07ae','true','access.token.claim'),('2671516c-e8b2-4225-8f57-36bf9cbd07ae','profile','claim.name'),('2671516c-e8b2-4225-8f57-36bf9cbd07ae','true','id.token.claim'),('2671516c-e8b2-4225-8f57-36bf9cbd07ae','String','jsonType.label'),('2671516c-e8b2-4225-8f57-36bf9cbd07ae','profile','user.attribute'),('2671516c-e8b2-4225-8f57-36bf9cbd07ae','true','userinfo.token.claim'),('29c339d9-58eb-4d93-b95f-dfbb70bd9d5a','true','access.token.claim'),('29c339d9-58eb-4d93-b95f-dfbb70bd9d5a','given_name','claim.name'),('29c339d9-58eb-4d93-b95f-dfbb70bd9d5a','true','id.token.claim'),('29c339d9-58eb-4d93-b95f-dfbb70bd9d5a','String','jsonType.label'),('29c339d9-58eb-4d93-b95f-dfbb70bd9d5a','firstName','user.attribute'),('29c339d9-58eb-4d93-b95f-dfbb70bd9d5a','true','userinfo.token.claim'),('2a97a286-cf95-45cc-9f5f-4871916ce483','true','access.token.claim'),('2a97a286-cf95-45cc-9f5f-4871916ce483','email','claim.name'),('2a97a286-cf95-45cc-9f5f-4871916ce483','true','id.token.claim'),('2a97a286-cf95-45cc-9f5f-4871916ce483','String','jsonType.label'),('2a97a286-cf95-45cc-9f5f-4871916ce483','email','user.attribute'),('2a97a286-cf95-45cc-9f5f-4871916ce483','true','userinfo.token.claim'),('2c8df702-6af1-4113-a3da-eb2f5ed97d66','true','access.token.claim'),('2c8df702-6af1-4113-a3da-eb2f5ed97d66','realm_access.roles','claim.name'),('2c8df702-6af1-4113-a3da-eb2f5ed97d66','String','jsonType.label'),('2c8df702-6af1-4113-a3da-eb2f5ed97d66','true','multivalued'),('2c8df702-6af1-4113-a3da-eb2f5ed97d66','foo','user.attribute'),('2ef7576c-c14d-4c99-8ee0-9018b2dac1c1','true','access.token.claim'),('2ef7576c-c14d-4c99-8ee0-9018b2dac1c1','profile','claim.name'),('2ef7576c-c14d-4c99-8ee0-9018b2dac1c1','true','id.token.claim'),('2ef7576c-c14d-4c99-8ee0-9018b2dac1c1','String','jsonType.label'),('2ef7576c-c14d-4c99-8ee0-9018b2dac1c1','profile','user.attribute'),('2ef7576c-c14d-4c99-8ee0-9018b2dac1c1','true','userinfo.token.claim'),('3251a88a-b559-47dd-bee4-6a2222c38297','true','access.token.claim'),('3251a88a-b559-47dd-bee4-6a2222c38297','middle_name','claim.name'),('3251a88a-b559-47dd-bee4-6a2222c38297','true','id.token.claim'),('3251a88a-b559-47dd-bee4-6a2222c38297','String','jsonType.label'),('3251a88a-b559-47dd-bee4-6a2222c38297','middleName','user.attribute'),('3251a88a-b559-47dd-bee4-6a2222c38297','true','userinfo.token.claim'),('3987eb7b-82bb-4550-981b-94986e7eb37a','true','access.token.claim'),('3987eb7b-82bb-4550-981b-94986e7eb37a','preferred_username','claim.name'),('3987eb7b-82bb-4550-981b-94986e7eb37a','true','id.token.claim'),('3987eb7b-82bb-4550-981b-94986e7eb37a','String','jsonType.label'),('3987eb7b-82bb-4550-981b-94986e7eb37a','username','user.attribute'),('3987eb7b-82bb-4550-981b-94986e7eb37a','true','userinfo.token.claim'),('39918b08-ce5b-4088-89bf-9c5279b250f6','true','access.token.claim'),('39918b08-ce5b-4088-89bf-9c5279b250f6','middle_name','claim.name'),('39918b08-ce5b-4088-89bf-9c5279b250f6','true','id.token.claim'),('39918b08-ce5b-4088-89bf-9c5279b250f6','String','jsonType.label'),('39918b08-ce5b-4088-89bf-9c5279b250f6','middleName','user.attribute'),('39918b08-ce5b-4088-89bf-9c5279b250f6','true','userinfo.token.claim'),('3a848962-fbad-4508-b8c9-78411948a644','true','access.token.claim'),('3a848962-fbad-4508-b8c9-78411948a644','family_name','claim.name'),('3a848962-fbad-4508-b8c9-78411948a644','true','id.token.claim'),('3a848962-fbad-4508-b8c9-78411948a644','String','jsonType.label'),('3a848962-fbad-4508-b8c9-78411948a644','lastName','user.attribute'),('3a848962-fbad-4508-b8c9-78411948a644','true','userinfo.token.claim'),('3ef7d259-d826-4054-85ca-849c63d3053c','true','access.token.claim'),('3ef7d259-d826-4054-85ca-849c63d3053c','email','claim.name'),('3ef7d259-d826-4054-85ca-849c63d3053c','true','id.token.claim'),('3ef7d259-d826-4054-85ca-849c63d3053c','String','jsonType.label'),('3ef7d259-d826-4054-85ca-849c63d3053c','email','user.attribute'),('3ef7d259-d826-4054-85ca-849c63d3053c','true','userinfo.token.claim'),('44bc9080-7be9-4532-becc-533a719f0009','true','access.token.claim'),('44bc9080-7be9-4532-becc-533a719f0009','true','id.token.claim'),('44bc9080-7be9-4532-becc-533a719f0009','country','user.attribute.country'),('44bc9080-7be9-4532-becc-533a719f0009','formatted','user.attribute.formatted'),('44bc9080-7be9-4532-becc-533a719f0009','locality','user.attribute.locality'),('44bc9080-7be9-4532-becc-533a719f0009','postal_code','user.attribute.postal_code'),('44bc9080-7be9-4532-becc-533a719f0009','region','user.attribute.region'),('44bc9080-7be9-4532-becc-533a719f0009','street','user.attribute.street'),('44bc9080-7be9-4532-becc-533a719f0009','true','userinfo.token.claim'),('4525ae94-ca8b-460f-8bc2-7a0e836c590c','true','access.token.claim'),('4525ae94-ca8b-460f-8bc2-7a0e836c590c','nickname','claim.name'),('4525ae94-ca8b-460f-8bc2-7a0e836c590c','true','id.token.claim'),('4525ae94-ca8b-460f-8bc2-7a0e836c590c','String','jsonType.label'),('4525ae94-ca8b-460f-8bc2-7a0e836c590c','nickname','user.attribute'),('4525ae94-ca8b-460f-8bc2-7a0e836c590c','true','userinfo.token.claim'),('47061e11-0921-4f65-b1f6-5eb65d7ff502','true','access.token.claim'),('47061e11-0921-4f65-b1f6-5eb65d7ff502','locale','claim.name'),('47061e11-0921-4f65-b1f6-5eb65d7ff502','true','id.token.claim'),('47061e11-0921-4f65-b1f6-5eb65d7ff502','String','jsonType.label'),('47061e11-0921-4f65-b1f6-5eb65d7ff502','locale','user.attribute'),('47061e11-0921-4f65-b1f6-5eb65d7ff502','true','userinfo.token.claim'),('4a894708-4670-4c55-8ec5-414cc3a4818d','true','access.token.claim'),('4a894708-4670-4c55-8ec5-414cc3a4818d','clientId','claim.name'),('4a894708-4670-4c55-8ec5-414cc3a4818d','true','id.token.claim'),('4a894708-4670-4c55-8ec5-414cc3a4818d','String','jsonType.label'),('4a894708-4670-4c55-8ec5-414cc3a4818d','clientId','user.session.note'),('4b16f401-496c-4fdd-8fa6-094ad80a73de','true','access.token.claim'),('4b16f401-496c-4fdd-8fa6-094ad80a73de','true','id.token.claim'),('4b16f401-496c-4fdd-8fa6-094ad80a73de','true','userinfo.token.claim'),('4d8aa157-169d-4171-b7b9-4d18a1378734','true','access.token.claim'),('4d8aa157-169d-4171-b7b9-4d18a1378734','resource_access.${client_id}.roles','claim.name'),('4d8aa157-169d-4171-b7b9-4d18a1378734','String','jsonType.label'),('4d8aa157-169d-4171-b7b9-4d18a1378734','true','multivalued'),('4d8aa157-169d-4171-b7b9-4d18a1378734','foo','user.attribute'),('4e0ed034-61ab-43d4-81b4-a0c441e344b5','true','access.token.claim'),('4e0ed034-61ab-43d4-81b4-a0c441e344b5','true','id.token.claim'),('4e0ed034-61ab-43d4-81b4-a0c441e344b5','country','user.attribute.country'),('4e0ed034-61ab-43d4-81b4-a0c441e344b5','formatted','user.attribute.formatted'),('4e0ed034-61ab-43d4-81b4-a0c441e344b5','locality','user.attribute.locality'),('4e0ed034-61ab-43d4-81b4-a0c441e344b5','postal_code','user.attribute.postal_code'),('4e0ed034-61ab-43d4-81b4-a0c441e344b5','region','user.attribute.region'),('4e0ed034-61ab-43d4-81b4-a0c441e344b5','street','user.attribute.street'),('4e0ed034-61ab-43d4-81b4-a0c441e344b5','true','userinfo.token.claim'),('51953d63-595b-44d2-a84d-6cd267b519ac','true','access.token.claim'),('51953d63-595b-44d2-a84d-6cd267b519ac','upn','claim.name'),('51953d63-595b-44d2-a84d-6cd267b519ac','true','id.token.claim'),('51953d63-595b-44d2-a84d-6cd267b519ac','String','jsonType.label'),('51953d63-595b-44d2-a84d-6cd267b519ac','username','user.attribute'),('51953d63-595b-44d2-a84d-6cd267b519ac','true','userinfo.token.claim'),('52c23f5a-d175-4c8b-9603-7ba40fa09060','true','access.token.claim'),('52c23f5a-d175-4c8b-9603-7ba40fa09060','locale','claim.name'),('52c23f5a-d175-4c8b-9603-7ba40fa09060','true','id.token.claim'),('52c23f5a-d175-4c8b-9603-7ba40fa09060','String','jsonType.label'),('52c23f5a-d175-4c8b-9603-7ba40fa09060','locale','user.attribute'),('52c23f5a-d175-4c8b-9603-7ba40fa09060','true','userinfo.token.claim'),('55ec37cb-d85b-4106-beb9-c0150702c7b3','true','access.token.claim'),('55ec37cb-d85b-4106-beb9-c0150702c7b3','phone_number','claim.name'),('55ec37cb-d85b-4106-beb9-c0150702c7b3','true','id.token.claim'),('55ec37cb-d85b-4106-beb9-c0150702c7b3','String','jsonType.label'),('55ec37cb-d85b-4106-beb9-c0150702c7b3','phoneNumber','user.attribute'),('55ec37cb-d85b-4106-beb9-c0150702c7b3','true','userinfo.token.claim'),('59ff06c0-897d-4c35-bab2-e722cd856116','true','access.token.claim'),('59ff06c0-897d-4c35-bab2-e722cd856116','true','id.token.claim'),('59ff06c0-897d-4c35-bab2-e722cd856116','true','userinfo.token.claim'),('5ba6a7ca-72db-4853-ae16-d94e4e6cc734','true','access.token.claim'),('5ba6a7ca-72db-4853-ae16-d94e4e6cc734','email_verified','claim.name'),('5ba6a7ca-72db-4853-ae16-d94e4e6cc734','true','id.token.claim'),('5ba6a7ca-72db-4853-ae16-d94e4e6cc734','boolean','jsonType.label'),('5ba6a7ca-72db-4853-ae16-d94e4e6cc734','emailVerified','user.attribute'),('5ba6a7ca-72db-4853-ae16-d94e4e6cc734','true','userinfo.token.claim'),('60ba7607-dc48-4d98-b7ba-476cbaea5797','true','access.token.claim'),('60ba7607-dc48-4d98-b7ba-476cbaea5797','zoneinfo','claim.name'),('60ba7607-dc48-4d98-b7ba-476cbaea5797','true','id.token.claim'),('60ba7607-dc48-4d98-b7ba-476cbaea5797','String','jsonType.label'),('60ba7607-dc48-4d98-b7ba-476cbaea5797','zoneinfo','user.attribute'),('60ba7607-dc48-4d98-b7ba-476cbaea5797','true','userinfo.token.claim'),('647c0970-3f1d-45a8-b592-c84095f0fa64','true','access.token.claim'),('647c0970-3f1d-45a8-b592-c84095f0fa64','email','claim.name'),('647c0970-3f1d-45a8-b592-c84095f0fa64','true','id.token.claim'),('647c0970-3f1d-45a8-b592-c84095f0fa64','String','jsonType.label'),('647c0970-3f1d-45a8-b592-c84095f0fa64','email','user.attribute'),('647c0970-3f1d-45a8-b592-c84095f0fa64','true','userinfo.token.claim'),('65d89115-4992-4a72-83da-bbf035ebe055','true','access.token.claim'),('65d89115-4992-4a72-83da-bbf035ebe055','resource_access.${client_id}.roles','claim.name'),('65d89115-4992-4a72-83da-bbf035ebe055','String','jsonType.label'),('65d89115-4992-4a72-83da-bbf035ebe055','true','multivalued'),('65d89115-4992-4a72-83da-bbf035ebe055','foo','user.attribute'),('6ab87893-7207-4a78-9d81-3fb1a1fa07bb','true','access.token.claim'),('6ab87893-7207-4a78-9d81-3fb1a1fa07bb','birthdate','claim.name'),('6ab87893-7207-4a78-9d81-3fb1a1fa07bb','true','id.token.claim'),('6ab87893-7207-4a78-9d81-3fb1a1fa07bb','String','jsonType.label'),('6ab87893-7207-4a78-9d81-3fb1a1fa07bb','birthdate','user.attribute'),('6ab87893-7207-4a78-9d81-3fb1a1fa07bb','true','userinfo.token.claim'),('72b560f4-699f-4224-9c17-f48bcc2f0de6','true','access.token.claim'),('72b560f4-699f-4224-9c17-f48bcc2f0de6','realm_access.roles','claim.name'),('72b560f4-699f-4224-9c17-f48bcc2f0de6','String','jsonType.label'),('72b560f4-699f-4224-9c17-f48bcc2f0de6','true','multivalued'),('72b560f4-699f-4224-9c17-f48bcc2f0de6','foo','user.attribute'),('73419a47-f9c6-4de4-b5dc-5360cb36954a','true','access.token.claim'),('73419a47-f9c6-4de4-b5dc-5360cb36954a','birthdate','claim.name'),('73419a47-f9c6-4de4-b5dc-5360cb36954a','true','id.token.claim'),('73419a47-f9c6-4de4-b5dc-5360cb36954a','String','jsonType.label'),('73419a47-f9c6-4de4-b5dc-5360cb36954a','birthdate','user.attribute'),('73419a47-f9c6-4de4-b5dc-5360cb36954a','true','userinfo.token.claim'),('76c18b9d-ea76-4c56-9250-e32ec328a411','true','access.token.claim'),('76c18b9d-ea76-4c56-9250-e32ec328a411','phone_number_verified','claim.name'),('76c18b9d-ea76-4c56-9250-e32ec328a411','true','id.token.claim'),('76c18b9d-ea76-4c56-9250-e32ec328a411','boolean','jsonType.label'),('76c18b9d-ea76-4c56-9250-e32ec328a411','phoneNumberVerified','user.attribute'),('76c18b9d-ea76-4c56-9250-e32ec328a411','true','userinfo.token.claim'),('79b37bbf-c833-4f53-ba53-290442d33bc2','true','access.token.claim'),('79b37bbf-c833-4f53-ba53-290442d33bc2','clientHost','claim.name'),('79b37bbf-c833-4f53-ba53-290442d33bc2','true','id.token.claim'),('79b37bbf-c833-4f53-ba53-290442d33bc2','String','jsonType.label'),('79b37bbf-c833-4f53-ba53-290442d33bc2','clientHost','user.session.note'),('7a88a701-4179-408c-884d-adb42370ee93','true','access.token.claim'),('7a88a701-4179-408c-884d-adb42370ee93','phone_number_verified','claim.name'),('7a88a701-4179-408c-884d-adb42370ee93','true','id.token.claim'),('7a88a701-4179-408c-884d-adb42370ee93','boolean','jsonType.label'),('7a88a701-4179-408c-884d-adb42370ee93','phoneNumberVerified','user.attribute'),('7a88a701-4179-408c-884d-adb42370ee93','true','userinfo.token.claim'),('7ba35dfa-3bb5-4ea2-927a-1bc3fa2a12ad','Role','attribute.name'),('7ba35dfa-3bb5-4ea2-927a-1bc3fa2a12ad','Basic','attribute.nameformat'),('7ba35dfa-3bb5-4ea2-927a-1bc3fa2a12ad','false','single'),('7cb94dea-1600-4a68-bab3-f4e0dfbdfc12','true','access.token.claim'),('7cb94dea-1600-4a68-bab3-f4e0dfbdfc12','groups','claim.name'),('7cb94dea-1600-4a68-bab3-f4e0dfbdfc12','true','id.token.claim'),('7cb94dea-1600-4a68-bab3-f4e0dfbdfc12','String','jsonType.label'),('7cb94dea-1600-4a68-bab3-f4e0dfbdfc12','true','multivalued'),('7cb94dea-1600-4a68-bab3-f4e0dfbdfc12','foo','user.attribute'),('800f87d1-4707-4364-9d1d-8f1c10fa192f','Role','attribute.name'),('800f87d1-4707-4364-9d1d-8f1c10fa192f','Basic','attribute.nameformat'),('800f87d1-4707-4364-9d1d-8f1c10fa192f','false','single'),('80f1bf95-8e5d-4d42-bbc5-24a4d0312d13','true','access.token.claim'),('80f1bf95-8e5d-4d42-bbc5-24a4d0312d13','locale','claim.name'),('80f1bf95-8e5d-4d42-bbc5-24a4d0312d13','true','id.token.claim'),('80f1bf95-8e5d-4d42-bbc5-24a4d0312d13','String','jsonType.label'),('80f1bf95-8e5d-4d42-bbc5-24a4d0312d13','locale','user.attribute'),('80f1bf95-8e5d-4d42-bbc5-24a4d0312d13','true','userinfo.token.claim'),('88fc503a-853e-4cb8-9b41-d8f19cbd3437','true','access.token.claim'),('88fc503a-853e-4cb8-9b41-d8f19cbd3437','upn','claim.name'),('88fc503a-853e-4cb8-9b41-d8f19cbd3437','true','id.token.claim'),('88fc503a-853e-4cb8-9b41-d8f19cbd3437','String','jsonType.label'),('88fc503a-853e-4cb8-9b41-d8f19cbd3437','username','user.attribute'),('88fc503a-853e-4cb8-9b41-d8f19cbd3437','true','userinfo.token.claim'),('895421c7-9c62-4e50-b847-33e76ae1e89b','true','access.token.claim'),('895421c7-9c62-4e50-b847-33e76ae1e89b','phone_number_verified','claim.name'),('895421c7-9c62-4e50-b847-33e76ae1e89b','true','id.token.claim'),('895421c7-9c62-4e50-b847-33e76ae1e89b','boolean','jsonType.label'),('895421c7-9c62-4e50-b847-33e76ae1e89b','phoneNumberVerified','user.attribute'),('895421c7-9c62-4e50-b847-33e76ae1e89b','true','userinfo.token.claim'),('8b68f121-3b9f-4e69-bfff-e9b429c22544','true','access.token.claim'),('8b68f121-3b9f-4e69-bfff-e9b429c22544','picture','claim.name'),('8b68f121-3b9f-4e69-bfff-e9b429c22544','true','id.token.claim'),('8b68f121-3b9f-4e69-bfff-e9b429c22544','String','jsonType.label'),('8b68f121-3b9f-4e69-bfff-e9b429c22544','picture','user.attribute'),('8b68f121-3b9f-4e69-bfff-e9b429c22544','true','userinfo.token.claim'),('8ba93f9d-adb5-45ee-8bf1-0dab297f3b79','true','access.token.claim'),('8ba93f9d-adb5-45ee-8bf1-0dab297f3b79','gender','claim.name'),('8ba93f9d-adb5-45ee-8bf1-0dab297f3b79','true','id.token.claim'),('8ba93f9d-adb5-45ee-8bf1-0dab297f3b79','String','jsonType.label'),('8ba93f9d-adb5-45ee-8bf1-0dab297f3b79','gender','user.attribute'),('8ba93f9d-adb5-45ee-8bf1-0dab297f3b79','true','userinfo.token.claim'),('8d000386-5aeb-4444-8613-7c49ba7ed8ac','true','access.token.claim'),('8d000386-5aeb-4444-8613-7c49ba7ed8ac','groups','claim.name'),('8d000386-5aeb-4444-8613-7c49ba7ed8ac','true','id.token.claim'),('8d000386-5aeb-4444-8613-7c49ba7ed8ac','String','jsonType.label'),('8d000386-5aeb-4444-8613-7c49ba7ed8ac','true','multivalued'),('8d000386-5aeb-4444-8613-7c49ba7ed8ac','foo','user.attribute'),('8e860b69-fc8e-4fa4-a19d-401d47cbb663','true','access.token.claim'),('8e860b69-fc8e-4fa4-a19d-401d47cbb663','website','claim.name'),('8e860b69-fc8e-4fa4-a19d-401d47cbb663','true','id.token.claim'),('8e860b69-fc8e-4fa4-a19d-401d47cbb663','String','jsonType.label'),('8e860b69-fc8e-4fa4-a19d-401d47cbb663','website','user.attribute'),('8e860b69-fc8e-4fa4-a19d-401d47cbb663','true','userinfo.token.claim'),('92120076-b436-4e14-9108-62119ae8de13','true','access.token.claim'),('92120076-b436-4e14-9108-62119ae8de13','given_name','claim.name'),('92120076-b436-4e14-9108-62119ae8de13','true','id.token.claim'),('92120076-b436-4e14-9108-62119ae8de13','String','jsonType.label'),('92120076-b436-4e14-9108-62119ae8de13','firstName','user.attribute'),('92120076-b436-4e14-9108-62119ae8de13','true','userinfo.token.claim'),('9822dba8-8910-4a3c-85de-c867765fe366','true','access.token.claim'),('9822dba8-8910-4a3c-85de-c867765fe366','website','claim.name'),('9822dba8-8910-4a3c-85de-c867765fe366','true','id.token.claim'),('9822dba8-8910-4a3c-85de-c867765fe366','String','jsonType.label'),('9822dba8-8910-4a3c-85de-c867765fe366','website','user.attribute'),('9822dba8-8910-4a3c-85de-c867765fe366','true','userinfo.token.claim'),('997c05a6-296a-4245-a8f0-5153a878b0fb','true','access.token.claim'),('997c05a6-296a-4245-a8f0-5153a878b0fb','picture','claim.name'),('997c05a6-296a-4245-a8f0-5153a878b0fb','true','id.token.claim'),('997c05a6-296a-4245-a8f0-5153a878b0fb','String','jsonType.label'),('997c05a6-296a-4245-a8f0-5153a878b0fb','picture','user.attribute'),('997c05a6-296a-4245-a8f0-5153a878b0fb','true','userinfo.token.claim'),('9c612a01-6287-41fa-8901-6540d04ae70f','true','access.token.claim'),('9c612a01-6287-41fa-8901-6540d04ae70f','locale','claim.name'),('9c612a01-6287-41fa-8901-6540d04ae70f','true','id.token.claim'),('9c612a01-6287-41fa-8901-6540d04ae70f','String','jsonType.label'),('9c612a01-6287-41fa-8901-6540d04ae70f','locale','user.attribute'),('9c612a01-6287-41fa-8901-6540d04ae70f','true','userinfo.token.claim'),('9d9ba65b-8b4e-4018-a40f-5c5a599b7cb4','true','access.token.claim'),('9d9ba65b-8b4e-4018-a40f-5c5a599b7cb4','phone_number','claim.name'),('9d9ba65b-8b4e-4018-a40f-5c5a599b7cb4','true','id.token.claim'),('9d9ba65b-8b4e-4018-a40f-5c5a599b7cb4','String','jsonType.label'),('9d9ba65b-8b4e-4018-a40f-5c5a599b7cb4','phoneNumber','user.attribute'),('9d9ba65b-8b4e-4018-a40f-5c5a599b7cb4','true','userinfo.token.claim'),('9df90736-a0a8-4b5e-ae36-c5285bf215bc','true','access.token.claim'),('9df90736-a0a8-4b5e-ae36-c5285bf215bc','upn','claim.name'),('9df90736-a0a8-4b5e-ae36-c5285bf215bc','true','id.token.claim'),('9df90736-a0a8-4b5e-ae36-c5285bf215bc','String','jsonType.label'),('9df90736-a0a8-4b5e-ae36-c5285bf215bc','username','user.attribute'),('9df90736-a0a8-4b5e-ae36-c5285bf215bc','true','userinfo.token.claim'),('a02d86b6-5098-47b2-aace-d3c92abfc040','true','access.token.claim'),('a02d86b6-5098-47b2-aace-d3c92abfc040','updated_at','claim.name'),('a02d86b6-5098-47b2-aace-d3c92abfc040','true','id.token.claim'),('a02d86b6-5098-47b2-aace-d3c92abfc040','String','jsonType.label'),('a02d86b6-5098-47b2-aace-d3c92abfc040','updatedAt','user.attribute'),('a02d86b6-5098-47b2-aace-d3c92abfc040','true','userinfo.token.claim'),('a1bbe4d1-76eb-43bf-81eb-dfd8095999b6','true','access.token.claim'),('a1bbe4d1-76eb-43bf-81eb-dfd8095999b6','groups','claim.name'),('a1bbe4d1-76eb-43bf-81eb-dfd8095999b6','true','id.token.claim'),('a1bbe4d1-76eb-43bf-81eb-dfd8095999b6','String','jsonType.label'),('a1bbe4d1-76eb-43bf-81eb-dfd8095999b6','true','multivalued'),('a1bbe4d1-76eb-43bf-81eb-dfd8095999b6','foo','user.attribute'),('a36bd1ac-47b6-4847-8473-fba575691c92','true','access.token.claim'),('a36bd1ac-47b6-4847-8473-fba575691c92','true','id.token.claim'),('a36bd1ac-47b6-4847-8473-fba575691c92','country','user.attribute.country'),('a36bd1ac-47b6-4847-8473-fba575691c92','formatted','user.attribute.formatted'),('a36bd1ac-47b6-4847-8473-fba575691c92','locality','user.attribute.locality'),('a36bd1ac-47b6-4847-8473-fba575691c92','postal_code','user.attribute.postal_code'),('a36bd1ac-47b6-4847-8473-fba575691c92','region','user.attribute.region'),('a36bd1ac-47b6-4847-8473-fba575691c92','street','user.attribute.street'),('a36bd1ac-47b6-4847-8473-fba575691c92','true','userinfo.token.claim'),('a9ca8088-537b-49c1-be0d-7f9f9a1cf319','true','access.token.claim'),('a9ca8088-537b-49c1-be0d-7f9f9a1cf319','preferred_username','claim.name'),('a9ca8088-537b-49c1-be0d-7f9f9a1cf319','true','id.token.claim'),('a9ca8088-537b-49c1-be0d-7f9f9a1cf319','String','jsonType.label'),('a9ca8088-537b-49c1-be0d-7f9f9a1cf319','username','user.attribute'),('a9ca8088-537b-49c1-be0d-7f9f9a1cf319','true','userinfo.token.claim'),('ab84e720-1f55-4ac4-a9e0-1b29f9d8448a','true','access.token.claim'),('ab84e720-1f55-4ac4-a9e0-1b29f9d8448a','picture','claim.name'),('ab84e720-1f55-4ac4-a9e0-1b29f9d8448a','true','id.token.claim'),('ab84e720-1f55-4ac4-a9e0-1b29f9d8448a','String','jsonType.label'),('ab84e720-1f55-4ac4-a9e0-1b29f9d8448a','picture','user.attribute'),('ab84e720-1f55-4ac4-a9e0-1b29f9d8448a','true','userinfo.token.claim'),('af22489a-5f79-4060-8642-665d1e559ce4','true','access.token.claim'),('af22489a-5f79-4060-8642-665d1e559ce4','realm_access.roles','claim.name'),('af22489a-5f79-4060-8642-665d1e559ce4','String','jsonType.label'),('af22489a-5f79-4060-8642-665d1e559ce4','true','multivalued'),('af22489a-5f79-4060-8642-665d1e559ce4','foo','user.attribute'),('b761b6f0-f51f-4776-bc7b-0069f2e5209f','true','access.token.claim'),('b761b6f0-f51f-4776-bc7b-0069f2e5209f','family_name','claim.name'),('b761b6f0-f51f-4776-bc7b-0069f2e5209f','true','id.token.claim'),('b761b6f0-f51f-4776-bc7b-0069f2e5209f','String','jsonType.label'),('b761b6f0-f51f-4776-bc7b-0069f2e5209f','lastName','user.attribute'),('b761b6f0-f51f-4776-bc7b-0069f2e5209f','true','userinfo.token.claim'),('b76343c9-7d67-4c26-b3a4-b3714291e886','true','access.token.claim'),('b76343c9-7d67-4c26-b3a4-b3714291e886','given_name','claim.name'),('b76343c9-7d67-4c26-b3a4-b3714291e886','true','id.token.claim'),('b76343c9-7d67-4c26-b3a4-b3714291e886','String','jsonType.label'),('b76343c9-7d67-4c26-b3a4-b3714291e886','firstName','user.attribute'),('b76343c9-7d67-4c26-b3a4-b3714291e886','true','userinfo.token.claim'),('bf5e42c4-95f8-44e0-ba86-3c9406565b7c','true','access.token.claim'),('bf5e42c4-95f8-44e0-ba86-3c9406565b7c','clientHost','claim.name'),('bf5e42c4-95f8-44e0-ba86-3c9406565b7c','true','id.token.claim'),('bf5e42c4-95f8-44e0-ba86-3c9406565b7c','String','jsonType.label'),('bf5e42c4-95f8-44e0-ba86-3c9406565b7c','clientHost','user.session.note'),('cae8372d-0f77-4de9-ac62-a3d2953e5037','true','access.token.claim'),('cae8372d-0f77-4de9-ac62-a3d2953e5037','true','id.token.claim'),('cae8372d-0f77-4de9-ac62-a3d2953e5037','true','userinfo.token.claim'),('d16d9c4d-ded5-4992-b214-3b8fae865a05','true','access.token.claim'),('d16d9c4d-ded5-4992-b214-3b8fae865a05','nickname','claim.name'),('d16d9c4d-ded5-4992-b214-3b8fae865a05','true','id.token.claim'),('d16d9c4d-ded5-4992-b214-3b8fae865a05','String','jsonType.label'),('d16d9c4d-ded5-4992-b214-3b8fae865a05','nickname','user.attribute'),('d16d9c4d-ded5-4992-b214-3b8fae865a05','true','userinfo.token.claim'),('dc84a706-50a4-4c85-9d8a-3410c2321951','true','access.token.claim'),('dc84a706-50a4-4c85-9d8a-3410c2321951','locale','claim.name'),('dc84a706-50a4-4c85-9d8a-3410c2321951','true','id.token.claim'),('dc84a706-50a4-4c85-9d8a-3410c2321951','String','jsonType.label'),('dc84a706-50a4-4c85-9d8a-3410c2321951','locale','user.attribute'),('dc84a706-50a4-4c85-9d8a-3410c2321951','true','userinfo.token.claim'),('dda0d552-e4f3-434f-b289-dc2d2dd88ea2','true','access.token.claim'),('dda0d552-e4f3-434f-b289-dc2d2dd88ea2','middle_name','claim.name'),('dda0d552-e4f3-434f-b289-dc2d2dd88ea2','true','id.token.claim'),('dda0d552-e4f3-434f-b289-dc2d2dd88ea2','String','jsonType.label'),('dda0d552-e4f3-434f-b289-dc2d2dd88ea2','middleName','user.attribute'),('dda0d552-e4f3-434f-b289-dc2d2dd88ea2','true','userinfo.token.claim'),('e397e7cf-7bec-4e02-bb53-078c1c1e1ea2','true','access.token.claim'),('e397e7cf-7bec-4e02-bb53-078c1c1e1ea2','gender','claim.name'),('e397e7cf-7bec-4e02-bb53-078c1c1e1ea2','true','id.token.claim'),('e397e7cf-7bec-4e02-bb53-078c1c1e1ea2','String','jsonType.label'),('e397e7cf-7bec-4e02-bb53-078c1c1e1ea2','gender','user.attribute'),('e397e7cf-7bec-4e02-bb53-078c1c1e1ea2','true','userinfo.token.claim'),('e39aaca5-1b30-47a5-9810-c6422910654d','true','access.token.claim'),('e39aaca5-1b30-47a5-9810-c6422910654d','clientAddress','claim.name'),('e39aaca5-1b30-47a5-9810-c6422910654d','true','id.token.claim'),('e39aaca5-1b30-47a5-9810-c6422910654d','String','jsonType.label'),('e39aaca5-1b30-47a5-9810-c6422910654d','clientAddress','user.session.note'),('e8a478ba-02d8-4386-8000-1748ad27ea57','true','access.token.claim'),('e8a478ba-02d8-4386-8000-1748ad27ea57','profile','claim.name'),('e8a478ba-02d8-4386-8000-1748ad27ea57','true','id.token.claim'),('e8a478ba-02d8-4386-8000-1748ad27ea57','String','jsonType.label'),('e8a478ba-02d8-4386-8000-1748ad27ea57','profile','user.attribute'),('e8a478ba-02d8-4386-8000-1748ad27ea57','true','userinfo.token.claim'),('ea555417-b835-451e-81b4-f10082399c08','true','access.token.claim'),('ea555417-b835-451e-81b4-f10082399c08','zoneinfo','claim.name'),('ea555417-b835-451e-81b4-f10082399c08','true','id.token.claim'),('ea555417-b835-451e-81b4-f10082399c08','String','jsonType.label'),('ea555417-b835-451e-81b4-f10082399c08','zoneinfo','user.attribute'),('ea555417-b835-451e-81b4-f10082399c08','true','userinfo.token.claim'),('edc86678-1d6f-4ca3-8043-57a9f60d1d61','true','access.token.claim'),('edc86678-1d6f-4ca3-8043-57a9f60d1d61','clientId','claim.name'),('edc86678-1d6f-4ca3-8043-57a9f60d1d61','true','id.token.claim'),('edc86678-1d6f-4ca3-8043-57a9f60d1d61','String','jsonType.label'),('edc86678-1d6f-4ca3-8043-57a9f60d1d61','clientId','user.session.note'),('f039a4d0-2d35-4f3c-b3a1-c13fd2be2b88','true','access.token.claim'),('f039a4d0-2d35-4f3c-b3a1-c13fd2be2b88','email_verified','claim.name'),('f039a4d0-2d35-4f3c-b3a1-c13fd2be2b88','true','id.token.claim'),('f039a4d0-2d35-4f3c-b3a1-c13fd2be2b88','boolean','jsonType.label'),('f039a4d0-2d35-4f3c-b3a1-c13fd2be2b88','emailVerified','user.attribute'),('f039a4d0-2d35-4f3c-b3a1-c13fd2be2b88','true','userinfo.token.claim'),('fbc74c9a-49c2-4b35-9870-76dba128f123','true','access.token.claim'),('fbc74c9a-49c2-4b35-9870-76dba128f123','gender','claim.name'),('fbc74c9a-49c2-4b35-9870-76dba128f123','true','id.token.claim'),('fbc74c9a-49c2-4b35-9870-76dba128f123','String','jsonType.label'),('fbc74c9a-49c2-4b35-9870-76dba128f123','gender','user.attribute'),('fbc74c9a-49c2-4b35-9870-76dba128f123','true','userinfo.token.claim'),('fcbf7293-bd48-4106-a8e5-271c18c5b303','true','access.token.claim'),('fcbf7293-bd48-4106-a8e5-271c18c5b303','phone_number','claim.name'),('fcbf7293-bd48-4106-a8e5-271c18c5b303','true','id.token.claim'),('fcbf7293-bd48-4106-a8e5-271c18c5b303','String','jsonType.label'),('fcbf7293-bd48-4106-a8e5-271c18c5b303','phoneNumber','user.attribute'),('fcbf7293-bd48-4106-a8e5-271c18c5b303','true','userinfo.token.claim'),('ffe1f7b4-6160-40de-ae25-f9d22c5ff6f4','Role','attribute.name'),('ffe1f7b4-6160-40de-ae25-f9d22c5ff6f4','Basic','attribute.nameformat'),('ffe1f7b4-6160-40de-ae25-f9d22c5ff6f4','false','single');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM` (
                         `ID` varchar(36) NOT NULL,
                         `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
                         `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
                         `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
                         `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
                         `ADMIN_THEME` varchar(255) DEFAULT NULL,
                         `EMAIL_THEME` varchar(255) DEFAULT NULL,
                         `ENABLED` bit(1) NOT NULL DEFAULT b'0',
                         `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                         `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
                         `LOGIN_THEME` varchar(255) DEFAULT NULL,
                         `NAME` varchar(255) DEFAULT NULL,
                         `NOT_BEFORE` int(11) DEFAULT NULL,
                         `PASSWORD_POLICY` text DEFAULT NULL,
                         `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
                         `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
                         `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
                         `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
                         `SSL_REQUIRED` varchar(255) DEFAULT NULL,
                         `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
                         `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
                         `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
                         `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
                         `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
                         `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
                         `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                         `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
                         `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
                         `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                         `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                         `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
                         `OTP_POLICY_COUNTER` int(11) DEFAULT 0,
                         `OTP_POLICY_WINDOW` int(11) DEFAULT 1,
                         `OTP_POLICY_PERIOD` int(11) DEFAULT 30,
                         `OTP_POLICY_DIGITS` int(11) DEFAULT 6,
                         `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
                         `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
                         `BROWSER_FLOW` varchar(36) DEFAULT NULL,
                         `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
                         `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
                         `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
                         `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
                         `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT 0,
                         `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
                         `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT 0,
                         `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
                         `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
                         `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
                         `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT 0,
                         `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
                         `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
                         `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL,
                         PRIMARY KEY (`ID`),
                         UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
                         KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`),
                         CONSTRAINT `FK_TRAF444KK6QRKMS7N56AIWQ5Y` FOREIGN KEY (`MASTER_ADMIN_CLIENT`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('construction',60,300,300,'keycloak','keycloak','keycloak','','\0',0,'keycloak','construction',0,NULL,'\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','82468a88-24fb-43f2-bfcf-96f218188c5b',1800,'','zh-CN','\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','769c8375-cf4e-43de-941b-76dbce13094f','26493c0b-7097-41cf-bafc-7520ca576d19','1a63f39d-40b8-4db0-b207-4e1f5a3c9017','8c84620b-e028-41f6-b6f5-a26b521c59fa','58bf9963-0ca8-4695-a5c7-b212eb3c6ee6',2592000,'\0',900,'','\0','5646f563-a8f8-4337-8ac0-2f4bcb751975',0,'\0',0,0),('master',60,300,60,NULL,NULL,NULL,'','\0',0,NULL,'master',0,NULL,'\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','e0085400-94b1-4b08-b494-90cf04b32d5f',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','e96a88dd-b6af-44ed-870b-69a45e8bb002','5884c106-f26a-477a-b95e-0cb27048d161','56e6f31a-a533-4239-b797-5ab9f9dd9cfa','dac46ecd-87f7-46da-8298-0bbb3e58b00b','4a4ba856-0f0b-4abf-953b-8e905304f630',2592000,'\0',900,'','\0','850fe371-2f0e-42e3-939d-aa8d498bfc2d',0,'\0',0,0),('trust',60,300,300,'keycloak','keycloak','keycloak','','\0',0,'keycloak','trust',0,NULL,'\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','e52b07fa-6d42-46bc-9c68-85f35dbe6f90',1800,'','zh-CN','\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','aac777ed-d472-484b-973e-80ece83c67a1','d043c06e-d72b-411a-b6c3-3ff4ab6b5683','191e8b66-382b-4c8c-9955-44e46ae212d4','17d781d4-3b60-4506-8579-f7ec1485aa4c','ff43bca3-7757-449b-b077-5f272d3449a8',2592000,'\0',900,'','\0','2cde326e-68aa-407f-84fe-3eb595a8cb1a',0,'\0',0,0);
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ATTRIBUTE` (
                                   `NAME` varchar(255) NOT NULL,
                                   `VALUE` varchar(255) DEFAULT NULL,
                                   `REALM_ID` varchar(36) NOT NULL,
                                   PRIMARY KEY (`NAME`,`REALM_ID`),
                                   KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
                                   CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('actionTokenGeneratedByAdminLifespan','43200','construction'),('actionTokenGeneratedByAdminLifespan','43200','trust'),('actionTokenGeneratedByUserLifespan','300','construction'),('actionTokenGeneratedByUserLifespan','300','trust'),('bruteForceProtected','false','construction'),('bruteForceProtected','false','master'),('bruteForceProtected','false','trust'),('clientSessionIdleTimeout','0','construction'),('clientSessionIdleTimeout','0','trust'),('clientSessionMaxLifespan','0','construction'),('clientSessionMaxLifespan','0','trust'),('displayName','消防审批系统','construction'),('displayName','Keycloak','master'),('displayName','协同办公系统','trust'),('displayNameHtml','<div class=\"kc-logo-text\"><span>Keycloak</span></div>','master'),('failureFactor','30','construction'),('failureFactor','30','master'),('failureFactor','30','trust'),('maxDeltaTimeSeconds','43200','construction'),('maxDeltaTimeSeconds','43200','master'),('maxDeltaTimeSeconds','43200','trust'),('maxFailureWaitSeconds','900','construction'),('maxFailureWaitSeconds','900','master'),('maxFailureWaitSeconds','900','trust'),('minimumQuickLoginWaitSeconds','60','construction'),('minimumQuickLoginWaitSeconds','60','master'),('minimumQuickLoginWaitSeconds','60','trust'),('offlineSessionMaxLifespan','5184000','construction'),('offlineSessionMaxLifespan','5184000','master'),('offlineSessionMaxLifespan','5184000','trust'),('offlineSessionMaxLifespanEnabled','false','construction'),('offlineSessionMaxLifespanEnabled','false','master'),('offlineSessionMaxLifespanEnabled','false','trust'),('permanentLockout','false','construction'),('permanentLockout','false','master'),('permanentLockout','false','trust'),('quickLoginCheckMilliSeconds','1000','construction'),('quickLoginCheckMilliSeconds','1000','master'),('quickLoginCheckMilliSeconds','1000','trust'),('waitIncrementSeconds','60','construction'),('waitIncrementSeconds','60','master'),('waitIncrementSeconds','60','trust'),('webAuthnPolicyAttestationConveyancePreference','not specified','construction'),('webAuthnPolicyAttestationConveyancePreference','not specified','trust'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','not specified','construction'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','not specified','trust'),('webAuthnPolicyAuthenticatorAttachment','not specified','construction'),('webAuthnPolicyAuthenticatorAttachment','not specified','trust'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','not specified','construction'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','not specified','trust'),('webAuthnPolicyAvoidSameAuthenticatorRegister','false','construction'),('webAuthnPolicyAvoidSameAuthenticatorRegister','false','trust'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','false','construction'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','false','trust'),('webAuthnPolicyCreateTimeout','0','construction'),('webAuthnPolicyCreateTimeout','0','trust'),('webAuthnPolicyCreateTimeoutPasswordless','0','construction'),('webAuthnPolicyCreateTimeoutPasswordless','0','trust'),('webAuthnPolicyRequireResidentKey','not specified','construction'),('webAuthnPolicyRequireResidentKey','not specified','trust'),('webAuthnPolicyRequireResidentKeyPasswordless','not specified','construction'),('webAuthnPolicyRequireResidentKeyPasswordless','not specified','trust'),('webAuthnPolicyRpEntityName','keycloak','construction'),('webAuthnPolicyRpEntityName','keycloak','trust'),('webAuthnPolicyRpEntityNamePasswordless','keycloak','construction'),('webAuthnPolicyRpEntityNamePasswordless','keycloak','trust'),('webAuthnPolicyRpId','','construction'),('webAuthnPolicyRpId','','trust'),('webAuthnPolicyRpIdPasswordless','','construction'),('webAuthnPolicyRpIdPasswordless','','trust'),('webAuthnPolicySignatureAlgorithms','ES256','construction'),('webAuthnPolicySignatureAlgorithms','ES256','trust'),('webAuthnPolicySignatureAlgorithmsPasswordless','ES256','construction'),('webAuthnPolicySignatureAlgorithmsPasswordless','ES256','trust'),('webAuthnPolicyUserVerificationRequirement','not specified','construction'),('webAuthnPolicyUserVerificationRequirement','not specified','trust'),('webAuthnPolicyUserVerificationRequirementPasswordless','not specified','construction'),('webAuthnPolicyUserVerificationRequirementPasswordless','not specified','trust'),('_browser_header.contentSecurityPolicy','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';','construction'),('_browser_header.contentSecurityPolicy','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';','master'),('_browser_header.contentSecurityPolicy','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';','trust'),('_browser_header.contentSecurityPolicyReportOnly','','construction'),('_browser_header.contentSecurityPolicyReportOnly','','master'),('_browser_header.contentSecurityPolicyReportOnly','','trust'),('_browser_header.strictTransportSecurity','max-age=31536000; includeSubDomains','construction'),('_browser_header.strictTransportSecurity','max-age=31536000; includeSubDomains','master'),('_browser_header.strictTransportSecurity','max-age=31536000; includeSubDomains','trust'),('_browser_header.xContentTypeOptions','nosniff','construction'),('_browser_header.xContentTypeOptions','nosniff','master'),('_browser_header.xContentTypeOptions','nosniff','trust'),('_browser_header.xFrameOptions','SAMEORIGIN','construction'),('_browser_header.xFrameOptions','SAMEORIGIN','master'),('_browser_header.xFrameOptions','SAMEORIGIN','trust'),('_browser_header.xRobotsTag','none','construction'),('_browser_header.xRobotsTag','none','master'),('_browser_header.xRobotsTag','none','trust'),('_browser_header.xXSSProtection','1; mode=block','construction'),('_browser_header.xXSSProtection','1; mode=block','master'),('_browser_header.xXSSProtection','1; mode=block','trust');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
                                        `REALM_ID` varchar(36) NOT NULL,
                                        `GROUP_ID` varchar(36) NOT NULL,
                                        PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
                                        UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
                                        KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
                                        CONSTRAINT `FK_DEF_GROUPS_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
                                        CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_DEFAULT_ROLES` (
                                       `REALM_ID` varchar(36) NOT NULL,
                                       `ROLE_ID` varchar(36) NOT NULL,
                                       PRIMARY KEY (`REALM_ID`,`ROLE_ID`),
                                       UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`),
                                       KEY `IDX_REALM_DEF_ROLES_REALM` (`REALM_ID`),
                                       CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
                                       CONSTRAINT `FK_H4WPD7W4HSOOLNI3H0SW7BTJE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_ROLES`
--

LOCK TABLES `REALM_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `REALM_DEFAULT_ROLES` VALUES ('construction','21c21002-06bd-462a-a68c-b225f894c811'),('construction','bbac728a-54fe-464d-8586-855ecd9e0bdd'),('master','c2ee4958-0d7c-40a6-8626-19ee684bc679'),('master','cdebafb3-f38d-4a2f-bdd2-038131bd15de'),('trust','231ef4e7-10a9-498f-b05a-c76000dcba93'),('trust','86ffe7d0-b3cd-4872-8890-369f46b9a54e');
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
                                             `REALM_ID` varchar(36) NOT NULL,
                                             `VALUE` varchar(255) NOT NULL,
                                             PRIMARY KEY (`REALM_ID`,`VALUE`),
                                             KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
                                             CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
                                          `REALM_ID` varchar(36) NOT NULL,
                                          `VALUE` varchar(255) NOT NULL,
                                          PRIMARY KEY (`REALM_ID`,`VALUE`),
                                          KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
                                          CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('construction','jboss-logging'),('master','jboss-logging'),('trust','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
                                             `TYPE` varchar(255) NOT NULL,
                                             `FORM_LABEL` varchar(255) DEFAULT NULL,
                                             `INPUT` bit(1) NOT NULL DEFAULT b'0',
                                             `SECRET` bit(1) NOT NULL DEFAULT b'0',
                                             `REALM_ID` varchar(36) NOT NULL,
                                             PRIMARY KEY (`REALM_ID`,`TYPE`),
                                             CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password','','','construction'),('password','password','','','master'),('password','password','','','trust');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
                                     `REALM_ID` varchar(36) NOT NULL,
                                     `VALUE` varchar(255) DEFAULT NULL,
                                     `NAME` varchar(255) NOT NULL,
                                     PRIMARY KEY (`REALM_ID`,`NAME`),
                                     CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
                                           `REALM_ID` varchar(36) NOT NULL,
                                           `VALUE` varchar(255) NOT NULL,
                                           PRIMARY KEY (`REALM_ID`,`VALUE`),
                                           KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
                                           CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
INSERT INTO `REALM_SUPPORTED_LOCALES` VALUES ('construction','ca'),('construction','de'),('construction','en'),('construction','es'),('construction','fr'),('construction','it'),('construction','ja'),('construction','lt'),('construction','nl'),('construction','no'),('construction','pl'),('construction','pt-BR'),('construction','ru'),('construction','sk'),('construction','sv'),('construction','tr'),('construction','zh-CN'),('trust','ca'),('trust','de'),('trust','en'),('trust','es'),('trust','fr'),('trust','it'),('trust','ja'),('trust','lt'),('trust','nl'),('trust','no'),('trust','pl'),('trust','pt-BR'),('trust','ru'),('trust','sk'),('trust','sv'),('trust','tr'),('trust','zh-CN');
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REDIRECT_URIS` (
                                 `CLIENT_ID` varchar(36) NOT NULL,
                                 `VALUE` varchar(255) NOT NULL,
                                 PRIMARY KEY (`CLIENT_ID`,`VALUE`),
                                 KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
                                 CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('0bd5b346-d57d-4efc-a702-40c3fd0203f7','/admin/trust/console/*'),('215b05a7-f49b-4f55-9519-a54cf5f1f70a','/realms/master/account/*'),('220c4c49-dddd-4844-aed1-763a7d255c48','/admin/construction/console/*'),('49d038c9-0c61-42eb-b467-4c912df46ddc','/realms/trust/account/*'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','http://localhost:4200/*'),('540a6346-7e98-4f0d-ad00-3b533b6959d3','/admin/master/console/*'),('6e1f5847-bd66-46dd-88e4-19991a631b95','/realms/trust/account/*'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','http://192.168.1.21:5555/*'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','http://192.168.1.21:5555/*'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','http://localhost:4200/*'),('bc008dd4-1ecf-4906-900c-5e547094edf1','/realms/construction/account/*'),('c0e394ec-dcae-4a2c-baa0-92a350359b95','/realms/master/account/*'),('f36a1425-06a7-4f80-9c6a-60de16abe424','/realms/construction/account/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
                                          `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
                                          `VALUE` longtext DEFAULT NULL,
                                          `NAME` varchar(255) NOT NULL,
                                          PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
                                            `ID` varchar(36) NOT NULL,
                                            `ALIAS` varchar(255) DEFAULT NULL,
                                            `NAME` varchar(255) DEFAULT NULL,
                                            `REALM_ID` varchar(36) DEFAULT NULL,
                                            `ENABLED` bit(1) NOT NULL DEFAULT b'0',
                                            `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
                                            `PROVIDER_ID` varchar(255) DEFAULT NULL,
                                            `PRIORITY` int(11) DEFAULT NULL,
                                            PRIMARY KEY (`ID`),
                                            KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
                                            CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('0781a350-4167-46aa-99db-8b738ab67d26','UPDATE_PROFILE','Update Profile','trust','','\0','UPDATE_PROFILE',40),('13cf47ed-01e1-433a-9721-9bdfd3d64011','UPDATE_PROFILE','Update Profile','construction','','\0','UPDATE_PROFILE',40),('3c0882e0-a7b5-4877-9741-b8ef00531a36','update_user_locale','Update User Locale','trust','','\0','update_user_locale',1000),('539f912c-f554-4151-a495-8a45f0d27c05','terms_and_conditions','Terms and Conditions','master','\0','\0','terms_and_conditions',20),('74aaa3c9-f449-48fc-81d9-bae29027b24a','VERIFY_EMAIL','Verify Email','construction','','\0','VERIFY_EMAIL',50),('77078d78-b0c8-4268-ac82-2c84ac8486a1','terms_and_conditions','Terms and Conditions','trust','\0','\0','terms_and_conditions',20),('7b94de4e-ab4f-4c29-b254-2f10d0150736','UPDATE_PASSWORD','Update Password','construction','','\0','UPDATE_PASSWORD',30),('8eb2bd0c-9ff5-4efb-b0fb-449004da1059','terms_and_conditions','Terms and Conditions','construction','\0','\0','terms_and_conditions',20),('999330e6-833d-4711-9f3e-fbf69bbfcd68','update_user_locale','Update User Locale','construction','','\0','update_user_locale',1000),('bb6eb8a0-7761-4070-8708-deaeebd1b573','CONFIGURE_TOTP','Configure OTP','master','','\0','CONFIGURE_TOTP',10),('c47caac2-1447-4e6a-8e92-f2ba129cc196','CONFIGURE_TOTP','Configure OTP','trust','','\0','CONFIGURE_TOTP',10),('ca5444a1-3bae-4487-ba22-2ef7c586c2ef','UPDATE_PROFILE','Update Profile','master','','\0','UPDATE_PROFILE',40),('ce4875a0-5d25-445b-91d0-b817bc35c21d','VERIFY_EMAIL','Verify Email','master','','\0','VERIFY_EMAIL',50),('da4a543c-8d8a-4a84-bb02-5ec565006302','update_user_locale','Update User Locale','master','','\0','update_user_locale',1000),('dd4045a7-29dc-4196-ae98-b24158a7734c','UPDATE_PASSWORD','Update Password','master','','\0','UPDATE_PASSWORD',30),('dd5a1c01-8e9c-4bea-904d-943a58665523','CONFIGURE_TOTP','Configure OTP','construction','','\0','CONFIGURE_TOTP',10),('f97295ac-499e-460a-8f98-76824677d680','VERIFY_EMAIL','Verify Email','trust','','\0','VERIFY_EMAIL',50),('fa5a7004-26ee-4a3c-91d3-65da4a1d9f8f','UPDATE_PASSWORD','Update Password','trust','','\0','UPDATE_PASSWORD',30);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
                                      `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
                                      `NAME` varchar(255) NOT NULL,
                                      `VALUE` varchar(255) DEFAULT NULL,
                                      `RESOURCE_ID` varchar(36) NOT NULL,
                                      PRIMARY KEY (`ID`),
                                      KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
                                      CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_POLICY` (
                                   `RESOURCE_ID` varchar(36) NOT NULL,
                                   `POLICY_ID` varchar(36) NOT NULL,
                                   PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
                                   KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
                                   CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
                                   CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SCOPE` (
                                  `RESOURCE_ID` varchar(36) NOT NULL,
                                  `SCOPE_ID` varchar(36) NOT NULL,
                                  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
                                  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
                                  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
                                  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER` (
                                   `ID` varchar(36) NOT NULL,
                                   `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
                                   `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
                                   `DECISION_STRATEGY` tinyint(4) NOT NULL DEFAULT 1,
                                   PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
                                               `ID` varchar(36) NOT NULL,
                                               `OWNER` varchar(255) DEFAULT NULL,
                                               `REQUESTER` varchar(255) DEFAULT NULL,
                                               `CREATED_TIMESTAMP` bigint(20) NOT NULL,
                                               `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
                                               `RESOURCE_ID` varchar(36) NOT NULL,
                                               `SCOPE_ID` varchar(36) DEFAULT NULL,
                                               `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
                                               `POLICY_ID` varchar(36) DEFAULT NULL,
                                               PRIMARY KEY (`ID`),
                                               UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
                                               KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
                                               KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
                                               KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
                                               KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
                                               CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
                                               CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
                                               CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
                                               CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
                                          `ID` varchar(36) NOT NULL,
                                          `NAME` varchar(255) NOT NULL,
                                          `DESCRIPTION` varchar(255) DEFAULT NULL,
                                          `TYPE` varchar(255) NOT NULL,
                                          `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
                                          `LOGIC` varchar(20) DEFAULT NULL,
                                          `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
                                          `OWNER` varchar(255) DEFAULT NULL,
                                          PRIMARY KEY (`ID`),
                                          UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
                                          KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
                                          CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
                                            `ID` varchar(36) NOT NULL,
                                            `NAME` varchar(255) NOT NULL,
                                            `TYPE` varchar(255) DEFAULT NULL,
                                            `ICON_URI` varchar(255) DEFAULT NULL,
                                            `OWNER` varchar(255) DEFAULT NULL,
                                            `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
                                            `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
                                            `DISPLAY_NAME` varchar(255) DEFAULT NULL,
                                            PRIMARY KEY (`ID`),
                                            UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
                                            KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
                                            CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
                                         `ID` varchar(36) NOT NULL,
                                         `NAME` varchar(255) NOT NULL,
                                         `ICON_URI` varchar(255) DEFAULT NULL,
                                         `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
                                         `DISPLAY_NAME` varchar(255) DEFAULT NULL,
                                         PRIMARY KEY (`ID`),
                                         UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
                                         KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
                                         CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_URIS` (
                                 `RESOURCE_ID` varchar(36) NOT NULL,
                                 `VALUE` varchar(255) NOT NULL,
                                 PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
                                 CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
                                  `ID` varchar(36) NOT NULL,
                                  `ROLE_ID` varchar(36) NOT NULL,
                                  `NAME` varchar(255) NOT NULL,
                                  `VALUE` varchar(255) DEFAULT NULL,
                                  PRIMARY KEY (`ID`),
                                  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
                                  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_MAPPING` (
                                 `CLIENT_ID` varchar(36) NOT NULL,
                                 `ROLE_ID` varchar(36) NOT NULL,
                                 PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
                                 KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
                                 CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
                                 CONSTRAINT `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('215b05a7-f49b-4f55-9519-a54cf5f1f70a','7fa3323e-e047-4161-99c9-417eece03853'),('49d038c9-0c61-42eb-b467-4c912df46ddc','2db1209c-61fa-46c7-90bb-faa0d222f13a'),('bc008dd4-1ecf-4906-900c-5e547094edf1','06e4bd27-f337-48da-a832-4df8b60cf928');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_POLICY` (
                                `SCOPE_ID` varchar(36) NOT NULL,
                                `POLICY_ID` varchar(36) NOT NULL,
                                PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
                                KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
                                CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
                                CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
                                          `REALM_ID` varchar(36) NOT NULL,
                                          `USERNAME` varchar(255) NOT NULL,
                                          `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
                                          `LAST_FAILURE` bigint(20) DEFAULT NULL,
                                          `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
                                          `NUM_FAILURES` int(11) DEFAULT NULL,
                                          PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ATTRIBUTE` (
                                  `NAME` varchar(255) NOT NULL,
                                  `VALUE` varchar(255) DEFAULT NULL,
                                  `USER_ID` varchar(36) NOT NULL,
                                  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
                                  PRIMARY KEY (`ID`),
                                  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
                                  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `USER_ATTRIBUTE` VALUES ('origin','223138809906306','674e2f04-71dd-430b-ab10-ea66a2e165ca','48545d3d-19aa-4de9-aeac-ea41bad71e76'),('locale','zh-CN','531fa566-e204-4b17-86eb-7e196cbca4ed','fdfe66ab-6624-42ea-ac52-aa0fcea058a2');
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT` (
                                `ID` varchar(36) NOT NULL,
                                `CLIENT_ID` varchar(255) DEFAULT NULL,
                                `USER_ID` varchar(36) NOT NULL,
                                `CREATED_DATE` bigint(20) DEFAULT NULL,
                                `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
                                `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
                                `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`ID`),
                                UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
                                KEY `IDX_USER_CONSENT` (`USER_ID`),
                                CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
                                             `USER_CONSENT_ID` varchar(36) NOT NULL,
                                             `SCOPE_ID` varchar(36) NOT NULL,
                                             PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
                                             KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
                                             CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ENTITY` (
                               `ID` varchar(36) NOT NULL,
                               `EMAIL` varchar(255) DEFAULT NULL,
                               `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
                               `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
                               `ENABLED` bit(1) NOT NULL DEFAULT b'0',
                               `FEDERATION_LINK` varchar(255) DEFAULT NULL,
                               `FIRST_NAME` varchar(255) DEFAULT NULL,
                               `LAST_NAME` varchar(255) DEFAULT NULL,
                               `REALM_ID` varchar(255) DEFAULT NULL,
                               `USERNAME` varchar(255) DEFAULT NULL,
                               `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
                               `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
                               `NOT_BEFORE` int(11) NOT NULL DEFAULT 0,
                               PRIMARY KEY (`ID`),
                               UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
                               UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
                               KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('2f3c636f-64c0-47e2-bed2-c83c9dd0accb',NULL,'1189f2ce-77b7-4165-bc61-4dfb3665ff31','\0','',NULL,NULL,NULL,'construction','service-account-extends',1593858483238,'88169c24-3c36-43d5-8ac6-2fd0dca21e23',0),('531fa566-e204-4b17-86eb-7e196cbca4ed','cooper.lee.g@gmail.com','cooper.lee.g@gmail.com','\0','',NULL,'李','迎涛','construction','root',1593857410368,NULL,0),('674e2f04-71dd-430b-ab10-ea66a2e165ca',NULL,'187644d7-5fb5-4d56-a02c-c496fac05306','\0','',NULL,'666',NULL,'trust','777',1593913339620,NULL,0),('e68eacdc-251c-4df5-8e47-c04a9cbe41b6',NULL,'e785ee28-04bf-4adb-a76f-d500c46c9ddf','\0','',NULL,NULL,NULL,'master','admin',1593857220186,NULL,0),('ef97835e-2134-484e-acdd-a722bc221a38',NULL,'6716c7c7-0869-4fbe-9b38-36096e4e993e','\0','',NULL,NULL,NULL,'trust','service-account-corp-admin',1593858776208,'86cd7d42-1b68-47ee-aa6e-d895b904fcaf',0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
                                          `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
                                          `VALUE` varchar(255) DEFAULT NULL,
                                          `NAME` varchar(255) NOT NULL,
                                          PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
                                          CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
                                          `ID` varchar(36) NOT NULL,
                                          `NAME` varchar(255) NOT NULL,
                                          `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
                                          `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
                                          `REALM_ID` varchar(36) NOT NULL,
                                          PRIMARY KEY (`ID`),
                                          KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
                                          KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
                                          CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
                                          CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
                                                 `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
                                                 `VALUE` varchar(255) DEFAULT NULL,
                                                 `NAME` varchar(255) NOT NULL,
                                                 PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
                                                 CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
                                            `ID` varchar(36) NOT NULL,
                                            `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
                                            `DISPLAY_NAME` varchar(255) DEFAULT NULL,
                                            `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
                                            `LAST_SYNC` int(11) DEFAULT NULL,
                                            `PRIORITY` int(11) DEFAULT NULL,
                                            `PROVIDER_NAME` varchar(255) DEFAULT NULL,
                                            `REALM_ID` varchar(36) DEFAULT NULL,
                                            PRIMARY KEY (`ID`),
                                            KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
                                            CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
                                         `GROUP_ID` varchar(36) NOT NULL,
                                         `USER_ID` varchar(36) NOT NULL,
                                         PRIMARY KEY (`GROUP_ID`,`USER_ID`),
                                         KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
                                         CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
                                        `USER_ID` varchar(36) NOT NULL,
                                        `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
                                        PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
                                        KEY `IDX_USER_REQACTIONS` (`USER_ID`),
                                        CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ROLE_MAPPING` (
                                     `ROLE_ID` varchar(255) NOT NULL,
                                     `USER_ID` varchar(36) NOT NULL,
                                     PRIMARY KEY (`ROLE_ID`,`USER_ID`),
                                     KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
                                     CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('001b3850-326c-48df-a4f1-8498bc64ccf3','e68eacdc-251c-4df5-8e47-c04a9cbe41b6'),('02685a2e-8e46-4b4e-a19a-9acb11f3970e','531fa566-e204-4b17-86eb-7e196cbca4ed'),('0466938f-8e9d-4002-bb33-bcdbd2fc6138','531fa566-e204-4b17-86eb-7e196cbca4ed'),('0488feae-f170-4613-9f2e-55c3ae6991ed','ef97835e-2134-484e-acdd-a722bc221a38'),('06e4bd27-f337-48da-a832-4df8b60cf928','2f3c636f-64c0-47e2-bed2-c83c9dd0accb'),('06e4bd27-f337-48da-a832-4df8b60cf928','531fa566-e204-4b17-86eb-7e196cbca4ed'),('12da1c4e-6928-4bef-85df-99425a5cb601','531fa566-e204-4b17-86eb-7e196cbca4ed'),('19050e9d-20df-4e6a-bb1f-ecece2cef2ed','ef97835e-2134-484e-acdd-a722bc221a38'),('1fba64ca-aff4-4b7c-a0b8-35af4e0cb369','ef97835e-2134-484e-acdd-a722bc221a38'),('21c21002-06bd-462a-a68c-b225f894c811','2f3c636f-64c0-47e2-bed2-c83c9dd0accb'),('21c21002-06bd-462a-a68c-b225f894c811','531fa566-e204-4b17-86eb-7e196cbca4ed'),('231ef4e7-10a9-498f-b05a-c76000dcba93','674e2f04-71dd-430b-ab10-ea66a2e165ca'),('231ef4e7-10a9-498f-b05a-c76000dcba93','ef97835e-2134-484e-acdd-a722bc221a38'),('2a8fe9ff-8c0d-4183-b879-6ac49d81c299','ef97835e-2134-484e-acdd-a722bc221a38'),('2db1209c-61fa-46c7-90bb-faa0d222f13a','674e2f04-71dd-430b-ab10-ea66a2e165ca'),('2db1209c-61fa-46c7-90bb-faa0d222f13a','ef97835e-2134-484e-acdd-a722bc221a38'),('30476834-22cf-4c77-a6fb-460455a802b7','531fa566-e204-4b17-86eb-7e196cbca4ed'),('3e7d3064-43ea-4faa-af29-4083f779dfb8','2f3c636f-64c0-47e2-bed2-c83c9dd0accb'),('3e7d3064-43ea-4faa-af29-4083f779dfb8','531fa566-e204-4b17-86eb-7e196cbca4ed'),('739b326f-23cc-48cd-8fe2-5c704fea1828','ef97835e-2134-484e-acdd-a722bc221a38'),('78e7cbff-e287-4da0-8c13-f752674c0445','ef97835e-2134-484e-acdd-a722bc221a38'),('7fa3323e-e047-4161-99c9-417eece03853','e68eacdc-251c-4df5-8e47-c04a9cbe41b6'),('86ffe7d0-b3cd-4872-8890-369f46b9a54e','674e2f04-71dd-430b-ab10-ea66a2e165ca'),('86ffe7d0-b3cd-4872-8890-369f46b9a54e','ef97835e-2134-484e-acdd-a722bc221a38'),('8824f56f-2c11-4174-b604-0f28cf15a23c','531fa566-e204-4b17-86eb-7e196cbca4ed'),('8f23867a-6c85-46a6-b7f3-f2584b719020','ef97835e-2134-484e-acdd-a722bc221a38'),('ab1dc866-66ff-4343-afec-c803bf56240a','ef97835e-2134-484e-acdd-a722bc221a38'),('ab7c6f2a-735e-4f8b-9075-92c2b8ffe459','ef97835e-2134-484e-acdd-a722bc221a38'),('b4c44206-db69-417e-b1be-839037f8fe22','e68eacdc-251c-4df5-8e47-c04a9cbe41b6'),('bbac728a-54fe-464d-8586-855ecd9e0bdd','2f3c636f-64c0-47e2-bed2-c83c9dd0accb'),('bbac728a-54fe-464d-8586-855ecd9e0bdd','531fa566-e204-4b17-86eb-7e196cbca4ed'),('c2ee4958-0d7c-40a6-8626-19ee684bc679','e68eacdc-251c-4df5-8e47-c04a9cbe41b6'),('cdebafb3-f38d-4a2f-bdd2-038131bd15de','e68eacdc-251c-4df5-8e47-c04a9cbe41b6'),('d49f5ca3-4f0a-4c91-aae5-e78180c50521','531fa566-e204-4b17-86eb-7e196cbca4ed'),('e1aca465-d820-4c99-a787-b396bbb3a33d','674e2f04-71dd-430b-ab10-ea66a2e165ca'),('e1aca465-d820-4c99-a787-b396bbb3a33d','ef97835e-2134-484e-acdd-a722bc221a38'),('e33da4b5-6368-4c1f-964e-3c25938e83ef','ef97835e-2134-484e-acdd-a722bc221a38'),('fbec83c3-5114-4965-88b2-830acd4a64c4','531fa566-e204-4b17-86eb-7e196cbca4ed');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION` (
                                `ID` varchar(36) NOT NULL,
                                `AUTH_METHOD` varchar(255) DEFAULT NULL,
                                `IP_ADDRESS` varchar(255) DEFAULT NULL,
                                `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
                                `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
                                `REALM_ID` varchar(255) DEFAULT NULL,
                                `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
                                `STARTED` int(11) DEFAULT NULL,
                                `USER_ID` varchar(255) DEFAULT NULL,
                                `USER_SESSION_STATE` int(11) DEFAULT NULL,
                                `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
                                `BROKER_USER_ID` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION_NOTE` (
                                     `USER_SESSION` varchar(36) NOT NULL,
                                     `NAME` varchar(255) NOT NULL,
                                     `VALUE` text DEFAULT NULL,
                                     PRIMARY KEY (`USER_SESSION`,`NAME`),
                                     CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WEB_ORIGINS` (
                               `CLIENT_ID` varchar(36) NOT NULL,
                               `VALUE` varchar(255) NOT NULL,
                               PRIMARY KEY (`CLIENT_ID`,`VALUE`),
                               KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
                               CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('0bd5b346-d57d-4efc-a702-40c3fd0203f7','+'),('220c4c49-dddd-4844-aed1-763a7d255c48','+'),('4b5b786e-975d-493f-9d72-f72fb75fa0e0','*'),('540a6346-7e98-4f0d-ad00-3b533b6959d3','+'),('86cd7d42-1b68-47ee-aa6e-d895b904fcaf','*'),('88169c24-3c36-43d5-8ac6-2fd0dca21e23','*'),('9a2d56b5-7611-40d1-afda-b1e3ea0fe55e','*');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-16  0:28:26




# USE camunda;
#


# insert into BUSINESS_DEFINE(ID, NAME,PROCESS,DESCRIPTION_TEMPLATE) VALUES ('FIRE_CHECK','特殊建设工程消防验收','construct-fire-check','项目名称为${name!"-"}, 面积${area!"-"}');
#
# insert into BUSINESS_FILE_DEFINE(BUSINESS, _ORDER,NAME,DESCRIPTION, TYPE) VALUES ('FIRE_CHECK',1,'消防验收申请表','','REQ');
# insert into BUSINESS_FILE_DEFINE(BUSINESS, _ORDER,NAME,DESCRIPTION, TYPE) VALUES ('FIRE_CHECK',2,'工程竣工验收报告','','REQ');
# insert into BUSINESS_FILE_DEFINE(BUSINESS, _ORDER,NAME,DESCRIPTION, TYPE) VALUES ('FIRE_CHECK',3,'涉及消防的建设工程竣工图纸','','REQ');
#
#
# insert into BUSINESS_DEFINE(ID, NAME,PROCESS,DESCRIPTION_TEMPLATE) VALUES ('FIRE_RECORD','建设工程消防验收备案','construct-fire-check','项目名称为${name!"-"}, 面积${area!"-"}');
#
# insert into BUSINESS_FILE_DEFINE(BUSINESS, _ORDER,NAME,DESCRIPTION, TYPE) VALUES ('FIRE_RECORD',1,'消防验收备案表','','REQ');
# insert into BUSINESS_FILE_DEFINE(BUSINESS, _ORDER,NAME,DESCRIPTION, TYPE) VALUES ('FIRE_RECORD',2,'工程竣工验收报告','','REQ');
# insert into BUSINESS_FILE_DEFINE(BUSINESS, _ORDER,NAME,DESCRIPTION, TYPE) VALUES ('FIRE_RECORD',3,'涉及消防的建设工程竣工图纸','','REQ');



DROP DATABASE IF EXISTS CONSTRUCT;

CREATE DATABASE CONSTRUCT;

SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

USE CONSTRUCT;

DROP TABLE IF EXISTS BUSINESS_REG;
DROP TABLE IF EXISTS CONSTRUCT_CORP_REG;
DROP TABLE IF EXISTS CONSTRUCT_EMPLOYEE;
DROP TABLE IF EXISTS LOGIN;
DROP TABLE IF EXISTS CONSTRUCT_CORP;
DROP TABLE IF EXISTS CONSTRUCT_CORP_REG_INFO;
DROP TABLE IF EXISTS CONSTRUCT_PROJECT;
DROP TABLE IF EXISTS CORP_REG_BUSINESS;
DROP TABLE IF EXISTS CORP_INFO;
DROP TABLE IF EXISTS JOIN_PERSON;
DROP TABLE IF EXISTS JOIN_CORP;
DROP TABLE IF EXISTS PROJECT_INFO;
DROP TABLE IF EXISTS CREDIT_RECORD;


DROP TABLE IF EXISTS WORKER_NODE;
CREATE TABLE WORKER_NODE
(
    ID BIGINT NOT NULL AUTO_INCREMENT COMMENT 'auto increment id',
    HOST_NAME VARCHAR(64) NOT NULL COMMENT 'host name',
    PORT VARCHAR(64) NOT NULL COMMENT 'port',
    TYPE INT NOT NULL COMMENT 'node type: CONTAINER(1), ACTUAL(2), FAKE(3)',
    LAUNCH_DATE DATE NOT NULL COMMENT 'launch date',
    MODIFIED TIMESTAMP NOT NULL COMMENT 'modified time',
    CREATED TIMESTAMP NOT NULL COMMENT 'created time',
    PRIMARY KEY(ID)
)
    COMMENT='DB WorkerID Assigner for UID Generator',ENGINE = INNODB;

/* Create Tables */

CREATE TABLE BUSINESS_REG
(
    CORP_TYPE varchar(16) NOT NULL,
    BUSINESS_ID bigint NOT NULL,
    REG_ID bigint NOT NULL,
    -- DELETE
    -- MODIFY
    -- CREATE
    -- QUOTED
    OPERATE varchar(6) NOT NULL COMMENT 'DELETE
MODIFY
CREATE
QUOTED',
    PRIMARY KEY (CORP_TYPE, BUSINESS_ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE CONSTRUCT_CORP
(
    CORP_CODE bigint NOT NULL,
    CORP_INFO bigint NOT NULL,
    ENABLE boolean NOT NULL,
    TYPES varchar(128) NOT NULL,
    DATA_TIME timestamp NOT NULL,
    PRIMARY KEY (CORP_CODE)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE CONSTRUCT_CORP_REG
(
    CORP_CODE bigint NOT NULL,
    CORP_TYPE varchar(16) NOT NULL,
    REG_ID bigint NOT NULL,
    PRIMARY KEY (CORP_CODE, CORP_TYPE)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE CONSTRUCT_CORP_REG_INFO
(
    REG_DATE_TO date NOT NULL,
    REG_TIME datetime NOT NULL,
    LEVEL int,
    LEVEL_NUMBER varchar(32),
    ID bigint NOT NULL,
    PREVIOUS bigint,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE CONSTRUCT_EMPLOYEE
(
    IDENTIFY_TYPE varchar(16) NOT NULL,
    IDENTIFY_NUMBER varchar(32),
    NAME varchar(64) NOT NULL,
    TEL varchar(16),
    CORP_CODE bigint NOT NULL,
    DATA_TIME timestamp NOT NULL,
    MANAGER boolean NOT NULL,
    USERNAME varchar(32) NOT NULL,
    ID bigint NOT NULL,
    VALID boolean NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE CORP_INFO
(
    ID bigint NOT NULL,
    REG_ID_TYPE varchar(16) NOT NULL,
    REG_ID_NUMBER varchar(32) NOT NULL,
    OWNER_NAME varchar(32) NOT NULL,
    OWNER_ID_TYPE varchar(16) NOT NULL,
    OWNER_ID_NUMBER varchar(32),
    ADDRESS varchar(256),
    TEL varchar(16),
    NAME varchar(128) NOT NULL,
    PREVIOUS bigint,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE CORP_REG_BUSINESS
(
    BUSINESS_ID bigint NOT NULL,
    CORP_CODE bigint NOT NULL,
    CREATE_TIME datetime NOT NULL,
    REG_TIME datetime NOT NULL,
    -- OLD
    -- OLE
    -- BIZ
    SOURCE varchar(8) NOT NULL COMMENT 'OLD
OLE
BIZ',
    STATUS varchar(8),
    INFO boolean NOT NULL,
    CORP_INFO bigint NOT NULL,
    TAGS varchar(512),
    APPLY_TIME datetime,
    PRIMARY KEY (BUSINESS_ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;

CREATE TABLE CREDIT_RECORD
(
    ID bigint NOT NULL,
    TYPE varchar(16) NOT NULL,
    DESCRIPTION varchar(512),
    CORP_CODE bigint NOT NULL,
    RECORD_TIME datetime NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;



/* Create Foreign Keys */

ALTER TABLE CONSTRUCT_CORP_REG
    ADD FOREIGN KEY (CORP_CODE)
        REFERENCES CONSTRUCT_CORP (CORP_CODE)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE CONSTRUCT_EMPLOYEE
    ADD FOREIGN KEY (CORP_CODE)
        REFERENCES CONSTRUCT_CORP (CORP_CODE)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE BUSINESS_REG
    ADD FOREIGN KEY (REG_ID)
        REFERENCES CONSTRUCT_CORP_REG_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE CONSTRUCT_CORP_REG
    ADD FOREIGN KEY (REG_ID)
        REFERENCES CONSTRUCT_CORP_REG_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE CONSTRUCT_CORP_REG_INFO
    ADD FOREIGN KEY (PREVIOUS)
        REFERENCES CONSTRUCT_CORP_REG_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE CONSTRUCT_CORP
    ADD FOREIGN KEY (CORP_INFO)
        REFERENCES CORP_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE CORP_INFO
    ADD FOREIGN KEY (PREVIOUS)
        REFERENCES CORP_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE CORP_REG_BUSINESS
    ADD FOREIGN KEY (CORP_INFO)
        REFERENCES CORP_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE BUSINESS_REG
    ADD FOREIGN KEY (BUSINESS_ID)
        REFERENCES CORP_REG_BUSINESS (BUSINESS_ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;

ALTER TABLE CONSTRUCT_EMPLOYEE
    ADD FOREIGN KEY (CORP_CODE)
        REFERENCES CONSTRUCT_CORP (CORP_CODE)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;

ALTER TABLE CREDIT_RECORD
    ADD FOREIGN KEY (CORP_CODE)
        REFERENCES CONSTRUCT_CORP (CORP_CODE)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


DROP TABLE IF EXISTS BUILD;
DROP TABLE IF EXISTS BUILD_REG_AND_INFO;
DROP TABLE IF EXISTS BUILD_INFO;
DROP TABLE IF EXISTS BUILD_REG;

DROP TABLE IF EXISTS CONSTRUCT_PROJECT;
DROP TABLE IF EXISTS PROJECT_INFO_REG;
DROP TABLE IF EXISTS PROJECT_JOIN_PERSON;
DROP TABLE IF EXISTS PROJECT_JOIN_CORP;
DROP TABLE IF EXISTS PROJECT_JOIN_CORP_INFO;
DROP TABLE IF EXISTS PROJECT_JOIN_REG;
DROP TABLE IF EXISTS PROJECT_REG;




CREATE TABLE BUILD
(
    BUILD_CODE bigint NOT NULL,
    INFO bigint NOT NULL,
    REG_TIME datetime NOT NULL,
    PROJECT_CODE bigint NOT NULL,
    ENABLE boolean NOT NULL,
    VERSION int NULL,
    PRIMARY KEY (BUILD_CODE)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE BUILD_INFO
(
    ID bigint NOT NULL,
    NAME varchar(32),
    STRUCTURE varchar(16) NOT NULL,
    GROUND_FLOOR_COUNT int,
    UNDER_FLOOR_COUNT int,
    HEIGHT decimal(19,2),
    _LENGTH decimal(19,2),
    ALL_AREA decimal(19,2),
    GROUND_AREA decimal(19,2),
    UNDER_AREA decimal(19,2),
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE BUILD_REG
(
    ID bigint NOT NULL,
    REG_TIME datetime,
    COUNT int NOT NULL,
    ON_AREA decimal(19,2) NOT NULL,
    UNDER_AREA decimal(19,2) NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE BUILD_REG_AND_INFO
(
    ID bigint NOT NULL,
    REG bigint NOT NULL,
    -- DELETE
    -- MODIFY
    -- CREATE
    -- QUOTED
    OPERATE varchar(6) NOT NULL COMMENT 'DELETE
MODIFY
CREATE
QUOTED',
    BUILD_INFO bigint NOT NULL,
    PREVIOUS bigint NULL,
    BUILD_CODE bigint NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE CONSTRUCT_PROJECT
(
    PROJECT_CODE bigint NOT NULL,
    ENABLE boolean NOT NULL,
    INFO bigint NOT NULL,
    CORP bigint NOT NULL,
    DEVELOPER bigint NOT NULL,
    REG_TIME datetime NOT NULL,
    BUILD bigint NOT NULL,
    PRIMARY KEY (PROJECT_CODE)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;



CREATE TABLE PROJECT_INFO_REG
(
    ID bigint NOT NULL,
    REG_TIME datetime,
    PREVIOUS bigint,
    PROPERTY varchar(6) NOT NULL,
    NAME varchar(256) NOT NULL,
    ADDRESS varchar(512) NOT NULL,
    TYPE varchar(19) NOT NULL,
    TYPE_LEVEL int,
    ALL_AREA decimal(19,2),
    BEGIN_DATE date,
    COMPLETED_DATE date,
    TENDER varchar(32),
    COSTS decimal(18,2),
    PUT_MONEY decimal(19,2),
    MAIN_PROJECT_LEVEL varchar(8) NOT NULL,
    MAIN_PROJECT_FILE varchar(32),
    MODIFY_FIT boolean NULL,
    MODIFY_WARM boolean NULL,
    MODIFY_USE boolean NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE PROJECT_JOIN_CORP
(
    JOIN_ID bigint NOT NULL,
    OUTSIDE_TEAM_FILE varchar(32),
    OUT_LEVEL boolean,
    OUT_LEVEL_FILE varchar(32),
    CORP_CODE bigint NOT NULL,
    CORP_TYPE varchar(16) NOT NULL,
    CONTACTS varchar(64),
    CONTACTS_ID varchar(32),
    TEL varchar(16),
    REG bigint NOT NULL,
    PRIMARY KEY (JOIN_ID),
    CONSTRAINT UNIQUE_CORP_PROPERTY_REG UNIQUE (CORP_CODE, CORP_TYPE, REG)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE PROJECT_JOIN_CORP_INFO
(
    NAME varchar(128) NOT NULL,
    REG_ID_TYPE varchar(16) NOT NULL,
    REG_ID_NUMBER varchar(32) NOT NULL,
    LEVEL int NOT NULL,
    JOIN_ID bigint NOT NULL,
    OWNER_ID_TYPE varchar(16) NOT NULL,
    OWNER_ID_NUMBER varchar(32),
    OWNER_NAME varchar(32),
    PRIMARY KEY (JOIN_ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE PROJECT_JOIN_PERSON
(
    JOIN_ID bigint NOT NULL,
    CORP bigint NOT NULL,
    JOIN_TYPE varchar(16) NOT NULL,
    LEVEL varchar(8),
    JOB varchar(32) NOT NULL,
    NAME varchar(64) NOT NULL,
    IDENTIFY_TYPE varchar(16) NOT NULL,
    IDENTIFY_NUMBER varchar(32) NOT NULL,
    PRIMARY KEY (JOIN_ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE PROJECT_JOIN_REG
(
    ID bigint NOT NULL,
    PREVIOUS bigint,
    REG_TIME datetime,
    TAGS varchar(1024),
    CORPS text,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE PROJECT_REG
(
    CREATE_TIME datetime NOT NULL,
    REG_TIME datetime,
    APPLY_TIME datetime,
    -- OLD
    -- OLE
    -- BIZ
    SOURCE varchar(8) NOT NULL COMMENT 'OLD
OLE
BIZ',
    STATUS varchar(8) NOT NULL,
    TAGS varchar(1024),
    PROJECT_CODE bigint NOT NULL,
    ID bigint NOT NULL,
    TYPE varchar(7) NOT NULL,
    CORP_MASTER boolean NOT NULL,
    INFO_MASTER boolean NOT NULL,
    BUILD_MASTER boolean NOT NULL,
    INFO bigint NOT NULL,
    CORP bigint NOT NULL,
    BUILD bigint NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;



/* Create Foreign Keys */

ALTER TABLE BUILD
    ADD FOREIGN KEY (INFO)
        REFERENCES BUILD_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE BUILD_REG_AND_INFO
    ADD FOREIGN KEY (BUILD_INFO)
        REFERENCES BUILD_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE BUILD_REG_AND_INFO
    ADD FOREIGN KEY (PREVIOUS)
        REFERENCES BUILD_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE BUILD_REG_AND_INFO
    ADD FOREIGN KEY (REG)
        REFERENCES BUILD_REG (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE CONSTRUCT_PROJECT
    ADD FOREIGN KEY (BUILD)
        REFERENCES BUILD_REG (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE PROJECT_REG
    ADD FOREIGN KEY (BUILD)
        REFERENCES BUILD_REG (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;

ALTER TABLE CONSTRUCT_PROJECT
    ADD FOREIGN KEY (INFO)
        REFERENCES PROJECT_INFO_REG (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE PROJECT_INFO_REG
    ADD FOREIGN KEY (PREVIOUS)
        REFERENCES PROJECT_INFO_REG (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE PROJECT_REG
    ADD FOREIGN KEY (INFO)
        REFERENCES PROJECT_INFO_REG (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE CONSTRUCT_PROJECT
    ADD FOREIGN KEY (DEVELOPER)
        REFERENCES PROJECT_JOIN_CORP (JOIN_ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE PROJECT_JOIN_CORP_INFO
    ADD FOREIGN KEY (JOIN_ID)
        REFERENCES PROJECT_JOIN_CORP (JOIN_ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE PROJECT_JOIN_PERSON
    ADD FOREIGN KEY (CORP)
        REFERENCES PROJECT_JOIN_CORP (JOIN_ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE CONSTRUCT_PROJECT
    ADD FOREIGN KEY (CORP)
        REFERENCES PROJECT_JOIN_REG (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE PROJECT_JOIN_CORP
    ADD FOREIGN KEY (REG)
        REFERENCES PROJECT_JOIN_REG (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE PROJECT_JOIN_REG
    ADD FOREIGN KEY (PREVIOUS)
        REFERENCES PROJECT_JOIN_REG (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE PROJECT_REG
    ADD FOREIGN KEY (CORP)
        REFERENCES PROJECT_JOIN_REG (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;



DROP TABLE IF EXISTS DFCI;
DROP TABLE IF EXISTS DFCC;
DROP TABLE IF EXISTS DFCT;
DROP TABLE IF EXISTS DFCL;

DROP TABLE IF EXISTS FIRE_PROJECT_BUILD;
DROP TABLE IF EXISTS FIRE_CHECK_BUILD;
DROP TABLE IF EXISTS FIRE_CHECK_FIT;
DROP TABLE IF EXISTS FIRE_CHECK_USE_CHANGE;
DROP TABLE IF EXISTS FIRE_CHECK_REPORT;
DROP TABLE IF EXISTS FIRE_CHECK_STORE_SQUARE;
DROP TABLE IF EXISTS FIRE_CHECK_STORE_TIN;
DROP TABLE IF EXISTS FIRE_CHECK_CONTENT;
DROP TABLE IF EXISTS FIRE_CHECK_SUB_ITEM;
DROP TABLE IF EXISTS FIRE_CHECK_ITEM;
DROP TABLE IF EXISTS FIRE_CHECK_TABLE;
DROP TABLE IF EXISTS FIRE_CHECK_WARM;
DROP TABLE IF EXISTS FIRE_JOIN_CORP;
DROP TABLE IF EXISTS FIRE_PROJECT;
DROP TABLE IF EXISTS FIRE_CHECK;
DROP TABLE IF EXISTS FIRE_CHECK_INFO;
DROP TABLE IF EXISTS FIRE_FILE_CHECK;



CREATE TABLE DFCC
(
    NAME varchar(32) NOT NULL,
    _ORDER int NOT NULL,
    ID bigint NOT NULL,
    TABLE_ID bigint NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE DFCI
(
    _ORDER int NOT NULL,
    NAME varchar(32) NOT NULL,
    ID bigint NOT NULL,
    ITEM_ID bigint NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE DFCL
(
    _ORDER int NOT NULL,
    NAME varchar(1024) NOT NULL,
    _REQUIRE varchar(1024),
    PARENT bigint NOT NULL,
    LEVEL int NOT NULL,
    ID bigint NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE DFCT
(
    _ORDER int NOT NULL,
    NAME varchar(32) NOT NULL,
    ID bigint NOT NULL,
    PART boolean NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


ALTER TABLE DFCI
    ADD FOREIGN KEY (ITEM_ID)
        REFERENCES DFCC (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE DFCL
    ADD FOREIGN KEY (PARENT)
        REFERENCES DFCI (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE DFCC
    ADD FOREIGN KEY (TABLE_ID)
        REFERENCES DFCT (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;



CREATE TABLE FIRE_CHECK
(
    ID bigint NOT NULL,
    STATUS varchar(11) NOT NULL,
    NO_ACCEPT_TYPE varchar(11) NULL,
    APPLY_TIME datetime NOT NULL,
    REG_TIME datetime,
    APPLY_TYPE varchar(16) NOT NULL,
    CORP_CODE bigint NOT NULL,
    OPINION text,
    MEMO varchar(1024),
    INFO bigint NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE FIRE_CHECK_BUILD
(
    ID bigint NOT NULL,
    FIRE_RATING int NOT NULL,
    DANGER int NOT NULL,
    BUILD_CODE bigint NOT NULL,
    FIRE_CHECK bigint NOT NULL,
    USE_PROPERTY varchar(16) NULL,
    OPINION text,
    PASS boolean,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE FIRE_CHECK_CONTENT
(
    ID bigint NOT NULL,
    NAME varchar(1024) NOT NULL,
    PARTS varchar(32),
    _REQUIRE varchar(1024),
    LEVEL int NOT NULL,
    QUALIFIED boolean NOT NULL,
    DESCRIPTION varchar(32),
    ITEM_ID bigint NOT NULL,
    _ORDER int NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE FIRE_CHECK_FIT
(
    ID bigint NOT NULL,
    PART varchar(64) NOT NULL,
    AREA decimal(19,2),
    LAYERS varchar(16),
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;

CREATE TABLE FIRE_CHECK_USE_CHANGE
(
    ID bigint NOT NULL,
    USE_PROPERTY varchar(16) NULL,
    OLD_USE varchar(16),
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE FIRE_CHECK_INFO
(
    PROJECT_CODE bigint NOT NULL,
    CONTACTS varchar(64),
    TEL varchar(16),
    ID bigint NOT NULL,
    IN_RANDOM boolean NOT NULL,
    CONSTRUCTION_FILE varchar(32),
    CON_FILE_DATE datetime,
    DESIGN_FILE varchar(32),
    DESIGN_FILE_DATE datetime,
    PART boolean NOT NULL,
    CONCLUSION varchar(1024),
    QUALIFIED boolean NOT NULL,
    SPECIAL boolean NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE FIRE_CHECK_ITEM
(
    ID bigint NOT NULL,
    NAME varchar(32) NOT NULL,
    _ORDER int NOT NULL,
    QUALIFIED boolean NOT NULL,
    TABLE_ID bigint NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE FIRE_CHECK_REPORT
(
    NAME varchar(32) NOT NULL,
    FILE_ID varchar(32) NOT NULL,
    MD5 varchar(32),
    UPLOAD_TIME datetime NOT NULL,
    FILE_SIZE int,
    FILE_TYPE varchar(512) NOT NULL,
    FAIL boolean NOT NULL,
    BUSINESS bigint NOT NULL,
    PRIMARY KEY (FILE_ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE FIRE_CHECK_STORE_SQUARE
(
    ID bigint NOT NULL,
    AREA decimal(19,2),
    NAME varchar(32),
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE FIRE_CHECK_STORE_TIN
(
    ID bigint NOT NULL,
    LOCATION varchar(64),
    AREA decimal(19,2),
    TYPE varchar(10) NOT NULL,
    STORE_TYPE varchar(6) NOT NULL,
    NAME varchar(32),
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE FIRE_CHECK_SUB_ITEM
(
    ITEM_ID bigint NOT NULL,
    _ORDER int NOT NULL,
    NAME varchar(32) NOT NULL,
    COUNT int,
    FULL boolean NOT NULL,
    ID bigint NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE FIRE_CHECK_TABLE
(
    NAME varchar(32) NOT NULL,
    _ORDER int NOT NULL,
    CHECK_ID bigint NOT NULL,
    ID bigint NOT NULL,
    PART boolean NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE FIRE_CHECK_WARM
(
    ID bigint NOT NULL,
    TYPE varchar(2) NOT NULL,
    LAYERS varchar(16),
    PART varchar(32),
    MATERIAL varchar(32),
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE FIRE_JOIN_CORP
(
    CORP_CODE bigint NOT NULL,
    CORP_TYPE varchar(16) NOT NULL,
    PROJECT bigint NOT NULL,
    LEVEL int NOT NULL,
    NAME varchar(128) NOT NULL,
    REG_ID_TYPE varchar(16) NOT NULL,
    REG_ID_NUMBER varchar(32) NOT NULL,
    CONTACTS varchar(64),
    CONTACTS_ID varchar(32) NULL,
    TEL varchar(16),
    OWNER_ID_NUMBER varchar(32),
    OWNER_ID_TYPE varchar(16) NOT NULL,
    OWNER_NAME varchar(32) NOT NULL,
    PRIMARY KEY (CORP_CODE, CORP_TYPE, PROJECT)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE FIRE_PROJECT
(
    ID bigint NOT NULL,
    NAME varchar(256) NOT NULL,
    ADDRESS varchar(512),
    PROPERTY varchar(6),
    TYPE varchar(19) NOT NULL,
    ALL_AREA decimal(19,2),
    AREA decimal(19,2),
    PUT_MONEY decimal(19,2),
    MAIN_PROJECT_LEVEL varchar(8) NOT NULL,
    CORPS text,
    TAGS varchar(1024),
    MODIFY_FIT boolean,
    MODIFY_WARM boolean,
    MODIFY_USE boolean,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE FIRE_PROJECT_BUILD
(
    ID bigint NOT NULL,
    NAME varchar(32) NOT NULL,
    STRUCTURE varchar(16) NOT NULL,
    GROUND_FLOOR_COUNT int,
    UNDER_FLOOR_COUNT int,
    HEIGHT decimal(19,2),
    _LENGTH decimal(19,2),
    ALL_AREA decimal(19,2),
    GROUND_AREA decimal(19,2),
    UNDER_AREA decimal(19,2),
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;


CREATE TABLE FIRE_FILE_CHECK
(
    ID bigint NOT NULL,
    PASS boolean NOT NULL,
    NAME varchar(64) NOT NULL,
    BUSINESS bigint NOT NULL,
    PRIMARY KEY (ID)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;

/* Create Foreign Keys */


ALTER TABLE FIRE_CHECK_REPORT
    ADD FOREIGN KEY (BUSINESS)
        REFERENCES FIRE_CHECK (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE FIRE_PROJECT_BUILD
    ADD FOREIGN KEY (ID)
        REFERENCES FIRE_CHECK_BUILD (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE FIRE_CHECK
    ADD FOREIGN KEY (INFO)
        REFERENCES FIRE_CHECK_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE FIRE_CHECK_BUILD
    ADD FOREIGN KEY (FIRE_CHECK)
        REFERENCES FIRE_CHECK_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE FIRE_CHECK_FIT
    ADD FOREIGN KEY (ID)
        REFERENCES FIRE_CHECK_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;

ALTER TABLE FIRE_CHECK_USE_CHANGE
    ADD FOREIGN KEY (ID)
        REFERENCES FIRE_CHECK_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE FIRE_CHECK_STORE_SQUARE
    ADD FOREIGN KEY (ID)
        REFERENCES FIRE_CHECK_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE FIRE_CHECK_STORE_TIN
    ADD FOREIGN KEY (ID)
        REFERENCES FIRE_CHECK_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE FIRE_CHECK_TABLE
    ADD FOREIGN KEY (CHECK_ID)
        REFERENCES FIRE_CHECK_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE FIRE_CHECK_WARM
    ADD FOREIGN KEY (ID)
        REFERENCES FIRE_CHECK_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE FIRE_PROJECT
    ADD FOREIGN KEY (ID)
        REFERENCES FIRE_CHECK_INFO (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE FIRE_CHECK_SUB_ITEM
    ADD FOREIGN KEY (ITEM_ID)
        REFERENCES FIRE_CHECK_ITEM (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE FIRE_CHECK_CONTENT
    ADD FOREIGN KEY (ITEM_ID)
        REFERENCES FIRE_CHECK_SUB_ITEM (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE FIRE_CHECK_ITEM
    ADD FOREIGN KEY (TABLE_ID)
        REFERENCES FIRE_CHECK_TABLE (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE FIRE_JOIN_CORP
    ADD FOREIGN KEY (PROJECT)
        REFERENCES FIRE_PROJECT (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;

ALTER TABLE FIRE_FILE_CHECK
    ADD FOREIGN KEY (BUSINESS)
        REFERENCES FIRE_CHECK (ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;



DROP DATABASE IF EXISTS CMS;
CREATE DATABASE CMS;

USE CMS;


/* Drop Tables */

DROP TABLE IF EXISTS document;
DROP TABLE IF EXISTS image;
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS category;
/* Create Tables */

DROP TABLE IF EXISTS WORKER_NODE;
CREATE TABLE WORKER_NODE
(
    ID BIGINT NOT NULL AUTO_INCREMENT COMMENT 'auto increment id',
    HOST_NAME VARCHAR(64) NOT NULL COMMENT 'host name',
    PORT VARCHAR(64) NOT NULL COMMENT 'port',
    TYPE INT NOT NULL COMMENT 'node type: CONTAINER(1), ACTUAL(2), FAKE(3)',
    LAUNCH_DATE DATE NOT NULL COMMENT 'launch date',
    MODIFIED TIMESTAMP NOT NULL COMMENT 'modified time',
    CREATED TIMESTAMP NOT NULL COMMENT 'created time',
    PRIMARY KEY(ID)
)
    COMMENT='DB WorkerID Assigner for UID Generator',ENGINE = INNODB;

CREATE TABLE article
(
    id bigint NOT NULL,
    thumbnail varchar(32),
    content text,
    summary varchar(1024),
    title varchar(256) NOT NULL,
    sub_title varchar(512),
    tags varchar(512),
    time timestamp NOT NULL,
    category_id bigint NOT NULL,
    mime_type varchar(512) NOT NULL,
    doc_summary text,
    PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;



CREATE TABLE category
(
    id bigint NOT NULL,
    name varchar(16) NOT NULL,
    description varchar(64),
    parent_id bigint,
    _order int NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;






CREATE TABLE document
(
    id bigint NOT NULL,
    md5 varchar(32),
    mime_type varchar(512),
    size int,
    ext varchar(16),
    content varchar(32) NOT NULL,
    article_id bigint NOT NULL,
    name varchar(32) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;




CREATE TABLE image
(
    id bigint NOT NULL,
    content varchar(32) NOT NULL,
    article_id bigint NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8;




/* Create Foreign Keys */

ALTER TABLE document
    ADD FOREIGN KEY (article_id)
        REFERENCES article (id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE image
    ADD FOREIGN KEY (article_id)
        REFERENCES article (id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE article
    ADD FOREIGN KEY (category_id)
        REFERENCES category (id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE category
    ADD FOREIGN KEY (parent_id)
        REFERENCES category (id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;

SET SESSION FOREIGN_KEY_CHECKS=1;


USE CMS;

INSERT INTO category(id,name,description,_order) values(1,'新闻动态','实时资讯,新闻动态.',1);
INSERT INTO category(id,name,description,_order) values(2,'政务公开','相关法规文件,配套制度.',2);


INSERT INTO category(id,name,parent_id,_order) values(11,'通知公告',1,1);
INSERT INTO category(id,name,parent_id,_order) values(12,'建设要闻',1,2);
INSERT INTO category(id,name,parent_id,_order) values(13,'政府信息',1,3);
INSERT INTO category(id,name,parent_id,_order) values(14,'行业动态',1,4);


INSERT INTO category(id,name,parent_id,_order) values(21,'办事指南',2,1);
INSERT INTO category(id,name,parent_id,_order) values(22,'政策法规',2,2);
INSERT INTO category(id,name,parent_id,_order) values(23,'标准规范',2,3);
INSERT INTO category(id,name,parent_id,_order) values(24,'信息公示',2,4);


insert into article(    id ,mime_type,
                        time,
                        content ,

                        title ,

                        category_id ,

                        summary
) values (1,'text/html','2020-05-28','        <p style="text-align: center"><strong>全国人大代表、江西省住房和城乡建设厅厅长卢天锡谈“棚改”与消防审验管理</strong></p>
        <p class="pbj">　　</p><p>　　“人大代表的职责就是反映人民关切、建言国计民生。所以今年我带来的建议主要集中在自己从事的住房和城乡建设领域，有的是为应对新冠肺炎疫情带来经济下行压力、加大民生投入的建议，有的是为加强机构改革后职责管理和工作保障的建议。”全国人大代表、江西省住房和城乡建设厅厅长、民进江西省委会副主委卢天锡在接受《中国建设报》采访时这样说道。诚如卢天锡所言，今年两会，他一共带着4份建议赴京。其中，“关于保持棚户区改造政策稳定的建议”“关于加强建设工程消防设计审查和验收管理能力建设的建议”两份建议分别聚焦民生改善和行业发展。</p>
        <p style="text-align: center"><strong>“棚改”政策宜稳定</strong></p>
        <p>　　2008年以来，我国先后实施了多轮大规模棚户区改造，为改善困难群众住房条件、缓解城市内部二元矛盾、提升城镇综合承载力、促进经济增长与社会和谐发挥了重要作用。截至2019年年底，全国累计开工各类棚户区改造安置住房4838万套，帮助1亿多户棚户区居民“出棚进楼”。江西省更是近两年的“棚改大户”：2019年江西省棚户区改造开工29.3万套，列全国第一；2020年将开工改造棚户区20.42万套，继续列全国第一，截至4月底，已开工8.65万套，占目标任务的42.4%。目前，江西省累计改造棚户区194.4万户，完成投资5551亿元，500万人的住房条件得到改善。卢天锡告诉记者，棚户区改造既是重大民生工程，也是重要发展工程，但因当前国家支持的政策不明朗、力度在下降等原因，多地在推动棚户区改造工作时都遇到了一些共性问题。</p>
        <p>　　“一是改造存量较多，目前仍有不少群众居住在棚户区，群众改造意愿强烈。二是改造难度较大，现存的棚户区项目多是房屋密度大、改造成本高、权属复杂、难以实现资金平衡的‘硬骨头’项目。”卢天锡表示，资金压力较大也是突出问题。2019年以来，国家在逐步收紧棚户区改造政策，中央补助资金大幅减少。今年年初，财政部印发通知，将2019年提前下达的中央财政城镇保障性安居工程补助资金预算由500亿元调整为200亿元。其中，江西省补助资金就减少20.3亿元，减少近56%。</p>
        <p>　　卢天锡认为，推动棚户区改造首先应保持中央财政支持政策稳定，他建议继续将棚户区改造作为民生工程持续稳步推进，并延续历年做法，不降低中央财政对棚户区改造资金的补助水平。同时，保持金融支持政策稳定，建议按照风险可控、市场化可持续方式，鼓励金融机构积极支持棚户区改造，增加棚户区改造信贷资金安排，向符合条件的棚户区改造项目提供贷款。卢天锡还建议给予棚户区改造专项债券倾斜支持，将其纳入政府专项债券重点支持领域，允许棚户区改造专项债券用于项目资本金。</p>
        <p style="text-align: center"><strong>消防审验需破解“两缺一超”难题</strong></p>
        <p>　　从民生角度而言，“住”与“建”两个字有着特殊意义。“住”与百姓生活相关，宜居是最终目标；“建”与人民权益相关，安全是基本底线。</p>
        <p>　　谈及提交的“关于加强建设工程消防设计审查和验收管理能力建设的建议”，卢天锡表示，建设工程消防设计审查和验收是加强建设工程火灾源头管控、保证建筑安全的重要手段，对提高建设工程消防安全水平、降低建设工程火灾隐患发挥了重要作用。</p>
        <p>　　住房和城乡建设部门承接建设工程消防设计审查和验收管理职责后，对于理顺建设工程消防设计审查和验收管理制度、加强建设工程消防质量全链条管控、转变政府职能、优化营商环境具有重要意义。但每一次改革，势必要经历一个阶段的“适配期”。卢天锡分析认为，建设工程消防设计审查和验收工作专业性强，职责移交又未明确相应机构、编制和经费保障，不少地方承接过程中显得力不从心，面临巨大压力，长此以往容易导致行业监管缺失，在源头上留下大量的先天性火灾隐患。</p>
        <p>　　卢天锡的担心来源于基层调研。他表示，问题主要表现为“两缺一超”。“两缺”之一便是缺少专业消防审验人员。以江西省为例，职责移交前，消防救援机构从事消防设计审查验收的专兼职人员不少于300人，而住房和城乡建设部门既没有专门的工作机构和编制，也没有从事消防设计审查验收工作的专业技术人员。另一“缺”指的则是缺少经费保障。职责移交前，消防救援机构人员经费由中央财政拨付，工作经费由地方财政承担。职责移交后，住房和城乡建设部门的工作经费并没有增加。而且根据最新出台的《消防法》和《建设工程消防设计审查验收管理暂行规定》，消防设计图纸技术审查、消防设施检测等工作由具备相应能力的第三方技术服务机构承担，必须支付服务费用。除了“两缺”，“一超”的问题也亟待解决。卢天锡表示，消防设计审查和验收建设工程涉及化工、能源等众多行业，远远超出住房和城乡建设部门原监管的房屋建筑工程和市政基础设施范围。</p>
        <p>　　为此，卢天锡建议应对建设工程消防设计审查验收和管理机构作出硬性规定，提出明确要求，保障省、市、县住房和城乡建设部门有专门机构负责此项工作，并根据各地实际任务量，合理安排专项编制。与此同时，还应设立专项经费，对建设工程消防设计审查和验收管理工作给予必要的财政经费保障。</p>
        <p>　　“人才培养也很重要。应该进一步加强业务培训，不断提升建设工程消防设计审查和验收管理能力水平。”卢天锡表示，国家层面可以出台政策措施，鼓励建设类院校开设消防工程专业，持续培养创新型、复合型高级消防工程专业人才。通过系列组合拳，从而确保建设工程消防设计审查和验收工作“有人接、接得住、做得好”。</p>
        <p style="text-align: right">摘自　《中国建设报》　2020.05.28　记者　刘帝</p><p></p>',
          '完善顶层设计 加强投入保障',13,'人大代表的职责就是反映人民关切、建言国计民生。所以今年我带来的建议主要集中在自己从事的住房和城乡建设领域，有的是为应对新冠肺炎疫情带来经济下行压力、加大民生投入的建议，有的是为加强机构改革后职责管理和工作保障的建议。”全国人大代表、江西省住房和城乡建设厅厅长、民进江西省委会副主委卢天锡在接受《中国建设报》采访时这样说道。诚如卢天锡所言，今年两会，他一共带着4份建议赴京。其中，“关于保持棚户区改造政策稳定的建议”“关于加强建设工程消防设计审查和验收管理能力建设的建议”两份建议分别聚焦民生改善和行业发展。');

insert into article(     id ,time,mime_type,

                         content ,

                         title ,

                         category_id ,

                         summary  ) values (2,'2020-05-13','text/html','<p class="pbj">　　</p><p>　　4月1日，住房和城乡建设部发布《建设工程消防设计审查验收管理暂行规定》（中华人民共和国住房和城乡建设部令第51号，以下简称《暂行规定》）并提出，《暂行规定》将于2020年6月1日起正式施行。为指导督促各地依法依规做好建设工程消防设计审查验收工作，近日，住房和城乡建设部举办了面向全国各级住房和城乡建设主管部门的视频宣贯培训会。</p>
        <p>　　《暂行规定》是住房和城乡建设部门承接建设工程消防设计审查验收职责以来出台的第一部部门规章，是贯彻《消防法》及落实党中央、国务院关于深化“放管服”改革、优化营商环境相关法规政策的重要举措，也是各级住房和城乡建设主管部门履行相关职责的重要依据。制定和实施《暂行规定》，标志着住房和城乡建设系统在依法有序推进建设工程消防设计审查验收工作中迈出了重要一步。</p>
        <p>　　在此次宣贯培训中，有关部门详细解读了《暂行规定》中关于建设工程消防设计审查验收相关单位的质量责任与义务的具体内容；深入阐述了国家工程建设消防技术标准的框架体系以及强制性和非强制性条款的执行要求；着重强调了严格规范特殊消防设计管理，减少自由裁量权的必要性和操作性；系统讲解了特殊建设工程消防设计审查和消防验收、特殊消防设计专家论证以及其他建设工程消防的消防设计、备案和抽查工作的具体内容、流程和监管方式等内容。</p>
        <p>　　宣贯培训还针对在《暂行规定》制定过程中各地反馈的意见建议和实际工作中遇到的重点、难点问题进行了集中答疑，解答了包括相关从业机构和人员管理的手段和方法、特殊消防设计专家评审组织的具体规定和要求以及《暂行规定》部分具体条款界定的范围和内涵等各地普遍关心的问题，为稳步推进工作指明了方向。</p>
        <p>　　各级住房和城乡建设主管部门高度重视此次宣贯培训工作，认真组织本单位相关人员集中认真学习，大部分省（自治区、直辖市）还向辖区各级住房和城乡建设主管部门及相关单位同步转播。据统计，全国共有7800余人同时在线收听收看了《暂行规定》的宣贯培训视频。各地普遍认为，此次对《暂行规定》的宣贯培训，是各地抓好政策落实的基础性工作，有助于他们充分认识强化建设工程消防设计和施工质量的工作目标，有助于正确理解公开透明、规范有序的工作原则，有助于熟悉掌握优化调整工作模式的具体方法和要求，有助于提高建设工程消防设计审查验收管理水平。</p>
        <p style="text-align: right">摘自　《中国建设报》　2020.05.13　部宣</p><p></p>',
                                            '住房和城乡建设部开展《建设工程消防设计审查验收管理暂行规定》宣贯培训',13,'4月1日，住房和城乡建设部发布《建设工程消防设计审查验收管理暂行规定》（中华人民共和国住房和城乡建设部令第51号，以下简称《暂行规定》）并提出，《暂行规定》将于2020年6月1日起正式施行。为指导督促各地依法依规做好建设工程消防设计审查验收工作，近日，住房和城乡建设部举办了面向全国各级住房和城乡建设主管部门的视频宣贯培训会。');

insert into article(    id ,time,mime_type,

                        content ,

                        title ,

                        category_id ,

                        summary  ) values (3,'2019-11-28','text/html','<p class="pbj">　　</p><p>　　建设工程消防设计审查验收工作事关人民群众生命财产安全，责任重大；压缩建设工程消防设计审查验收流程有助于优化营商环境，使命光荣。</p>
        <p>　　2019年3月27日，住房和城乡建设部会同应急管理部联合印发《关于做好移交承接建设工程消防设计审查验收工作的通知》，住房和城乡建设部以“有人接、接得住、做得好”为原则，持续指导各地住房和城乡建设部门做好建设工程消防设计审查设计职责承接工作，确保各项工作平稳过渡、有序开展。目前，各地住房和城乡建设部门已经全面承担建设工程消防设计审查验收职责。</p>
        <p>　　同时，住房和城乡建设部结合深化工程建设项目审批制度改革和优化营商环境，针对建设工程消防设计审查验收周期长的问题，推动建设工程消防设计审查验收纳入建设工程联审联验，指导地方进一步优化审批流程，完善政策措施，真正出实招，做好建设工程消防审查验收工作。</p>
        <p style="text-align: center"><strong>落实机构人员 确保无缝衔接</strong></p>
        <p>　　建设工程消防设计审查验收是党和国家机构改革明确交给住房和城乡建设部门的重要职责，是住房和城乡建设部门必须承担的责任。</p>
        <p>　　住房和城乡建设部高度重视移交承接工作，要求各省级住房和城乡建设主管部门主要负责人切实负起责任，明确职责承接机构，落实工作人员，今年6月30日前全部完成移交承接工作。</p>
        <p>　　住房和城乡建设部要求各省级住房和城乡建设主管部门定期汇报各项工作进度，据最新统计，目前全国已有北京、天津、重庆、陕西、吉林、福建、云南、贵州、新疆、河南、江苏、广西、湖北13个省（区、市）的住房和城乡建设主管部门设立了从事建设工程消防设计审查验收工作的独立处室，共配备人员编制近200个；全国共有83个城市设立了从事建设工程消防设计审查验收工作的独立科（处）室，共配备人员编制近500个；全国共有372个县城（含县级市、县、市辖区）设立了专门负责建设工程消防设计审查验收工作的科（股）室，共配备人员编制近700个。特别是2019年9月以来，全国推广陕西落实机构和人员的经验后，各地进展明显。</p>
        <p>　　有人接，还要确保接得住。机构和人员落实后，住房和城乡建设部及时组织开展专业培训，以保证工作人员掌握做好建设工程消防设计审查验收工作必备的法律法规和标准规范知识，熟悉工作流程和操作程序，满足建设工程消防设计审查验收工作需要。</p>
        <p>　　截至目前，住房和城乡建设部已集中举办4期“建设工程消防设计审查验收备案抽查培训班”，对31个省（自治区、直辖市）和新疆生产建设兵团以及294个地级市住房和城乡建设主管部门从事建设工程消防设计审查验收备案抽查的400余名学员进行培训；组织召开4次全国住房和城乡建设主管部门工作会，及时交流经验。同时，各省（区、市）住房和城乡建设主管部门共举办专业培训76次，培训人数累计超过1.3万人次。</p>
        <p>　　在移交承接过程中，住房和城乡建设部多次赴各省调研建设工程消防设计审查验收工作的进展情况，就工作的总体进展、存在问题和解决方案同各省级住房和城乡建设主管部门以及相关城市的负责人进行座谈，并就相关事项征求企业意见。</p>
        <p style="text-align: center"><strong>推动联审联验 优化营商环境</strong></p>
        <p>　　自正式承接建设工程消防设计审查验收职责以来，住房和城乡建设部坚持以习近平新时代中国特色社会主义思想为指导，贯彻落实党中央、国务院机构改革部署要求，深化“放管服”改革，优化营商环境，重点解决建设工程消防设计审查验收周期长的问题。</p>
        <p>　　首先，在《消防法》修订时取消了消防设计备案抽查。住房和城乡建设部积极参与《消防法》修订工作。修订后的《消防法》已于4月23日颁布实施，规定除特殊建设工程外，取消其他建设工程的消防设计备案抽查，强调建设单位申领施工许可证或者申请批准开工报告时应当提供满足施工需要的消防设计图纸及技术资料。</p>
        <p>　　其次，推动建设工程消防设计审查验收纳入建设工程联审联验。住房和城乡建设部贯彻落实国务院工程建设审批制度改革要求，推动建设工程消防设计审查的技术审查内容纳入施工图联审，消防设计审查许可可以与施工许可一同办理。同时，鼓励将消防验收纳入竣工联合验收并限时办理。</p>
        <p>　　再其次，起草制定《建设工程消防设计审查验收管理规定》。在前期充分调研的基础上，住房和城乡建设部起草形成了规定并面向社会公开征求意见。目前，规定正在修改完善中。</p>
        <p>　　最后，指导北京、上海切实解决好相关问题。目前，北京市已经将建设工程消防设计技术审查并入施工图联审，由审查机构完成技术审查后出具《综合审查意见告知书》，不再单独出具相关文书，提高审查效率，确定审查时限为15个工作日。北京市住房和城乡建设委员会印发《关于开展建设工程消防验收、备案及抽查有关工作的通知》，明确消防验收的办结时限为7个工作日。上海市立足于服务企业，按照“一事一议”原则，加快处理已经通过验收的单位出具验收合格意见书的遗留项目，同时，正在考虑建设消防审验信息系统，压缩行政审批时间。</p>
        <p>　　下一步，住房和城乡建设部还将积极探索将消防审查验收与现有建设工程管理体系有机衔接的方式方法，进一步做好相关制度、标准规范的顶层设计，确保“全面接，不出事”，切实做好建设工程消防审查验收工作。</p>
        <p style="text-align: right">摘自　《中国建设报》　2019.11.28　记者　林培<br>
        &nbsp;</p><p></p>',
                                           '接得住更要做得好——住房和城乡建设部解决建设工程消防设计审查验收周期长问题出实招',13,'2019年3月27日，住房和城乡建设部会同应急管理部联合印发《关于做好移交承接建设工程消防设计审查验收工作的通知》，住房和城乡建设部以“有人接、接得住、做得好”为原则，持续指导各地住房和城乡建设部门做好建设工程消防设计审查设计职责承接工作，确保各项工作平稳过渡、有序开展。目前，各地住房和城乡建设部门已经全面承担建设工程消防设计审查验收职责。');

insert into article(     id ,time,mime_type,

                         content ,

                         title ,

                         category_id ,

                         summary  ) values (4,'2019-5-23','text/html','<p class="pbj">　　</p><p>　　近日，住房和城乡建设部副部长黄艳带队到应急管理部沟通协商建设工程消防设计审查验收职责移交承接工作。应急管理部副部长尚勇、消防救援局副局长琼色以及有关人员参加了座谈。</p>
        <p>　　座谈会上，住房和城乡建设部与应急管理部分别通报了4月1日以来建设工程消防设计审查验收职责移交承接有关情况，对职责移交过程中需要协调解决的具体问题进行了深入座谈交流，并就建设工程消防设计审查验收职责移交工作明确：</p>
        <p>　　一是落实两部联合下发的《关于做好移交承接建设工程消防设计审查验收工作的通知》，过渡期内，住房和城乡建设部门抓紧做好承接工作，消防救援机构可以提供技术和人员支持。</p>
        <p>　　二是移交承接工作于6月30日完成后，各地根据工作实际，消防救援机构可以提供培训等技术支持。</p>
        <p>　　三是督促地方政府做好组织协调工作，根据中央改革决策部署做好建设工程消防设计审查验收职责移交承接工作。</p>
        <p>　　四是住房和城乡建设部与应急管理部加强沟通协调，研究移交承接过渡中遇到的问题，指导移交承接工作有序推进。</p>
        <p style="text-align: right">摘自　《中国建设报》　2019.05.23　部宣</p><p></p>',
                                            '住房和城乡建设部应急管理部研究协商建设工程消防设计审查验收移交承接工作',13,'近日，住房和城乡建设部副部长黄艳带队到应急管理部沟通协商建设工程消防设计审查验收职责移交承接工作。应急管理部副部长尚勇、消防救援局副局长琼色以及有关人员参加了座谈。');
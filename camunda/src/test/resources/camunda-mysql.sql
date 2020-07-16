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

package cc.coopersoft.construct.fire.common;

public enum EnumData {
    ENUM_DATA_1("GroupIdType","COMPANY_CODE", "营业执照"),
    ENUM_DATA_2("GroupIdType","CORP_CODE", "机构代码证"),
    ENUM_DATA_3("GroupIdType","RELIGION", "宗教证"),

    ENUM_DATA_4("PersonIdType","MASTER_ID", "身份证"),
    ENUM_DATA_5("PersonIdType","OFFICER_CARD", "军官证"),
    ENUM_DATA_6("PersonIdType","SOLDIER_CARD", "士兵证"),
    ENUM_DATA_7("PersonIdType","PASSPORT", "护照"),
    ENUM_DATA_8("PersonIdType","TW_ID", "台湾通行证"),
    ENUM_DATA_9("PersonIdType","GA_ID", "港澳通行证"),


    ENUM_DATA_10("JoinType","Developer", "开发单位"),
    ENUM_DATA_11("JoinType","Design", "设计单位"),
    ENUM_DATA_12("JoinType","Construct", "施工单位"),
    ENUM_DATA_13("JoinType","Supervisor", "工程监理"),
    ENUM_DATA_14("JoinType","FireCheck", "消防质检"),
    ENUM_DATA_15("JoinType","LandExploration", "土地勘查"),


    ENUM_DATA_16("RegSource","Import", "数据整理"),
    ENUM_DATA_17("RegSource","Patch", "补录"),
    ENUM_DATA_18("RegSource","Inside", "备案业务"),
    ENUM_DATA_19("RegSource","Outside", "备案申请"),


    ENUM_DATA_20("RegStatus","Prepare", "准备中"),
    ENUM_DATA_21("RegStatus","Abort", "终止"),
    ENUM_DATA_22("RegStatus","Running", "运行中"),
    ENUM_DATA_23("RegStatus","Register", "已备案"),
    ENUM_DATA_24("RegStatus","Invalid", "无效"),


    ENUM_DATA_25("OperateType","DELETE", "土地勘查"),
    ENUM_DATA_26("OperateType","MODIFY", "数据整理"),
    ENUM_DATA_27("OperateType","CREATE", "补录"),
    ENUM_DATA_28("OperateType","QUOTED", "备案业务"),


    ENUM_DATA_30("FLoorType","SINGLE", "单层"),
    ENUM_DATA_31("FLoorType","MULTI", "多层"),
    ENUM_DATA_32("FLoorType","HEIGHT", "高层"),




    ENUM_DATA_33("ProjectProperty","NEW", "新建"),
    ENUM_DATA_34("ProjectProperty","MODIFY", "改建"),
    ENUM_DATA_35("ProjectProperty","BIG", "扩建"),
    ENUM_DATA_36("ProjectProperty","MOVE", "迁建"),
    ENUM_DATA_37("ProjectProperty","TEMP", "临建"),

    ENUM_DATA_38("ProjectModifyType","FIT_UP", "装修"),
    ENUM_DATA_39("ProjectModifyType","INSULATED", "建筑保温"),
    ENUM_DATA_40("ProjectModifyType","CHANGE", "改变用途"),


    ENUM_DATA_41("ImportantType","NORMAL", "非重点项目"),
    ENUM_DATA_42("ImportantType","COUNTY", "国家级重点项目"),
    ENUM_DATA_43("ImportantType","PROVINCE", "省级重点项目"),
    ENUM_DATA_44("ImportantType","CITY", "市级重点项目"),

    ENUM_DATA_50("ProjectStruct","WOOD", "木结构"),
    ENUM_DATA_51("ProjectStruct","MASONRY", "砌体结构"),
    ENUM_DATA_52("ProjectStruct","CONCRETE", "钢筋混凝土结构"),
    ENUM_DATA_53("ProjectStruct","STEEL", "钢结构"),
    ENUM_DATA_54("ProjectStruct","STEEL_CONCRETE", "钢-混凝土混合结构"),
    ENUM_DATA_55("ProjectStruct","BRICK", "砖混结构"),
    ENUM_DATA_56("ProjectStruct","BRICK_WOOD", "砖木结构"),

//    ENUM_DATA_60("ProjectTypeClass","CIVIL", "民用建筑"),
//    ENUM_DATA_61("ProjectTypeClass","INDUSTRY", "工业建筑"),
//    ENUM_DATA_62("ProjectTypeClass","PEOPLE", "人防工程"),
//    ENUM_DATA_63("ProjectTypeClass","BOILER", "锅炉房"),
//    ENUM_DATA_64("ProjectTypeClass","APPENDAGE", "构筑物"),

    ENUM_DATA_65("IDeveloper","1", "一级"),
    ENUM_DATA_66("IDeveloper","2", "二级"),
    ENUM_DATA_67("IDeveloper","3", "三级"),
    ENUM_DATA_68("IDeveloper","4", "四级"),

    ENUM_DATA_70("IDesign","1", "甲级"),
    ENUM_DATA_71("IDesign","2", "乙级"),
    ENUM_DATA_72("IDesign","3", "丙级"),

    ENUM_DATA_73("IConstruct","0", "特级"),
    ENUM_DATA_74("IConstruct","1", "甲级"),
    ENUM_DATA_75("IConstruct","2", "乙级"),
    ENUM_DATA_76("IConstruct","3", "丙级"),

    ENUM_DATA_78("ISupervisor","1", "甲级"),
    ENUM_DATA_79("ISupervisor","2", "乙级"),
    ENUM_DATA_80("ISupervisor","3", "丙级"),

    ENUM_DATA_83("ILandExploration","1", "甲级"),
    ENUM_DATA_81("ILandExploration","2", "乙级"),
    ENUM_DATA_82("ILandExploration","3", "丙级"),

    ENUM_DATA_84("IFireCheck","1", "甲级"),
    ENUM_DATA_85("IFireCheck","2", "乙级"),
    ENUM_DATA_86("IFireCheck","3", "丙级"),


    ENUM_DATA_90("ProjectType","CIVIL_COMMON", "公用建筑"),
    ENUM_DATA_91("ProjectType","CIVIL_HOUSE", "住宅"),
    ENUM_DATA_92("ProjectType","CIVIL_OTHER", "特殊建筑"),
    ENUM_DATA_93("ProjectType","INDUSTRY", "工业建筑"),
    ENUM_DATA_94("ProjectType","BOILER", "锅炉房"),
    ENUM_DATA_95("ProjectType","PEOPLE", "人防工程"),
    ENUM_DATA_96("ProjectType","APPENDAGE_CHIMNEY_1", "砼烟囱"),
    ENUM_DATA_97("ProjectType","APPENDAGE_CHIMNEY_2", "砖烟囱"),
    ENUM_DATA_98("ProjectType","APPENDAGE_TOWER", "水塔"),
    ENUM_DATA_99("ProjectType","APPENDAGE_STORE", "贮仓"),
    ENUM_DATA_100("ProjectType","APPENDAGE_WATER", "贮池"),
    ENUM_DATA_101("ProjectType","APPENDAGE_OTHER", "其它"),

    ENUM_DATA_102("Rating","1", "一级"),
    ENUM_DATA_103("Rating","2", "二级"),
    ENUM_DATA_104("Rating","3", "三级"),
    ENUM_DATA_105("Rating","4", "四级"),


    ENUM_DATA_106("Danger","1", "甲"),
    ENUM_DATA_107("Danger","2", "乙"),
    ENUM_DATA_108("Danger","3", "丙"),
    ENUM_DATA_109("Danger","4", "丁"),
    ENUM_DATA_11A("Danger","4", "戊"),

    ENUM_DATA_120("TinType","OUTSIDE", "浮顶罐 - 外"),
    ENUM_DATA_121("TinType","INSIDE", "浮顶罐 - 内"),
    ENUM_DATA_122("TinType","FIX", "固定顶罐"),
    ENUM_DATA_123("TinType","HORIZONTAL", "卧式罐"),
    ENUM_DATA_124("TinType","WATER", "球形罐 - 液体"),
    ENUM_DATA_125("TinType","GAS", "球形罐 - 气体"),
    ENUM_DATA_126("TinType","DRY", "可燃气体储罐 - 干式"),
    ENUM_DATA_127("TinType","WET", "可燃气体储罐 - 湿式"),
    ENUM_DATA_128("TinType","OTHER", "其它"),

    ENUM_DATA_130("Layout","ON", "地上"),
    ENUM_DATA_131("Layout","HALF", "半地下"),
    ENUM_DATA_132("Layout","UNDER", "地下"),

    ENUM_DATA_133("WarmType","A", "A"),
    ENUM_DATA_134("WarmType","B1", "B1"),
    ENUM_DATA_135("WarmType","B2", "B2"),

    ENUM_DATA_136("UseProperty","FULL", "人员密集场所"),
    ENUM_DATA_137("UseProperty","PUB", "公众聚集场所"),
    ENUM_DATA_138("UseProperty","DAN", "易燃易爆场所"),

    ENUM_DATA_140("PART","CELL", "顶棚"),
    ENUM_DATA_141("PART","WALL", "墙面"),
    ENUM_DATA_142("PART","FLOOR", "地面"),
    ENUM_DATA_143("PART","PARTITION", "隔断"),
    ENUM_DATA_144("PART","FIXED", "固定家具"),
    ENUM_DATA_145("PART","FABRIC", "装饰织物"),
    ENUM_DATA_146("PART","OTHER", "其他");


    private String code;
    private String desc;
    private String type;

    private EnumData(String type,String code, String desc) {
        this.code = code;
        this.desc = desc;
        this.type =type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }
    public String getDesc() {
        return desc;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }

}

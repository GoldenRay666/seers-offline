.class public Lcom/taomee/pwdlogin/common/GlobalVars;
.super Ljava/lang/Object;
.source "GlobalVars.java"


# static fields
.field public static final ACCOUNT_MANAGER_URL:Ljava/lang/String; = "http://maccount.61.com/"

.field public static final ERR_NET_CODE:I = 0x3e9

.field public static final ERR_NET_INFO:Ljava/lang/String; = "\u7f51\u7edc\u4e0d\u7ed9\u529b\uff0c\u8bf7\u518d\u8bd5\u4e00\u6b21"

.field public static final IMAGE_TYPE:Ljava/lang/String; = "1"

.field public static final KEY:Ljava/lang/String; = "21ee5e1d8bf781576754be709301ffe9"

.field public static final LOGIN_SERVICE:Ljava/lang/String; = "1012"

.field public static LOGIN_URL:Ljava/lang/String; = null

.field public static final LOGIN_URL_RELEASE:Ljava/lang/String; = "http://maccount-httpd.61.com/account_service.php"

.field public static final LOGIN_URL_TEST:Ljava/lang/String; = "http://10.1.1.27/ammy_project/new_wire/account_service.php"

.field public static final MODIFY_PWD_SERVICE:Ljava/lang/String; = "1002"

.field public static final REG_SERVICE:Ljava/lang/String; = "1003"

.field public static final SIGN_TYPE:Ljava/lang/String; = "MD5"

.field public static final TAG:Ljava/lang/String; = "MobileLogin"

.field public static final UDID_TYPE_CUSTOM:I = 0x5

.field public static final UDID_TYPE_EMAIL:I = 0x0

.field public static final UDID_TYPE_PHONE:I = 0x7

.field public static final UDID_TYPE_TAOMEEID:I = 0xff


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 8
    const-string v0, "http://maccount-httpd.61.com/account_service.php"

    sput-object v0, Lcom/taomee/pwdlogin/common/GlobalVars;->LOGIN_URL:Ljava/lang/String;

    .line 3
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

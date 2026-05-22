.class public Lorg/cocos2dx/plugin/LoginWrapper;
.super Ljava/lang/Object;
.source "LoginWrapper.java"


# static fields
.field public static final LOGIN_CANCEL:I = 0x2

.field public static final LOGIN_CANCEL_STRING:Ljava/lang/String; = "\u53d6\u6d88\u767b\u5f55"

.field public static final LOGIN_FAIL:I = 0x1

.field public static final LOGIN_FAIL_STRING:Ljava/lang/String; = "\u767b\u5f55\u5931\u8d25"

.field public static final LOGIN_NET_ERROR:I = 0x4

.field public static final LOGIN_NET_ERROR_STRING:Ljava/lang/String; = "\u7f51\u7edc\u9519\u8bef"

.field public static final LOGIN_SUCCESS:I = 0x0

.field public static final LOGIN_SUCCESS_STRING:Ljava/lang/String; = "\u767b\u5f55\u6210\u529f"

.field public static final LOGIN_TIMEOUT:I = 0x3

.field public static final LOGIN_TIMEOUT_STRING:Ljava/lang/String; = "\u767b\u5f55\u8d85\u65f6"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .prologue
    .line 67
    invoke-static {p0, p1, p2}, Lorg/cocos2dx/plugin/LoginWrapper;->nativeOnLoginResult(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method private static native nativeOnAntiAddictionResult(Ljava/lang/String;ILjava/lang/String;)V
.end method

.method private static native nativeOnLoginResult(Ljava/lang/String;ILjava/lang/String;)V
.end method

.method public static onAntiAddictionResult(Lorg/cocos2dx/plugin/InterfaceLogin;ILjava/lang/String;)V
    .locals 4
    .param p0, "obj"    # Lorg/cocos2dx/plugin/InterfaceLogin;
    .param p1, "ret"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 54
    move v2, p1

    .line 55
    .local v2, "curRet":I
    move-object v1, p2

    .line 56
    .local v1, "curMsg":Ljava/lang/String;
    move-object v0, p0

    .line 57
    .local v0, "curAdapter":Lorg/cocos2dx/plugin/InterfaceLogin;
    new-instance v3, Lorg/cocos2dx/plugin/LoginWrapper$2;

    invoke-direct {v3, v0, v2, v1}, Lorg/cocos2dx/plugin/LoginWrapper$2;-><init>(Lorg/cocos2dx/plugin/InterfaceLogin;ILjava/lang/String;)V

    invoke-static {v3}, Lorg/cocos2dx/plugin/PluginWrapper;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 65
    return-void
.end method

.method public static onLoginResult(Lorg/cocos2dx/plugin/InterfaceLogin;ILjava/lang/String;)V
    .locals 4
    .param p0, "obj"    # Lorg/cocos2dx/plugin/InterfaceLogin;
    .param p1, "ret"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 40
    move v2, p1

    .line 41
    .local v2, "curRet":I
    move-object v1, p2

    .line 42
    .local v1, "curMsg":Ljava/lang/String;
    move-object v0, p0

    .line 43
    .local v0, "curAdapter":Lorg/cocos2dx/plugin/InterfaceLogin;
    new-instance v3, Lorg/cocos2dx/plugin/LoginWrapper$1;

    invoke-direct {v3, v0, v2, v1}, Lorg/cocos2dx/plugin/LoginWrapper$1;-><init>(Lorg/cocos2dx/plugin/InterfaceLogin;ILjava/lang/String;)V

    invoke-static {v3}, Lorg/cocos2dx/plugin/PluginWrapper;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 51
    return-void
.end method

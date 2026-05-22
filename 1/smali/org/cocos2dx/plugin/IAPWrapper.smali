.class public Lorg/cocos2dx/plugin/IAPWrapper;
.super Ljava/lang/Object;
.source "IAPWrapper.java"


# static fields
.field public static final PAY_CANCEL:I = 0x2

.field public static final PAY_CANCEL_STRING:Ljava/lang/String; = "\u53d6\u6d88\u652f\u4ed8"

.field public static final PAY_FAIL:I = 0x1

.field public static final PAY_FAIL_STRING:Ljava/lang/String; = "\u652f\u4ed8\u5931\u8d25"

.field public static final PAY_NET_ERROR:I = 0x4

.field public static final PAY_NET_ERROR_STRING:Ljava/lang/String; = "\u7f51\u7edc\u9519\u8bef"

.field public static final PAY_ORDER_FAIL:I = 0x5

.field public static final PAY_ORDER_FAIL_STRING:Ljava/lang/String; = "\u521b\u5efa\u8ba2\u5355\u5931\u8d25"

.field public static final PAY_SUCCESS:I = 0x0

.field public static final PAY_SUCCESS_STRING:Ljava/lang/String; = "\u652f\u4ed8\u6210\u529f"

.field public static final PAY_TIMEOUT:I = 0x3

.field public static final PAY_TIMEOUT_STRING:Ljava/lang/String; = "\u652f\u4ed8\u8d85\u65f6"


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
    .line 53
    invoke-static {p0, p1, p2}, Lorg/cocos2dx/plugin/IAPWrapper;->nativeOnPayResult(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method private static native nativeOnPayResult(Ljava/lang/String;ILjava/lang/String;)V
.end method

.method public static onPayResult(Lorg/cocos2dx/plugin/InterfaceIAP;ILjava/lang/String;)V
    .locals 4
    .param p0, "obj"    # Lorg/cocos2dx/plugin/InterfaceIAP;
    .param p1, "ret"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 41
    move v2, p1

    .line 42
    .local v2, "curRet":I
    move-object v0, p2

    .line 43
    .local v0, "curMsg":Ljava/lang/String;
    move-object v1, p0

    .line 44
    .local v1, "curObj":Lorg/cocos2dx/plugin/InterfaceIAP;
    new-instance v3, Lorg/cocos2dx/plugin/IAPWrapper$1;

    invoke-direct {v3, v1, v2, v0}, Lorg/cocos2dx/plugin/IAPWrapper$1;-><init>(Lorg/cocos2dx/plugin/InterfaceIAP;ILjava/lang/String;)V

    invoke-static {v3}, Lorg/cocos2dx/plugin/PluginWrapper;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 52
    return-void
.end method

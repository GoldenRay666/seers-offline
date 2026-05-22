.class Lorg/cocos2dx/plugin/LoginTaomee$1$1;
.super Ljava/lang/Object;
.source "LoginTaomee.java"

# interfaces
.implements Lcom/taomee/pwdlogin/service/LoginResponse;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/plugin/LoginTaomee$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/cocos2dx/plugin/LoginTaomee$1;


# direct methods
.method constructor <init>(Lorg/cocos2dx/plugin/LoginTaomee$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lorg/cocos2dx/plugin/LoginTaomee$1$1;->this$1:Lorg/cocos2dx/plugin/LoginTaomee$1;

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public loginFail(ILjava/lang/String;)V
    .locals 0
    .param p1, "errorCode"    # I
    .param p2, "errorInfo"    # Ljava/lang/String;

    .prologue
    .line 45
    return-void
.end method

.method public loginSuc(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "userid"    # Ljava/lang/String;
    .param p3, "session"    # Ljava/lang/String;

    .prologue
    .line 37
    iget-object v0, p0, Lorg/cocos2dx/plugin/LoginTaomee$1$1;->this$1:Lorg/cocos2dx/plugin/LoginTaomee$1;

    invoke-static {v0}, Lorg/cocos2dx/plugin/LoginTaomee$1;->access$0(Lorg/cocos2dx/plugin/LoginTaomee$1;)Lorg/cocos2dx/plugin/LoginTaomee;

    move-result-object v0

    .line 38
    const/4 v1, 0x0

    .line 39
    const-string v2, "\u767b\u5f55\u6210\u529f"

    .line 37
    invoke-static {v0, v1, v2}, Lorg/cocos2dx/plugin/LoginWrapper;->onLoginResult(Lorg/cocos2dx/plugin/InterfaceLogin;ILjava/lang/String;)V

    .line 40
    return-void
.end method

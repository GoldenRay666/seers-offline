.class Lorg/cocos2dx/plugin/LoginTaomee$1;
.super Ljava/lang/Object;
.source "LoginTaomee.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/plugin/LoginTaomee;->doLogin()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/cocos2dx/plugin/LoginTaomee;


# direct methods
.method constructor <init>(Lorg/cocos2dx/plugin/LoginTaomee;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lorg/cocos2dx/plugin/LoginTaomee$1;->this$0:Lorg/cocos2dx/plugin/LoginTaomee;

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lorg/cocos2dx/plugin/LoginTaomee$1;)Lorg/cocos2dx/plugin/LoginTaomee;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lorg/cocos2dx/plugin/LoginTaomee$1;->this$0:Lorg/cocos2dx/plugin/LoginTaomee;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 33
    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v0

    new-instance v1, Lorg/cocos2dx/plugin/LoginTaomee$1$1;

    invoke-direct {v1, p0}, Lorg/cocos2dx/plugin/LoginTaomee$1$1;-><init>(Lorg/cocos2dx/plugin/LoginTaomee$1;)V

    invoke-virtual {v0, v1}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->onAutoLogin(Lcom/taomee/pwdlogin/service/LoginResponse;)V

    .line 48
    return-void
.end method

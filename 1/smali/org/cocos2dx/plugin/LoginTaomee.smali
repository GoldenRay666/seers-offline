.class public Lorg/cocos2dx/plugin/LoginTaomee;
.super Ljava/lang/Object;
.source "LoginTaomee.java"

# interfaces
.implements Lorg/cocos2dx/plugin/InterfaceLogin;


# instance fields
.field private channel:I

.field private gameId:I

.field private mContext:Landroid/app/Activity;

.field private mDebugMode:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    check-cast p1, Landroid/app/Activity;

    .end local p1    # "context":Landroid/content/Context;
    iput-object p1, p0, Lorg/cocos2dx/plugin/LoginTaomee;->mContext:Landroid/app/Activity;

    .line 17
    return-void
.end method


# virtual methods
.method public OnLoginResult(ILjava/lang/String;)V
    .locals 0
    .param p1, "errorCode"    # I
    .param p2, "er"    # Ljava/lang/String;

    .prologue
    .line 121
    return-void
.end method

.method public configDeveloperInfo(Ljava/util/Hashtable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 21
    .local p1, "cpInfo":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "gameId"

    invoke-virtual {p1, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/cocos2dx/plugin/LoginTaomee;->gameId:I

    .line 22
    const-string v0, "channel"

    invoke-virtual {p1, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/cocos2dx/plugin/LoginTaomee;->channel:I

    .line 23
    return-void
.end method

.method public doBBS()V
    .locals 0

    .prologue
    .line 99
    return-void
.end method

.method public doLogin()V
    .locals 6

    .prologue
    .line 27
    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v0

    iget v1, p0, Lorg/cocos2dx/plugin/LoginTaomee;->gameId:I

    iget v2, p0, Lorg/cocos2dx/plugin/LoginTaomee;->channel:I

    const/16 v3, 0x3a98

    iget-object v4, p0, Lorg/cocos2dx/plugin/LoginTaomee;->mContext:Landroid/app/Activity;

    iget-boolean v5, p0, Lorg/cocos2dx/plugin/LoginTaomee;->mDebugMode:Z

    invoke-virtual/range {v0 .. v5}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->init(IIILandroid/app/Activity;Z)V

    .line 28
    iget-object v0, p0, Lorg/cocos2dx/plugin/LoginTaomee;->mContext:Landroid/app/Activity;

    new-instance v1, Lorg/cocos2dx/plugin/LoginTaomee$1;

    invoke-direct {v1, p0}, Lorg/cocos2dx/plugin/LoginTaomee$1;-><init>(Lorg/cocos2dx/plugin/LoginTaomee;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 51
    return-void
.end method

.method public doLogout()V
    .locals 0

    .prologue
    .line 75
    return-void
.end method

.method public doSdkAntiAddictionQuery(Ljava/util/Hashtable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 111
    .local p1, "cpInfo":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/String;Ljava/lang/String;>;"
    return-void
.end method

.method public doSdkExit()V
    .locals 0

    .prologue
    .line 105
    return-void
.end method

.method public doSdkRealNameRegister(Ljava/util/Hashtable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 117
    .local p1, "cpInfo":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/String;Ljava/lang/String;>;"
    return-void
.end method

.method public getNickName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getUserName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPluginVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 92
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSDKVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSession()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getSession()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getUserId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setDebugMode(Z)V
    .locals 0
    .param p1, "debug"    # Z

    .prologue
    .line 79
    iput-boolean p1, p0, Lorg/cocos2dx/plugin/LoginTaomee;->mDebugMode:Z

    .line 81
    return-void
.end method

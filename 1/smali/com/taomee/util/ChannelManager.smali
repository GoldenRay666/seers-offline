.class public Lcom/taomee/util/ChannelManager;
.super Ljava/lang/Object;
.source "ChannelManager.java"


# static fields
.field private static final appIDXiaoMi:I = 0x4f25

.field private static final appKeyXiaoMi:Ljava/lang/String; = "7e197d7b-88ed-2ecc-2491-52400ad8399d"

.field private static final channelID:I = 0x61

.field private static final errCodeSystemErr:I = 0x7d1

.field private static final gameID:I = 0x54

.field public static session:Ljava/lang/String;

.field public static userID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-string v0, ""

    sput-object v0, Lcom/taomee/util/ChannelManager;->userID:Ljava/lang/String;

    .line 24
    const-string v0, ""

    sput-object v0, Lcom/taomee/util/ChannelManager;->session:Ljava/lang/String;

    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()V
    .locals 0

    .prologue
    .line 155
    invoke-static {}, Lcom/taomee/util/ChannelManager;->loginXiaoMi()V

    return-void
.end method

.method static synthetic access$1()V
    .locals 0

    .prologue
    .line 167
    invoke-static {}, Lcom/taomee/util/ChannelManager;->login4399()V

    return-void
.end method

.method static synthetic access$2(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .prologue
    .line 174
    invoke-static {p0, p1, p2}, Lcom/taomee/util/ChannelManager;->loginTaomee(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$3()V
    .locals 0

    .prologue
    .line 158
    invoke-static {}, Lcom/taomee/util/ChannelManager;->logoutXiaoMi()V

    return-void
.end method

.method static synthetic access$4()V
    .locals 0

    .prologue
    .line 170
    invoke-static {}, Lcom/taomee/util/ChannelManager;->logout4399()V

    return-void
.end method

.method static synthetic access$5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 178
    invoke-static {p0, p1, p2}, Lcom/taomee/util/ChannelManager;->registerTaomee(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static changePwd()V
    .locals 1

    .prologue
    .line 108
    invoke-static {}, Lcom/taomee/util/ChannelManager;->isChannelXiaoMi()Z

    move-result v0

    if-nez v0, :cond_0

    .line 110
    invoke-static {}, Lcom/taomee/util/ChannelManager;->isChannel4399()Z

    move-result v0

    if-nez v0, :cond_0

    .line 113
    invoke-static {}, Lcom/taomee/util/ChannelManager;->changePwdTaomee()V

    .line 115
    :cond_0
    return-void
.end method

.method private static changePwdTaomee()V
    .locals 0

    .prologue
    .line 183
    return-void
.end method

.method public static getChannelName()Ljava/lang/String;
    .locals 5

    .prologue
    .line 28
    :try_start_0
    sget-object v2, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    invoke-virtual {v2}, Lcom/taomee/seer2/seer2;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 29
    sget-object v3, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    invoke-virtual {v3}, Lcom/taomee/seer2/seer2;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 30
    const/16 v4, 0x80

    .line 29
    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 31
    .local v0, "ai":Landroid/content/pm/ApplicationInfo;
    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "TDGA_CHANNEL_ID"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 32
    .local v1, "value":Ljava/lang/Object;
    if-eqz v1, :cond_0

    .line 33
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 38
    .end local v1    # "value":Ljava/lang/Object;
    :goto_0
    return-object v2

    .line 35
    :catch_0
    move-exception v2

    .line 38
    :cond_0
    const-string v2, ""

    goto :goto_0
.end method

.method public static getLastLoginPwd()Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    invoke-static {}, Lcom/taomee/util/ChannelManager;->isChannelXiaoMi()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    const-string v0, ""

    .line 137
    :goto_0
    return-object v0

    .line 133
    :cond_0
    invoke-static {}, Lcom/taomee/util/ChannelManager;->isChannel4399()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 135
    const-string v0, ""

    goto :goto_0

    .line 137
    :cond_1
    invoke-static {}, Lcom/taomee/util/ChannelManager;->getLastLoginPwdTaomee()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static getLastLoginPwdTaomee()Ljava/lang/String;
    .locals 1

    .prologue
    .line 191
    const-string v0, ""

    .line 192
    .local v0, "pwd":Ljava/lang/String;
    return-object v0
.end method

.method public static getLastLoginUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 118
    invoke-static {}, Lcom/taomee/util/ChannelManager;->isChannelXiaoMi()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 120
    const-string v0, ""

    .line 125
    :goto_0
    return-object v0

    .line 121
    :cond_0
    invoke-static {}, Lcom/taomee/util/ChannelManager;->isChannel4399()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 123
    const-string v0, ""

    goto :goto_0

    .line 125
    :cond_1
    invoke-static {}, Lcom/taomee/util/ChannelManager;->getLastLoginUserNameTaomee()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static getLastLoginUserNameTaomee()Ljava/lang/String;
    .locals 1

    .prologue
    .line 186
    const-string v0, ""

    .line 187
    .local v0, "userName":Ljava/lang/String;
    return-object v0
.end method

.method public static initSDK()V
    .locals 1

    .prologue
    .line 43
    invoke-static {}, Lcom/taomee/util/ChannelManager;->isChannelXiaoMi()Z

    move-result v0

    if-nez v0, :cond_0

    .line 44
    invoke-static {}, Lcom/taomee/util/ChannelManager;->isChannel4399()Z

    move-result v0

    if-nez v0, :cond_0

    .line 46
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    invoke-static {v0}, Lorg/cocos2dx/plugin/PluginWrapper;->init(Landroid/content/Context;)V

    .line 47
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->getInstance()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    move-result-object v0

    invoke-static {v0}, Lorg/cocos2dx/plugin/PluginWrapper;->setGLSurfaceView(Landroid/opengl/GLSurfaceView;)V

    .line 49
    :cond_0
    return-void
.end method

.method private static isChannel(Ljava/lang/String;)Z
    .locals 2
    .param p0, "targetChannelName"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-static {}, Lcom/taomee/util/ChannelManager;->getChannelName()Ljava/lang/String;

    move-result-object v0

    .line 53
    .local v0, "channelName":Ljava/lang/String;
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 54
    const/4 v1, 0x1

    .line 56
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isChannel4399()Z
    .locals 2

    .prologue
    .line 163
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    .line 164
    const v1, 0x7f070018

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/seer2;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 163
    invoke-static {v0}, Lcom/taomee/util/ChannelManager;->isChannel(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isChannelXiaoMi()Z
    .locals 2

    .prologue
    .line 151
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    .line 152
    const v1, 0x7f070017

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/seer2;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 151
    invoke-static {v0}, Lcom/taomee/util/ChannelManager;->isChannel(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static login(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .param p0, "userName"    # Ljava/lang/String;
    .param p1, "pwd"    # Ljava/lang/String;
    .param p2, "isRecord"    # Z

    .prologue
    .line 62
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    new-instance v1, Lcom/taomee/util/ChannelManager$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/taomee/util/ChannelManager$1;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/seer2;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 74
    return-void
.end method

.method private static login4399()V
    .locals 0

    .prologue
    .line 168
    return-void
.end method

.method private static loginTaomee(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p0, "userName"    # Ljava/lang/String;
    .param p1, "pwd"    # Ljava/lang/String;
    .param p2, "isRecord"    # Z

    .prologue
    .line 176
    return-void
.end method

.method private static loginXiaoMi()V
    .locals 0

    .prologue
    .line 156
    return-void
.end method

.method public static logout()V
    .locals 2

    .prologue
    .line 77
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    new-instance v1, Lcom/taomee/util/ChannelManager$2;

    invoke-direct {v1}, Lcom/taomee/util/ChannelManager$2;-><init>()V

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/seer2;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 89
    return-void
.end method

.method private static logout4399()V
    .locals 0

    .prologue
    .line 171
    return-void
.end method

.method private static logoutXiaoMi()V
    .locals 0

    .prologue
    .line 159
    return-void
.end method

.method public static native nativeLoginError(I)V
.end method

.method public static native nativeLoginSuccess(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native nativeRegisterError(I)V
.end method

.method public static native nativeRegisterSuccess()V
.end method

.method public static playVideoJNI()V
    .locals 2

    .prologue
    .line 196
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    new-instance v1, Lcom/taomee/util/ChannelManager$4;

    invoke-direct {v1}, Lcom/taomee/util/ChannelManager$4;-><init>()V

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/seer2;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 202
    return-void
.end method

.method public static register(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "userName"    # Ljava/lang/String;
    .param p1, "pwd"    # Ljava/lang/String;
    .param p2, "confirmPwd"    # Ljava/lang/String;

    .prologue
    .line 93
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    new-instance v1, Lcom/taomee/util/ChannelManager$3;

    invoke-direct {v1, p0, p1, p2}, Lcom/taomee/util/ChannelManager$3;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/seer2;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 105
    return-void
.end method

.method private static registerTaomee(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "userName"    # Ljava/lang/String;
    .param p1, "pwd"    # Ljava/lang/String;
    .param p2, "confirmPwd"    # Ljava/lang/String;

    .prologue
    .line 180
    return-void
.end method

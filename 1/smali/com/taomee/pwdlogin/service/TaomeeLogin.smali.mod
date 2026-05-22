.class public Lcom/taomee/pwdlogin/service/TaomeeLogin;
.super Ljava/lang/Object;
.source "TaomeeLogin.java"


# static fields
.field private static mTaomeeLogin:Lcom/taomee/pwdlogin/service/TaomeeLogin;


# instance fields
.field private activity:Landroid/app/Activity;

.field private channel:I

.field private gameId:I

.field private isDebugMode:Z

.field private mLoginManager:Lcom/taomee/pwdlogin/service/LoginManager;

.field private mLoginResponse:Lcom/taomee/pwdlogin/service/LoginResponse;

.field private session:Ljava/lang/String;

.field private timeout:I

.field private userId:Ljava/lang/String;

.field private userName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/taomee/pwdlogin/service/TaomeeLogin;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 17
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->userId:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$1(Lcom/taomee/pwdlogin/service/TaomeeLogin;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 16
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->userName:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$2(Lcom/taomee/pwdlogin/service/TaomeeLogin;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 18
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->session:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$3(Lcom/taomee/pwdlogin/service/TaomeeLogin;)Landroid/app/Activity;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$4(Lcom/taomee/pwdlogin/service/TaomeeLogin;)Lcom/taomee/pwdlogin/service/LoginResponse;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->mLoginResponse:Lcom/taomee/pwdlogin/service/LoginResponse;

    return-object v0
.end method

.method public static getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->mTaomeeLogin:Lcom/taomee/pwdlogin/service/TaomeeLogin;

    if-nez v0, :cond_0

    .line 24
    new-instance v0, Lcom/taomee/pwdlogin/service/TaomeeLogin;

    invoke-direct {v0}, Lcom/taomee/pwdlogin/service/TaomeeLogin;-><init>()V

    sput-object v0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->mTaomeeLogin:Lcom/taomee/pwdlogin/service/TaomeeLogin;

    .line 26
    :cond_0
    sget-object v0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->mTaomeeLogin:Lcom/taomee/pwdlogin/service/TaomeeLogin;

    return-object v0
.end method

.method public static getmTaomeeLogin()Lcom/taomee/pwdlogin/service/TaomeeLogin;
    .locals 1

    .prologue
    .line 114
    sget-object v0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->mTaomeeLogin:Lcom/taomee/pwdlogin/service/TaomeeLogin;

    return-object v0
.end method


# virtual methods
.method public deleteLoginRecords()V
    .locals 2

    .prologue
    .line 94
    new-instance v0, Lcom/taomee/pwdlogin/service/LoginRecordsManager;

    iget-object v1, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/taomee/pwdlogin/service/LoginRecordsManager;-><init>(Landroid/content/Context;)V

    .line 95
    .local v0, "loginRecordsManager":Lcom/taomee/pwdlogin/service/LoginRecordsManager;
    invoke-virtual {v0}, Lcom/taomee/pwdlogin/service/LoginRecordsManager;->deleteLoginRecords()V

    .line 96
    return-void
.end method

.method public getChannel()I
    .locals 1

    .prologue
    .line 102
    iget v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->channel:I

    return v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method public getGameId()I
    .locals 1

    .prologue
    .line 99
    iget v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->gameId:I

    return v0
.end method

.method public getSession()Ljava/lang/String;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->session:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 105
    iget v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->timeout:I

    return v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->userId:Ljava/lang/String;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public getmLoginManager()Lcom/taomee/pwdlogin/service/LoginManager;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->mLoginManager:Lcom/taomee/pwdlogin/service/LoginManager;

    return-object v0
.end method

.method public getmLoginResponse()Lcom/taomee/pwdlogin/service/LoginResponse;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->mLoginResponse:Lcom/taomee/pwdlogin/service/LoginResponse;

    return-object v0
.end method

.method public init(IIILandroid/app/Activity;Z)V
    .locals 1
    .param p1, "gameId"    # I
    .param p2, "channel"    # I
    .param p3, "timeout"    # I
    .param p4, "activity"    # Landroid/app/Activity;
    .param p5, "isDebugMode"    # Z

    .prologue
    .line 37
    iput p1, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->gameId:I

    .line 38
    iput p2, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->channel:I

    .line 39
    iput p3, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->timeout:I

    .line 40
    iput-object p4, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->activity:Landroid/app/Activity;

    .line 41
    iput-boolean p5, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->isDebugMode:Z

    .line 42
    if-eqz p5, :cond_0

    .line 43
    const-string v0, "http://127.0.0.1:8000/account_service.php"

    sput-object v0, Lcom/taomee/pwdlogin/common/GlobalVars;->LOGIN_URL:Ljava/lang/String;

    .line 47
    :goto_0
    return-void

    .line 45
    :cond_0
    const-string v0, "http://maccount-httpd.61.com/account_service.php"

    sput-object v0, Lcom/taomee/pwdlogin/common/GlobalVars;->LOGIN_URL:Ljava/lang/String;

    goto :goto_0
.end method

.method public isDebugMode()Z
    .locals 1

    .prologue
    .line 108
    iget-boolean v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->isDebugMode:Z

    return v0
.end method

.method public onAutoLogin(Lcom/taomee/pwdlogin/service/LoginResponse;)V
    .locals 4
    .param p1, "loginResponse"    # Lcom/taomee/pwdlogin/service/LoginResponse;

    .prologue
    .line 52
    # Force offline/local login: set userId/userName/session to local defaults and skip remote login
    const-string v0, "local_user"
    iput-object v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->userId:Ljava/lang/String;

    const-string v1, "Player"
    iput-object v1, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->userName:Ljava/lang/String;

    const-string v2, "offline_session"
    iput-object v2, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->session:Ljava/lang/String;

    # Clear any LoginResponse reference
    const/4 v3, 0x0
    iput-object v3, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->mLoginResponse:Lcom/taomee/pwdlogin/service/LoginResponse;

    # Invoke loginSuc callback first (triggers LoginWrapper -> native notification)
    invoke-interface {p1, v1, v0, v2}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginSuc(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    # Then notify native layer directly via JNI
    invoke-static {v0, v2}, Lcom/taomee/util/ChannelManager;->nativeLoginSuccess(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    return-void
.end method

.method public setSession(Ljava/lang/String;)V
    .locals 0
    .param p1, "session"    # Ljava/lang/String;

    .prologue
    .line 132
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->session:Ljava/lang/String;

    .line 133
    return-void
.end method

.method public setUserId(Ljava/lang/String;)V
    .locals 0
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    .line 129
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->userId:Ljava/lang/String;

    .line 130
    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .locals 0
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    .line 126
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin;->userName:Ljava/lang/String;

    .line 127
    return-void
.end method

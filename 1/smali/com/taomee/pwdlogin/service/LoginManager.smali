.class public Lcom/taomee/pwdlogin/service/LoginManager;
.super Ljava/lang/Object;
.source "LoginManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;,
        Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;
    }
.end annotation


# instance fields
.field private isRecord:Z

.field private isRemember:Ljava/lang/String;

.field private loadingDialog:Lcom/taomee/pwdlogin/view/LoadingDialog;

.field private loginRecordsData:Lcom/taomee/pwdlogin/data/LoginRecordsData;

.field private loginResponse:Lcom/taomee/pwdlogin/service/LoginResponse;

.field private mAutoLoginASynTask:Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;

.field private mContext:Landroid/app/Activity;

.field private mProgressDialog:Landroid/app/ProgressDialog;

.field private pwd:Ljava/lang/String;

.field private udidType:I

.field private userName:Ljava/lang/String;

.field private user_id:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const-string v0, ""

    iput-object v0, p0, Lcom/taomee/pwdlogin/service/LoginManager;->user_id:Ljava/lang/String;

    .line 31
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/LoginManager;->mContext:Landroid/app/Activity;

    .line 32
    new-instance v0, Lcom/taomee/pwdlogin/data/LoginRecordsData;

    invoke-direct {v0, p1}, Lcom/taomee/pwdlogin/data/LoginRecordsData;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/taomee/pwdlogin/service/LoginManager;->loginRecordsData:Lcom/taomee/pwdlogin/data/LoginRecordsData;

    .line 33
    return-void
.end method

.method static synthetic access$0(Lcom/taomee/pwdlogin/service/LoginManager;)Landroid/app/Activity;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginManager;->mContext:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$1(Lcom/taomee/pwdlogin/service/LoginManager;Landroid/app/ProgressDialog;)V
    .locals 0

    .prologue
    .line 18
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/LoginManager;->mProgressDialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method static synthetic access$2(Lcom/taomee/pwdlogin/service/LoginManager;)Landroid/app/ProgressDialog;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginManager;->mProgressDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$3(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/service/LoginResponse;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginManager;->loginResponse:Lcom/taomee/pwdlogin/service/LoginResponse;

    return-object v0
.end method

.method static synthetic access$4(Lcom/taomee/pwdlogin/service/LoginManager;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginManager;->pwd:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$5(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/data/LoginRecordsData;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginManager;->loginRecordsData:Lcom/taomee/pwdlogin/data/LoginRecordsData;

    return-object v0
.end method

.method static synthetic access$6(Lcom/taomee/pwdlogin/service/LoginManager;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginManager;->userName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$7(Lcom/taomee/pwdlogin/service/LoginManager;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginManager;->isRemember:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$8(Lcom/taomee/pwdlogin/service/LoginManager;Lcom/taomee/pwdlogin/view/LoadingDialog;)V
    .locals 0

    .prologue
    .line 19
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/LoginManager;->loadingDialog:Lcom/taomee/pwdlogin/view/LoadingDialog;

    return-void
.end method

.method static synthetic access$9(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/view/LoadingDialog;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginManager;->loadingDialog:Lcom/taomee/pwdlogin/view/LoadingDialog;

    return-object v0
.end method

.method private fiedsValid(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "pwd"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x5

    .line 207
    const/4 v0, 0x0

    .line 208
    .local v0, "errorCode":I
    if-eqz p1, :cond_0

    const-string v2, ""

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 209
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 211
    :cond_0
    if-eqz p2, :cond_1

    const-string v2, ""

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 212
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    .line 214
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 215
    .local v1, "userNameLen":I
    if-eqz p1, :cond_2

    const-string v2, ""

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 216
    :cond_2
    const/16 v0, 0xbb9

    .line 232
    :goto_0
    return v0

    .line 217
    :cond_3
    const-string v2, "[0-9]{5,10}"

    invoke-static {v2, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 218
    const/16 v2, 0xff

    iput v2, p0, Lcom/taomee/pwdlogin/service/LoginManager;->udidType:I

    .line 219
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/LoginManager;->user_id:Ljava/lang/String;

    goto :goto_0

    .line 220
    :cond_4
    const-string v2, "[0-9]{11}"

    invoke-static {v2, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 221
    const/4 v2, 0x7

    iput v2, p0, Lcom/taomee/pwdlogin/service/LoginManager;->udidType:I

    goto :goto_0

    .line 222
    :cond_5
    const-string v2, "@"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_6

    const/16 v2, 0x40

    if-gt v1, v2, :cond_6

    .line 223
    if-lt v1, v3, :cond_6

    .line 224
    const/4 v2, 0x0

    iput v2, p0, Lcom/taomee/pwdlogin/service/LoginManager;->udidType:I

    goto :goto_0

    .line 225
    :cond_6
    const-string v2, "[a-zA-Z0-9_]{6,36}"

    invoke-static {v2, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 226
    iput v3, p0, Lcom/taomee/pwdlogin/service/LoginManager;->udidType:I

    goto :goto_0

    .line 227
    :cond_7
    if-eqz p2, :cond_8

    const-string v2, ""

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 228
    :cond_8
    const/16 v0, 0xfa1

    goto :goto_0

    .line 230
    :cond_9
    const/16 v0, 0xbbd

    goto :goto_0
.end method


# virtual methods
.method public doLogin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/taomee/pwdlogin/service/LoginResponse;)V
    .locals 6
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "pwd"    # Ljava/lang/String;
    .param p3, "isRemember"    # Ljava/lang/String;
    .param p4, "isRecord"    # Z
    .param p5, "loginResponse"    # Lcom/taomee/pwdlogin/service/LoginResponse;

    .prologue
    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 37
    iput-object p5, p0, Lcom/taomee/pwdlogin/service/LoginManager;->loginResponse:Lcom/taomee/pwdlogin/service/LoginResponse;

    .line 38
    iput-object p3, p0, Lcom/taomee/pwdlogin/service/LoginManager;->isRemember:Ljava/lang/String;

    .line 39
    iput-boolean p4, p0, Lcom/taomee/pwdlogin/service/LoginManager;->isRecord:Z

    .line 40
    invoke-direct {p0, p1, p2}, Lcom/taomee/pwdlogin/service/LoginManager;->fiedsValid(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 41
    .local v0, "errorCode":I
    if-eqz p4, :cond_0

    .line 42
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/LoginManager;->userName:Ljava/lang/String;

    .line 43
    iput-object p2, p0, Lcom/taomee/pwdlogin/service/LoginManager;->pwd:Ljava/lang/String;

    .line 44
    new-instance v1, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;

    invoke-direct {v1, p0}, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;-><init>(Lcom/taomee/pwdlogin/service/LoginManager;)V

    iput-object v1, p0, Lcom/taomee/pwdlogin/service/LoginManager;->mAutoLoginASynTask:Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;

    .line 45
    iget-object v1, p0, Lcom/taomee/pwdlogin/service/LoginManager;->mAutoLoginASynTask:Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;

    new-array v2, v3, [Ljava/lang/String;

    iget-object v3, p0, Lcom/taomee/pwdlogin/service/LoginManager;->userName:Ljava/lang/String;

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/taomee/pwdlogin/service/LoginManager;->pwd:Ljava/lang/String;

    aput-object v3, v2, v5

    invoke-virtual {v1, v2}, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 73
    :goto_0
    return-void

    .line 48
    :cond_0
    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    .line 50
    :sswitch_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 51
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 52
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    .line 53
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/LoginManager;->userName:Ljava/lang/String;

    .line 54
    iput-object p2, p0, Lcom/taomee/pwdlogin/service/LoginManager;->pwd:Ljava/lang/String;

    .line 55
    new-instance v1, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;-><init>(Lcom/taomee/pwdlogin/service/LoginManager;Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;)V

    new-array v2, v3, [Ljava/lang/String;

    iget-object v3, p0, Lcom/taomee/pwdlogin/service/LoginManager;->userName:Ljava/lang/String;

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/taomee/pwdlogin/service/LoginManager;->pwd:Ljava/lang/String;

    aput-object v3, v2, v5

    invoke-virtual {v1, v2}, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 58
    :sswitch_1
    const/16 v1, 0xbb9

    const-string v2, "\u8bf7\u8f93\u5165\u8d26\u53f7"

    invoke-interface {p5, v1, v2}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginFail(ILjava/lang/String;)V

    goto :goto_0

    .line 61
    :sswitch_2
    const/16 v1, 0xbbd

    const-string v2, "\u8d26\u53f7\u4e0d\u5b58\u5728"

    invoke-interface {p5, v1, v2}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginFail(ILjava/lang/String;)V

    goto :goto_0

    .line 64
    :sswitch_3
    const/16 v1, 0xfa1

    const-string v2, "\u8bf7\u8f93\u5165\u5bc6\u7801"

    invoke-interface {p5, v1, v2}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginFail(ILjava/lang/String;)V

    goto :goto_0

    .line 67
    :sswitch_4
    const/16 v1, 0xfa6

    const-string v2, "\u5bc6\u7801\u4e0d\u6b63\u786e"

    invoke-interface {p5, v1, v2}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginFail(ILjava/lang/String;)V

    goto :goto_0

    .line 48
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xbb9 -> :sswitch_1
        0xbbd -> :sswitch_2
        0xfa1 -> :sswitch_3
        0xfa6 -> :sswitch_4
    .end sparse-switch
.end method

.method public getLoginParams(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "pwd"    # Ljava/lang/String;

    .prologue
    .line 240
    move-object v1, p2

    .line 241
    .local v1, "pwdMd5":Ljava/lang/String;
    iget-boolean v4, p0, Lcom/taomee/pwdlogin/service/LoginManager;->isRecord:Z

    if-nez v4, :cond_0

    .line 242
    invoke-static {p2}, Lcom/taomee/pwdlogin/common/Util;->MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/taomee/pwdlogin/common/Util;->MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 244
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "channel="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v5

    invoke-virtual {v5}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getChannel()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 245
    const-string v5, "&game_version="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 246
    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v5

    invoke-virtual {v5}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/taomee/pwdlogin/common/Util;->getVersionName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 247
    const-string v5, "&gameid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v5

    invoke-virtual {v5}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getGameId()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 248
    const-string v5, "&openudid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "&passwd="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "&service="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 249
    const-string v5, "1012"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "&udid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 250
    const-string v5, "&udid_type="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/taomee/pwdlogin/service/LoginManager;->udidType:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "&user_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/taomee/pwdlogin/service/LoginManager;->user_id:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 244
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 252
    .local v3, "temp":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "&key="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "21ee5e1d8bf781576754be709301ffe9"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/taomee/pwdlogin/common/Util;->MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 253
    .local v2, "sign":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "&sign_type="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "MD5"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "&sign="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 254
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 253
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 256
    .local v0, "params":Ljava/lang/String;
    return-object v0
.end method

.method public getmAutoLoginASynTask()Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;
    .locals 1

    .prologue
    .line 260
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginManager;->mAutoLoginASynTask:Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;

    return-object v0
.end method

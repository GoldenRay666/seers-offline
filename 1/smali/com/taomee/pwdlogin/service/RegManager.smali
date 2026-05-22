.class public Lcom/taomee/pwdlogin/service/RegManager;
.super Ljava/lang/Object;
.source "RegManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;
    }
.end annotation


# instance fields
.field public isRemember:Ljava/lang/String;

.field private loginRecordsData:Lcom/taomee/pwdlogin/data/LoginRecordsData;

.field private mContext:Landroid/content/Context;

.field private mProgressDialog:Landroid/app/ProgressDialog;

.field public pwd:Ljava/lang/String;

.field private regResponse:Lcom/taomee/pwdlogin/service/RegResponse;

.field public userName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/RegManager;->mContext:Landroid/content/Context;

    .line 23
    new-instance v0, Lcom/taomee/pwdlogin/data/LoginRecordsData;

    invoke-direct {v0, p1}, Lcom/taomee/pwdlogin/data/LoginRecordsData;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/taomee/pwdlogin/service/RegManager;->loginRecordsData:Lcom/taomee/pwdlogin/data/LoginRecordsData;

    .line 24
    return-void
.end method

.method static synthetic access$0(Lcom/taomee/pwdlogin/service/RegManager;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 13
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/RegManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1(Lcom/taomee/pwdlogin/service/RegManager;Landroid/app/ProgressDialog;)V
    .locals 0

    .prologue
    .line 15
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/RegManager;->mProgressDialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method static synthetic access$2(Lcom/taomee/pwdlogin/service/RegManager;)Landroid/app/ProgressDialog;
    .locals 1

    .prologue
    .line 15
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/RegManager;->mProgressDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$3(Lcom/taomee/pwdlogin/service/RegManager;)Lcom/taomee/pwdlogin/service/RegResponse;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/RegManager;->regResponse:Lcom/taomee/pwdlogin/service/RegResponse;

    return-object v0
.end method

.method static synthetic access$4(Lcom/taomee/pwdlogin/service/RegManager;)Lcom/taomee/pwdlogin/data/LoginRecordsData;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/RegManager;->loginRecordsData:Lcom/taomee/pwdlogin/data/LoginRecordsData;

    return-object v0
.end method

.method private fieldsValid(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 4
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "pwd"    # Ljava/lang/String;
    .param p3, "confirmPwd"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x24

    const/4 v2, 0x6

    .line 162
    const/4 v0, 0x0

    .line 163
    .local v0, "errorCode":I
    if-eqz p1, :cond_0

    const-string v1, ""

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 164
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 166
    :cond_0
    if-eqz p2, :cond_1

    const-string v1, ""

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 167
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    .line 169
    :cond_1
    if-eqz p1, :cond_2

    const-string v1, ""

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 170
    :cond_2
    const/16 v0, 0xbb9

    .line 188
    :cond_3
    :goto_0
    return v0

    .line 171
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v1, v2, :cond_5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v3, :cond_6

    .line 172
    :cond_5
    const/16 v0, 0xbbb

    goto :goto_0

    .line 173
    :cond_6
    const-string v1, "[a-zA-Z0-9_]*"

    invoke-static {v1, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 174
    const/16 v0, 0xbbc

    goto :goto_0

    .line 175
    :cond_7
    const-string v1, "[0-9]*"

    invoke-static {v1, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 176
    const/16 v0, 0xbbe

    goto :goto_0

    .line 177
    :cond_8
    if-eqz p2, :cond_9

    const-string v1, ""

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 178
    :cond_9
    const/16 v0, 0xfa1

    goto :goto_0

    .line 179
    :cond_a
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v1, v2, :cond_b

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v3, :cond_c

    .line 180
    :cond_b
    const/16 v0, 0xfa2

    goto :goto_0

    .line 181
    :cond_c
    const-string v1, "[a-zA-Z0-9_]*"

    invoke-static {v1, p2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_d

    .line 182
    const/16 v0, 0xfa3

    goto :goto_0

    .line 183
    :cond_d
    if-eqz p3, :cond_e

    const-string v1, ""

    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 184
    :cond_e
    const/16 v0, 0xfa4

    goto :goto_0

    .line 185
    :cond_f
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 186
    const/16 v0, 0xfa5

    goto :goto_0
.end method


# virtual methods
.method public doReg(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/taomee/pwdlogin/service/RegResponse;)V
    .locals 5
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "pwd"    # Ljava/lang/String;
    .param p3, "confirmPwd"    # Ljava/lang/String;
    .param p4, "isRemember"    # Ljava/lang/String;
    .param p5, "regResponse"    # Lcom/taomee/pwdlogin/service/RegResponse;

    .prologue
    .line 28
    iput-object p5, p0, Lcom/taomee/pwdlogin/service/RegManager;->regResponse:Lcom/taomee/pwdlogin/service/RegResponse;

    .line 29
    invoke-direct {p0, p1, p2, p3}, Lcom/taomee/pwdlogin/service/RegManager;->fieldsValid(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 30
    .local v0, "errorCode":I
    sparse-switch v0, :sswitch_data_0

    .line 71
    :goto_0
    return-void

    .line 32
    :sswitch_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 33
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 34
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    .line 35
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/RegManager;->userName:Ljava/lang/String;

    .line 36
    iput-object p2, p0, Lcom/taomee/pwdlogin/service/RegManager;->pwd:Ljava/lang/String;

    .line 37
    iput-object p4, p0, Lcom/taomee/pwdlogin/service/RegManager;->isRemember:Ljava/lang/String;

    .line 38
    new-instance v1, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;-><init>(Lcom/taomee/pwdlogin/service/RegManager;Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;)V

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/taomee/pwdlogin/service/RegManager;->userName:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/taomee/pwdlogin/service/RegManager;->pwd:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 41
    :sswitch_1
    const/16 v1, 0xbb9

    const-string v2, "\u8bf7\u8f93\u5165\u8d26\u53f7"

    invoke-interface {p5, v1, v2}, Lcom/taomee/pwdlogin/service/RegResponse;->regFail(ILjava/lang/String;)V

    goto :goto_0

    .line 44
    :sswitch_2
    const/16 v1, 0xbbb

    const-string v2, "\u8d26\u53f7\u957f\u5ea6\u4e3a6-36\u4e2a\u5b57\u7b26"

    invoke-interface {p5, v1, v2}, Lcom/taomee/pwdlogin/service/RegResponse;->regFail(ILjava/lang/String;)V

    goto :goto_0

    .line 47
    :sswitch_3
    const/16 v1, 0xbbc

    const-string v2, "\u8d26\u53f7\u542b\u6709\u975e\u6cd5\u5b57\u7b26"

    invoke-interface {p5, v1, v2}, Lcom/taomee/pwdlogin/service/RegResponse;->regFail(ILjava/lang/String;)V

    goto :goto_0

    .line 50
    :sswitch_4
    const/16 v1, 0xbbe

    const-string v2, "\u8d26\u53f7\u4e0d\u80fd\u662f\u7eaf\u6570\u5b57"

    invoke-interface {p5, v1, v2}, Lcom/taomee/pwdlogin/service/RegResponse;->regFail(ILjava/lang/String;)V

    goto :goto_0

    .line 53
    :sswitch_5
    const/16 v1, 0xfa1

    const-string v2, "\u8bf7\u8f93\u5165\u5bc6\u7801"

    invoke-interface {p5, v1, v2}, Lcom/taomee/pwdlogin/service/RegResponse;->regFail(ILjava/lang/String;)V

    goto :goto_0

    .line 56
    :sswitch_6
    const/16 v1, 0xfa2

    const-string v2, "\u5bc6\u7801\u957f\u5ea6\u4e3a6-36\u4e2a\u5b57\u7b26"

    invoke-interface {p5, v1, v2}, Lcom/taomee/pwdlogin/service/RegResponse;->regFail(ILjava/lang/String;)V

    goto :goto_0

    .line 59
    :sswitch_7
    const/16 v1, 0xfa3

    const-string v2, "\u5bc6\u7801\u542b\u6709\u975e\u6cd5\u5b57\u7b26"

    invoke-interface {p5, v1, v2}, Lcom/taomee/pwdlogin/service/RegResponse;->regFail(ILjava/lang/String;)V

    goto :goto_0

    .line 62
    :sswitch_8
    const/16 v1, 0xfa4

    const-string v2, "\u8bf7\u518d\u6b21\u8f93\u5165\u5bc6\u7801"

    invoke-interface {p5, v1, v2}, Lcom/taomee/pwdlogin/service/RegResponse;->regFail(ILjava/lang/String;)V

    goto :goto_0

    .line 65
    :sswitch_9
    const/16 v1, 0xfa5

    const-string v2, "\u4e24\u6b21\u8f93\u5165\u7684\u5bc6\u7801\u4e0d\u4e00\u81f4"

    invoke-interface {p5, v1, v2}, Lcom/taomee/pwdlogin/service/RegResponse;->regFail(ILjava/lang/String;)V

    goto :goto_0

    .line 30
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xbb9 -> :sswitch_1
        0xbbb -> :sswitch_2
        0xbbc -> :sswitch_3
        0xbbe -> :sswitch_4
        0xfa1 -> :sswitch_5
        0xfa2 -> :sswitch_6
        0xfa3 -> :sswitch_7
        0xfa4 -> :sswitch_8
        0xfa5 -> :sswitch_9
    .end sparse-switch
.end method

.method public getRegParams(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "pwd"    # Ljava/lang/String;

    .prologue
    .line 192
    invoke-static {p2}, Lcom/taomee/pwdlogin/common/Util;->MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 193
    .local v1, "pwdMd5":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "channel="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v5

    invoke-virtual {v5}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getChannel()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 194
    const-string v5, "&client_time="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const-wide/16 v7, 0x3e8

    div-long/2addr v5, v7

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 195
    const-string v5, "&game_version="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v5

    invoke-virtual {v5}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/taomee/pwdlogin/common/Util;->getVersionName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 196
    const-string v5, "&gameid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v5

    invoke-virtual {v5}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getGameId()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 197
    const-string v5, "&image_type="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "1"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 198
    const-string v5, "&passwd="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 199
    const-string v5, "&service="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "1003"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 200
    const-string v5, "&udid="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 201
    const-string v5, "&udid_type="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 193
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 203
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

    .line 204
    .local v2, "sign":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 205
    const-string v5, "&sign_type="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "MD5"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 206
    const-string v5, "&sign="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 204
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 208
    .local v0, "params":Ljava/lang/String;
    return-object v0
.end method

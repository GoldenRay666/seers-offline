.class Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;
.super Landroid/os/AsyncTask;
.source "LoginManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/taomee/pwdlogin/service/LoginManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoginASynTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/taomee/pwdlogin/service/LoginManager;


# direct methods
.method private constructor <init>(Lcom/taomee/pwdlogin/service/LoginManager;)V
    .locals 0

    .prologue
    .line 81
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/taomee/pwdlogin/service/LoginManager;Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;)V
    .locals 0

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;-><init>(Lcom/taomee/pwdlogin/service/LoginManager;)V

    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    .line 93
    const-string v1, ""

    .line 97
    .local v1, "result":Ljava/lang/String;
    :try_start_0
    sget-object v2, Lcom/taomee/pwdlogin/common/GlobalVars;->LOGIN_URL:Ljava/lang/String;

    .line 98
    iget-object v3, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    const/4 v4, 0x0

    aget-object v4, p1, v4

    const/4 v5, 0x1

    aget-object v5, p1, v5

    invoke-virtual {v3, v4, v5}, Lcom/taomee/pwdlogin/service/LoginManager;->getLoginParams(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 97
    invoke-static {v2, v3}, Lcom/taomee/pwdlogin/common/Util;->httpGet(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 102
    :goto_0
    return-object v1

    .line 99
    :catch_0
    move-exception v0

    .line 100
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, ""

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 7
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 107
    const-string v4, "MobileLogin"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "result---"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$2(Lcom/taomee/pwdlogin/service/LoginManager;)Landroid/app/ProgressDialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/ProgressDialog;->dismiss()V

    .line 109
    const-string v4, ""

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 110
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$3(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/service/LoginResponse;

    move-result-object v4

    const/16 v5, 0x3e9

    .line 111
    const-string v6, "\u7f51\u7edc\u4e0d\u7ed9\u529b\uff0c\u8bf7\u518d\u8bd5\u4e00\u6b21"

    .line 110
    invoke-interface {v4, v5, v6}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginFail(ILjava/lang/String;)V

    .line 134
    :goto_0
    return-void

    .line 113
    :cond_0
    const-string v4, "status_code"

    invoke-static {p1, v4}, Lcom/taomee/pwdlogin/common/Util;->doJson(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 114
    .local v2, "status_code":Ljava/lang/String;
    const-string v4, "0"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 115
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$4(Lcom/taomee/pwdlogin/service/LoginManager;)Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, "pwdMd5":Ljava/lang/String;
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$4(Lcom/taomee/pwdlogin/service/LoginManager;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/taomee/pwdlogin/common/Util;->MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/taomee/pwdlogin/common/Util;->MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 119
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$5(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/data/LoginRecordsData;

    move-result-object v4

    iget-object v5, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v5}, Lcom/taomee/pwdlogin/service/LoginManager;->access$6(Lcom/taomee/pwdlogin/service/LoginManager;)Ljava/lang/String;

    move-result-object v5

    .line 120
    iget-object v6, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v6}, Lcom/taomee/pwdlogin/service/LoginManager;->access$7(Lcom/taomee/pwdlogin/service/LoginManager;)Ljava/lang/String;

    move-result-object v6

    .line 119
    invoke-virtual {v4, v5, v0, v6}, Lcom/taomee/pwdlogin/data/LoginRecordsData;->addLoginRecord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    const-string v4, "user_id"

    invoke-static {p1, v4}, Lcom/taomee/pwdlogin/common/Util;->doJson(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 122
    .local v3, "userid":Ljava/lang/String;
    const-string v4, "session"

    invoke-static {p1, v4}, Lcom/taomee/pwdlogin/common/Util;->doJson(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 123
    .local v1, "session":Ljava/lang/String;
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$3(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/service/LoginResponse;

    move-result-object v4

    iget-object v5, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v5}, Lcom/taomee/pwdlogin/service/LoginManager;->access$6(Lcom/taomee/pwdlogin/service/LoginManager;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v3, v1}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginSuc(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 125
    .end local v0    # "pwdMd5":Ljava/lang/String;
    .end local v1    # "session":Ljava/lang/String;
    .end local v3    # "userid":Ljava/lang/String;
    :cond_1
    const-string v4, "1103"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 126
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$3(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/service/LoginResponse;

    move-result-object v4

    const/16 v5, 0xfa6

    const-string v6, "\u5bc6\u7801\u4e0d\u6b63\u786e"

    invoke-interface {v4, v5, v6}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginFail(ILjava/lang/String;)V

    goto :goto_0

    .line 127
    :cond_2
    const-string v4, "1105"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 128
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$3(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/service/LoginResponse;

    move-result-object v4

    const/16 v5, 0xbbd

    const-string v6, "\u8d26\u53f7\u4e0d\u5b58\u5728"

    invoke-interface {v4, v5, v6}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginFail(ILjava/lang/String;)V

    goto :goto_0

    .line 130
    :cond_3
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$3(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/service/LoginResponse;

    move-result-object v4

    const/16 v5, 0x7d1

    const-string v6, "\u7cfb\u7edf\u9519\u8bef"

    invoke-interface {v4, v5, v6}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginFail(ILjava/lang/String;)V

    goto/16 :goto_0
.end method

.method protected onPreExecute()V
    .locals 3

    .prologue
    .line 85
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 86
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    new-instance v1, Landroid/app/ProgressDialog;

    iget-object v2, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v2}, Lcom/taomee/pwdlogin/service/LoginManager;->access$0(Lcom/taomee/pwdlogin/service/LoginManager;)Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    invoke-static {v0, v1}, Lcom/taomee/pwdlogin/service/LoginManager;->access$1(Lcom/taomee/pwdlogin/service/LoginManager;Landroid/app/ProgressDialog;)V

    .line 87
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v0}, Lcom/taomee/pwdlogin/service/LoginManager;->access$2(Lcom/taomee/pwdlogin/service/LoginManager;)Landroid/app/ProgressDialog;

    move-result-object v0

    const-string v1, "\u52a0\u8f7d\u4e2d..."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 88
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginManager$LoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v0}, Lcom/taomee/pwdlogin/service/LoginManager;->access$2(Lcom/taomee/pwdlogin/service/LoginManager;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 89
    return-void
.end method

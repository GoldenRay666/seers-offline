.class public Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;
.super Landroid/os/AsyncTask;
.source "LoginManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/taomee/pwdlogin/service/LoginManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AutoLoginASynTask"
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
.method public constructor <init>(Lcom/taomee/pwdlogin/service/LoginManager;)V
    .locals 0

    .prologue
    .line 144
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    .line 156
    const-wide/16 v3, 0x7d0

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    :goto_0
    const-string v2, ""

    .line 165
    .local v2, "result":Ljava/lang/String;
    :try_start_1
    sget-object v3, Lcom/taomee/pwdlogin/common/GlobalVars;->LOGIN_URL:Ljava/lang/String;

    .line 166
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    const/4 v5, 0x0

    aget-object v5, p1, v5

    const/4 v6, 0x1

    aget-object v6, p1, v6

    invoke-virtual {v4, v5, v6}, Lcom/taomee/pwdlogin/service/LoginManager;->getLoginParams(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 165
    invoke-static {v3, v4}, Lcom/taomee/pwdlogin/common/Util;->httpGet(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    .line 170
    :goto_1
    return-object v2

    .line 157
    .end local v2    # "result":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 159
    .local v1, "e1":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 167
    .end local v1    # "e1":Ljava/lang/InterruptedException;
    .restart local v2    # "result":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 168
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, ""

    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 7
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 175
    const-string v4, "MobileLogin"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "result---"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$9(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/view/LoadingDialog;

    move-result-object v4

    invoke-virtual {v4}, Lcom/taomee/pwdlogin/view/LoadingDialog;->dismiss()V

    .line 177
    const-string v4, ""

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 178
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$3(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/service/LoginResponse;

    move-result-object v4

    const/16 v5, 0x3e9

    .line 179
    const-string v6, "\u7f51\u7edc\u4e0d\u7ed9\u529b\uff0c\u8bf7\u518d\u8bd5\u4e00\u6b21"

    .line 178
    invoke-interface {v4, v5, v6}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginFail(ILjava/lang/String;)V

    .line 199
    :goto_0
    return-void

    .line 181
    :cond_0
    const-string v4, "status_code"

    invoke-static {p1, v4}, Lcom/taomee/pwdlogin/common/Util;->doJson(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 182
    .local v2, "status_code":Ljava/lang/String;
    const-string v4, "0"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 183
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$4(Lcom/taomee/pwdlogin/service/LoginManager;)Ljava/lang/String;

    move-result-object v0

    .line 184
    .local v0, "pwdMd5":Ljava/lang/String;
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$5(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/data/LoginRecordsData;

    move-result-object v4

    iget-object v5, p0, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v5}, Lcom/taomee/pwdlogin/service/LoginManager;->access$6(Lcom/taomee/pwdlogin/service/LoginManager;)Ljava/lang/String;

    move-result-object v5

    .line 185
    iget-object v6, p0, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v6}, Lcom/taomee/pwdlogin/service/LoginManager;->access$7(Lcom/taomee/pwdlogin/service/LoginManager;)Ljava/lang/String;

    move-result-object v6

    .line 184
    invoke-virtual {v4, v5, v0, v6}, Lcom/taomee/pwdlogin/data/LoginRecordsData;->addLoginRecord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    const-string v4, "user_id"

    invoke-static {p1, v4}, Lcom/taomee/pwdlogin/common/Util;->doJson(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 187
    .local v3, "userid":Ljava/lang/String;
    const-string v4, "session"

    invoke-static {p1, v4}, Lcom/taomee/pwdlogin/common/Util;->doJson(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 188
    .local v1, "session":Ljava/lang/String;
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$3(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/service/LoginResponse;

    move-result-object v4

    iget-object v5, p0, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v5}, Lcom/taomee/pwdlogin/service/LoginManager;->access$6(Lcom/taomee/pwdlogin/service/LoginManager;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v3, v1}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginSuc(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 190
    .end local v0    # "pwdMd5":Ljava/lang/String;
    .end local v1    # "session":Ljava/lang/String;
    .end local v3    # "userid":Ljava/lang/String;
    :cond_1
    const-string v4, "1103"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 191
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$3(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/service/LoginResponse;

    move-result-object v4

    const/16 v5, 0xfa6

    const-string v6, "\u5bc6\u7801\u4e0d\u6b63\u786e"

    invoke-interface {v4, v5, v6}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginFail(ILjava/lang/String;)V

    goto :goto_0

    .line 192
    :cond_2
    const-string v4, "1105"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 193
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$3(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/service/LoginResponse;

    move-result-object v4

    const/16 v5, 0xbbd

    const-string v6, "\u8d26\u53f7\u4e0d\u5b58\u5728"

    invoke-interface {v4, v5, v6}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginFail(ILjava/lang/String;)V

    goto :goto_0

    .line 195
    :cond_3
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v4}, Lcom/taomee/pwdlogin/service/LoginManager;->access$3(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/service/LoginResponse;

    move-result-object v4

    const/16 v5, 0x7d1

    const-string v6, "\u7cfb\u7edf\u9519\u8bef"

    invoke-interface {v4, v5, v6}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginFail(ILjava/lang/String;)V

    goto :goto_0
.end method

.method protected onPreExecute()V
    .locals 3

    .prologue
    .line 148
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 149
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    new-instance v1, Lcom/taomee/pwdlogin/view/LoadingDialog;

    iget-object v2, p0, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v2}, Lcom/taomee/pwdlogin/service/LoginManager;->access$0(Lcom/taomee/pwdlogin/service/LoginManager;)Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/taomee/pwdlogin/view/LoadingDialog;-><init>(Landroid/app/Activity;)V

    invoke-static {v0, v1}, Lcom/taomee/pwdlogin/service/LoginManager;->access$8(Lcom/taomee/pwdlogin/service/LoginManager;Lcom/taomee/pwdlogin/view/LoadingDialog;)V

    .line 150
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->this$0:Lcom/taomee/pwdlogin/service/LoginManager;

    invoke-static {v0}, Lcom/taomee/pwdlogin/service/LoginManager;->access$9(Lcom/taomee/pwdlogin/service/LoginManager;)Lcom/taomee/pwdlogin/view/LoadingDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/taomee/pwdlogin/view/LoadingDialog;->show()V

    .line 151
    return-void
.end method

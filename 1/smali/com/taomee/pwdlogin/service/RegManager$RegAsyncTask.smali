.class Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;
.super Landroid/os/AsyncTask;
.source "RegManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/taomee/pwdlogin/service/RegManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RegAsyncTask"
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
.field final synthetic this$0:Lcom/taomee/pwdlogin/service/RegManager;


# direct methods
.method private constructor <init>(Lcom/taomee/pwdlogin/service/RegManager;)V
    .locals 0

    .prologue
    .line 109
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/taomee/pwdlogin/service/RegManager;Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;)V
    .locals 0

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;-><init>(Lcom/taomee/pwdlogin/service/RegManager;)V

    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    .line 121
    const-string v1, ""

    .line 124
    .local v1, "result":Ljava/lang/String;
    :try_start_0
    sget-object v2, Lcom/taomee/pwdlogin/common/GlobalVars;->LOGIN_URL:Ljava/lang/String;

    iget-object v3, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    const/4 v4, 0x0

    aget-object v4, p1, v4

    const/4 v5, 0x1

    aget-object v5, p1, v5

    invoke-virtual {v3, v4, v5}, Lcom/taomee/pwdlogin/service/RegManager;->getRegParams(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/taomee/pwdlogin/common/Util;->httpGet(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 128
    :goto_0
    return-object v1

    .line 125
    :catch_0
    move-exception v0

    .line 126
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, ""

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 6
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 134
    iget-object v3, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    invoke-static {v3}, Lcom/taomee/pwdlogin/service/RegManager;->access$2(Lcom/taomee/pwdlogin/service/RegManager;)Landroid/app/ProgressDialog;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/ProgressDialog;->dismiss()V

    .line 135
    const-string v3, ""

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 136
    iget-object v3, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    invoke-static {v3}, Lcom/taomee/pwdlogin/service/RegManager;->access$3(Lcom/taomee/pwdlogin/service/RegManager;)Lcom/taomee/pwdlogin/service/RegResponse;

    move-result-object v3

    const/16 v4, 0x3e9

    const-string v5, "\u7f51\u7edc\u4e0d\u7ed9\u529b\uff0c\u8bf7\u518d\u8bd5\u4e00\u6b21"

    invoke-interface {v3, v4, v5}, Lcom/taomee/pwdlogin/service/RegResponse;->regFail(ILjava/lang/String;)V

    .line 157
    :goto_0
    return-void

    .line 138
    :cond_0
    const-string v3, "status_code"

    invoke-static {p1, v3}, Lcom/taomee/pwdlogin/common/Util;->doJson(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 139
    .local v1, "status_code":Ljava/lang/String;
    const-string v3, "0"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 140
    iget-object v3, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    iget-object v3, v3, Lcom/taomee/pwdlogin/service/RegManager;->pwd:Ljava/lang/String;

    invoke-static {v3}, Lcom/taomee/pwdlogin/common/Util;->MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/taomee/pwdlogin/common/Util;->MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 141
    .local v0, "pwdMd5":Ljava/lang/String;
    iget-object v3, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    invoke-static {v3}, Lcom/taomee/pwdlogin/service/RegManager;->access$4(Lcom/taomee/pwdlogin/service/RegManager;)Lcom/taomee/pwdlogin/data/LoginRecordsData;

    move-result-object v3

    iget-object v4, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    iget-object v4, v4, Lcom/taomee/pwdlogin/service/RegManager;->userName:Ljava/lang/String;

    iget-object v5, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    iget-object v5, v5, Lcom/taomee/pwdlogin/service/RegManager;->isRemember:Ljava/lang/String;

    invoke-virtual {v3, v4, v0, v5}, Lcom/taomee/pwdlogin/data/LoginRecordsData;->addLoginRecord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    const-string v3, "reg_userid"

    invoke-static {p1, v3}, Lcom/taomee/pwdlogin/common/Util;->doJson(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 143
    .local v2, "userid":Ljava/lang/String;
    iget-object v3, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    invoke-static {v3}, Lcom/taomee/pwdlogin/service/RegManager;->access$3(Lcom/taomee/pwdlogin/service/RegManager;)Lcom/taomee/pwdlogin/service/RegResponse;

    move-result-object v3

    iget-object v4, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    iget-object v4, v4, Lcom/taomee/pwdlogin/service/RegManager;->userName:Ljava/lang/String;

    invoke-interface {v3, v4, v2}, Lcom/taomee/pwdlogin/service/RegResponse;->regSuc(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 144
    .end local v0    # "pwdMd5":Ljava/lang/String;
    .end local v2    # "userid":Ljava/lang/String;
    :cond_1
    const-string v3, "20006"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 145
    iget-object v3, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    invoke-static {v3}, Lcom/taomee/pwdlogin/service/RegManager;->access$3(Lcom/taomee/pwdlogin/service/RegManager;)Lcom/taomee/pwdlogin/service/RegResponse;

    move-result-object v3

    const/16 v4, 0xbba

    const-string v5, "\u8d26\u53f7\u5df2\u88ab\u6ce8\u518c"

    invoke-interface {v3, v4, v5}, Lcom/taomee/pwdlogin/service/RegResponse;->regFail(ILjava/lang/String;)V

    goto :goto_0

    .line 146
    :cond_2
    const-string v3, "20007"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 147
    iget-object v3, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    invoke-static {v3}, Lcom/taomee/pwdlogin/service/RegManager;->access$3(Lcom/taomee/pwdlogin/service/RegManager;)Lcom/taomee/pwdlogin/service/RegResponse;

    move-result-object v3

    const/16 v4, 0xbbb

    const-string v5, "\u8d26\u53f7\u957f\u5ea6\u4e3a6-36\u4e2a\u5b57\u7b26"

    invoke-interface {v3, v4, v5}, Lcom/taomee/pwdlogin/service/RegResponse;->regFail(ILjava/lang/String;)V

    goto :goto_0

    .line 148
    :cond_3
    const-string v3, "20008"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 149
    iget-object v3, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    invoke-static {v3}, Lcom/taomee/pwdlogin/service/RegManager;->access$3(Lcom/taomee/pwdlogin/service/RegManager;)Lcom/taomee/pwdlogin/service/RegResponse;

    move-result-object v3

    const/16 v4, 0xbbc

    const-string v5, "\u8d26\u53f7\u542b\u6709\u975e\u6cd5\u5b57\u7b26"

    invoke-interface {v3, v4, v5}, Lcom/taomee/pwdlogin/service/RegResponse;->regFail(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 150
    :cond_4
    const-string v3, "1113"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 151
    iget-object v3, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    invoke-static {v3}, Lcom/taomee/pwdlogin/service/RegManager;->access$3(Lcom/taomee/pwdlogin/service/RegManager;)Lcom/taomee/pwdlogin/service/RegResponse;

    move-result-object v3

    const/16 v4, 0xbbe

    const-string v5, "\u8d26\u53f7\u4e0d\u80fd\u662f\u7eaf\u6570\u5b57"

    invoke-interface {v3, v4, v5}, Lcom/taomee/pwdlogin/service/RegResponse;->regFail(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 153
    :cond_5
    iget-object v3, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    invoke-static {v3}, Lcom/taomee/pwdlogin/service/RegManager;->access$3(Lcom/taomee/pwdlogin/service/RegManager;)Lcom/taomee/pwdlogin/service/RegResponse;

    move-result-object v3

    const/16 v4, 0x7d1

    const-string v5, "\u7cfb\u7edf\u9519\u8bef"

    invoke-interface {v3, v4, v5}, Lcom/taomee/pwdlogin/service/RegResponse;->regFail(ILjava/lang/String;)V

    goto/16 :goto_0
.end method

.method protected onPreExecute()V
    .locals 3

    .prologue
    .line 113
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 114
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    new-instance v1, Landroid/app/ProgressDialog;

    iget-object v2, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    invoke-static {v2}, Lcom/taomee/pwdlogin/service/RegManager;->access$0(Lcom/taomee/pwdlogin/service/RegManager;)Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    invoke-static {v0, v1}, Lcom/taomee/pwdlogin/service/RegManager;->access$1(Lcom/taomee/pwdlogin/service/RegManager;Landroid/app/ProgressDialog;)V

    .line 115
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    invoke-static {v0}, Lcom/taomee/pwdlogin/service/RegManager;->access$2(Lcom/taomee/pwdlogin/service/RegManager;)Landroid/app/ProgressDialog;

    move-result-object v0

    const-string v1, "\u52a0\u8f7d\u4e2d..."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 116
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/RegManager$RegAsyncTask;->this$0:Lcom/taomee/pwdlogin/service/RegManager;

    invoke-static {v0}, Lcom/taomee/pwdlogin/service/RegManager;->access$2(Lcom/taomee/pwdlogin/service/RegManager;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 117
    return-void
.end method

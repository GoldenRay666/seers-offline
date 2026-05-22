.class public Lcom/taomee/pwdlogin/service/AccountManager;
.super Ljava/lang/Object;
.source "AccountManager.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static accountManagerPageShow(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "userId"    # Ljava/lang/String;
    .param p2, "session"    # Ljava/lang/String;

    .prologue
    .line 12
    const-string v5, ""

    .line 13
    .local v5, "urlString":Ljava/lang/String;
    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v6

    invoke-virtual {v6}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getGameId()I

    move-result v0

    .line 14
    .local v0, "gid":I
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    const-string v6, ""

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string v6, ""

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 15
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "http://maccount.61.com/?gid="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 21
    :goto_0
    new-instance v1, Landroid/content/Intent;

    const-string v6, "android.intent.action.VIEW"

    invoke-direct {v1, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 22
    .local v1, "intent":Landroid/content/Intent;
    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 23
    .local v4, "uri":Landroid/net/Uri;
    invoke-virtual {v1, v4}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 24
    invoke-virtual {p0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 25
    return-void

    .line 17
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v4    # "uri":Landroid/net/Uri;
    :cond_1
    const/4 v6, 0x0

    invoke-static {p2, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2

    .line 18
    .local v2, "sessionByteArray":[B
    invoke-static {v2}, Lcom/taomee/pwdlogin/common/Util;->byte2hex([B)Ljava/lang/String;

    move-result-object v3

    .line 19
    .local v3, "sessionHex":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "http://maccount.61.com/?uid="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "&gid="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "&session="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method

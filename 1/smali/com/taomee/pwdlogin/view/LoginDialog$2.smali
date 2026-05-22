.class Lcom/taomee/pwdlogin/view/LoginDialog$2;
.super Ljava/lang/Object;
.source "LoginDialog.java"

# interfaces
.implements Lcom/taomee/pwdlogin/service/LoginResponse;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/pwdlogin/view/LoginDialog;->onLogin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/taomee/pwdlogin/view/LoginDialog;


# direct methods
.method constructor <init>(Lcom/taomee/pwdlogin/view/LoginDialog;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/taomee/pwdlogin/view/LoginDialog$2;->this$0:Lcom/taomee/pwdlogin/view/LoginDialog;

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public loginFail(ILjava/lang/String;)V
    .locals 2
    .param p1, "errorCode"    # I
    .param p2, "errorInfo"    # Ljava/lang/String;

    .prologue
    .line 155
    iget-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog$2;->this$0:Lcom/taomee/pwdlogin/view/LoginDialog;

    invoke-virtual {v0}, Lcom/taomee/pwdlogin/view/LoginDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 156
    const/4 v1, 0x1

    .line 155
    invoke-static {v0, p2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 156
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 157
    return-void
.end method

.method public loginSuc(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "userId"    # Ljava/lang/String;
    .param p3, "session"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 136
    iget-object v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog$2;->this$0:Lcom/taomee/pwdlogin/view/LoginDialog;

    invoke-virtual {v4}, Lcom/taomee/pwdlogin/view/LoginDialog;->dismiss()V

    .line 137
    iget-object v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog$2;->this$0:Lcom/taomee/pwdlogin/view/LoginDialog;

    invoke-virtual {v4}, Lcom/taomee/pwdlogin/view/LoginDialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    .line 138
    .local v0, "layoutInflater":Landroid/view/LayoutInflater;
    sget v4, Lcom/example/taomeeaccount/R$layout;->tm_account_login_suc:I

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 139
    .local v1, "loginSucView":Landroid/view/View;
    sget v4, Lcom/example/taomeeaccount/R$id;->userNameTextView:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 140
    .local v3, "userNameTextView":Landroid/widget/TextView;
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    new-instance v2, Landroid/widget/Toast;

    iget-object v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog$2;->this$0:Lcom/taomee/pwdlogin/view/LoginDialog;

    invoke-virtual {v4}, Lcom/taomee/pwdlogin/view/LoginDialog;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/widget/Toast;-><init>(Landroid/content/Context;)V

    .line 142
    .local v2, "toast":Landroid/widget/Toast;
    invoke-virtual {v2, v1}, Landroid/widget/Toast;->setView(Landroid/view/View;)V

    .line 143
    const/4 v4, 0x7

    invoke-virtual {v2, v4, v6, v6}, Landroid/widget/Toast;->setGravity(III)V

    .line 144
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/widget/Toast;->setDuration(I)V

    .line 145
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 146
    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->setUserName(Ljava/lang/String;)V

    .line 147
    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v4

    invoke-virtual {v4, p2}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->setUserId(Ljava/lang/String;)V

    .line 148
    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v4

    invoke-virtual {v4, p3}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->setSession(Ljava/lang/String;)V

    .line 149
    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v4

    invoke-virtual {v4}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getmLoginResponse()Lcom/taomee/pwdlogin/service/LoginResponse;

    move-result-object v4

    invoke-interface {v4, p1, p2, p3}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginSuc(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    return-void
.end method

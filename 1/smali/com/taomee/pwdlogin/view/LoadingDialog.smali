.class public Lcom/taomee/pwdlogin/view/LoadingDialog;
.super Landroid/app/Dialog;
.source "LoadingDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private accountSwitchImage:Landroid/widget/ImageView;

.field private activity:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 18
    sget v0, Lcom/example/taomeeaccount/R$style;->tm_account_dialog_theme:I

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 19
    iput-object p1, p0, Lcom/taomee/pwdlogin/view/LoadingDialog;->activity:Landroid/app/Activity;

    .line 20
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 35
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    sget v2, Lcom/example/taomeeaccount/R$id;->tm_account_switch:I

    if-ne v1, v2, :cond_0

    .line 36
    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v1

    invoke-virtual {v1}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getmLoginManager()Lcom/taomee/pwdlogin/service/LoginManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/taomee/pwdlogin/service/LoginManager;->getmAutoLoginASynTask()Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/taomee/pwdlogin/service/LoginManager$AutoLoginASynTask;->cancel(Z)Z

    .line 37
    invoke-virtual {p0}, Lcom/taomee/pwdlogin/view/LoadingDialog;->dismiss()V

    .line 38
    new-instance v0, Lcom/taomee/pwdlogin/view/LoginDialog;

    iget-object v1, p0, Lcom/taomee/pwdlogin/view/LoadingDialog;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/taomee/pwdlogin/view/LoginDialog;-><init>(Landroid/app/Activity;)V

    .line 39
    .local v0, "loginDialog":Lcom/taomee/pwdlogin/view/LoginDialog;
    invoke-virtual {v0}, Lcom/taomee/pwdlogin/view/LoginDialog;->show()V

    .line 41
    .end local v0    # "loginDialog":Lcom/taomee/pwdlogin/view/LoginDialog;
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 24
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 25
    sget v1, Lcom/example/taomeeaccount/R$layout;->tm_account_login_loading:I

    invoke-virtual {p0, v1}, Lcom/taomee/pwdlogin/view/LoadingDialog;->setContentView(I)V

    .line 27
    sget v1, Lcom/example/taomeeaccount/R$id;->tm_account_switch:I

    invoke-virtual {p0, v1}, Lcom/taomee/pwdlogin/view/LoadingDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/taomee/pwdlogin/view/LoadingDialog;->accountSwitchImage:Landroid/widget/ImageView;

    .line 28
    iget-object v1, p0, Lcom/taomee/pwdlogin/view/LoadingDialog;->accountSwitchImage:Landroid/widget/ImageView;

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    sget v1, Lcom/example/taomeeaccount/R$id;->userNameTextView:I

    invoke-virtual {p0, v1}, Lcom/taomee/pwdlogin/view/LoadingDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 30
    .local v0, "userNameTextView":Landroid/widget/TextView;
    invoke-static {}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getInstance()Lcom/taomee/pwdlogin/service/TaomeeLogin;

    move-result-object v1

    invoke-virtual {v1}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->getUserName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    return-void
.end method

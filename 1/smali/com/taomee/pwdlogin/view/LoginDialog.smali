.class public Lcom/taomee/pwdlogin/view/LoginDialog;
.super Landroid/app/Dialog;
.source "LoginDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private accountEditText:Landroid/widget/EditText;

.field private activity:Landroid/app/Activity;

.field private forgetPwdTextView:Landroid/widget/TextView;

.field private loginImageView:Landroid/widget/ImageView;

.field private pwdEditText:Landroid/widget/EditText;

.field private regImageView:Landroid/widget/ImageView;

.field private rememberPwdFlag:Z

.field private removeImageView:Landroid/widget/ImageView;

.field private selectImageView:Landroid/widget/ImageView;

.field private selectTextView:Landroid/widget/TextView;

.field private textWatcher:Landroid/text/TextWatcher;

.field private titleImageView:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 36
    sget v0, Lcom/example/taomeeaccount/R$style;->tm_account_dialog_theme:I

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 33
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->rememberPwdFlag:Z

    .line 101
    new-instance v0, Lcom/taomee/pwdlogin/view/LoginDialog$1;

    invoke-direct {v0, p0}, Lcom/taomee/pwdlogin/view/LoginDialog$1;-><init>(Lcom/taomee/pwdlogin/view/LoginDialog;)V

    iput-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->textWatcher:Landroid/text/TextWatcher;

    .line 37
    iput-object p1, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->activity:Landroid/app/Activity;

    .line 38
    return-void
.end method

.method static synthetic access$0(Lcom/taomee/pwdlogin/view/LoginDialog;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->accountEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$1(Lcom/taomee/pwdlogin/view/LoginDialog;)Landroid/widget/ImageView;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->removeImageView:Landroid/widget/ImageView;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x0

    .line 68
    iget-object v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->removeImageView:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getId()I

    move-result v4

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    if-ne v4, v5, :cond_0

    .line 69
    iget-object v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->accountEditText:Landroid/widget/EditText;

    const-string v5, ""

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 71
    :cond_0
    iget-object v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->selectImageView:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getId()I

    move-result v4

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    if-eq v4, v5, :cond_1

    .line 72
    iget-object v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->selectTextView:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getId()I

    move-result v4

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    if-ne v4, v5, :cond_2

    .line 73
    :cond_1
    iget-boolean v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->rememberPwdFlag:Z

    if-eqz v4, :cond_7

    .line 74
    iget-object v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->selectImageView:Landroid/widget/ImageView;

    sget v5, Lcom/example/taomeeaccount/R$drawable;->tm_btn_unselect:I

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 75
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->rememberPwdFlag:Z

    .line 81
    :cond_2
    :goto_0
    iget-object v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->forgetPwdTextView:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getId()I

    move-result v4

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    if-ne v4, v5, :cond_3

    .line 82
    iget-object v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->activity:Landroid/app/Activity;

    invoke-static {v4, v6, v6}, Lcom/taomee/pwdlogin/service/AccountManager;->accountManagerPageShow(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    :cond_3
    iget-object v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->regImageView:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getId()I

    move-result v4

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    if-ne v4, v5, :cond_4

    .line 85
    invoke-virtual {p0}, Lcom/taomee/pwdlogin/view/LoginDialog;->dismiss()V

    .line 86
    new-instance v2, Lcom/taomee/pwdlogin/view/RegDialog;

    iget-object v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->activity:Landroid/app/Activity;

    invoke-direct {v2, v4}, Lcom/taomee/pwdlogin/view/RegDialog;-><init>(Landroid/app/Activity;)V

    .line 87
    .local v2, "regDialog":Lcom/taomee/pwdlogin/view/RegDialog;
    invoke-virtual {v2}, Lcom/taomee/pwdlogin/view/RegDialog;->show()V

    .line 89
    .end local v2    # "regDialog":Lcom/taomee/pwdlogin/view/RegDialog;
    :cond_4
    iget-object v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->loginImageView:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getId()I

    move-result v4

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    if-ne v4, v5, :cond_6

    .line 90
    iget-object v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->accountEditText:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    .line 91
    .local v3, "userName":Ljava/lang/String;
    iget-object v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->pwdEditText:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    .line 92
    .local v1, "pwd":Ljava/lang/String;
    const-string v0, "no"

    .line 93
    .local v0, "isRemember":Ljava/lang/String;
    iget-boolean v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->rememberPwdFlag:Z

    if-eqz v4, :cond_5

    .line 94
    const-string v0, "yes"

    .line 96
    :cond_5
    invoke-virtual {p0, v3, v1, v0}, Lcom/taomee/pwdlogin/view/LoginDialog;->onLogin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .end local v0    # "isRemember":Ljava/lang/String;
    .end local v1    # "pwd":Ljava/lang/String;
    .end local v3    # "userName":Ljava/lang/String;
    :cond_6
    return-void

    .line 77
    :cond_7
    iget-object v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->selectImageView:Landroid/widget/ImageView;

    sget v5, Lcom/example/taomeeaccount/R$drawable;->tm_btn_selected:I

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 78
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->rememberPwdFlag:Z

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x1

    .line 42
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 43
    sget v0, Lcom/example/taomeeaccount/R$layout;->tm_account_login:I

    invoke-virtual {p0, v0}, Lcom/taomee/pwdlogin/view/LoginDialog;->setContentView(I)V

    .line 45
    sget v0, Lcom/example/taomeeaccount/R$id;->tm_account_title_image:I

    invoke-virtual {p0, v0}, Lcom/taomee/pwdlogin/view/LoginDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->titleImageView:Landroid/widget/ImageView;

    .line 46
    sget v0, Lcom/example/taomeeaccount/R$id;->tm_account_edittext:I

    invoke-virtual {p0, v0}, Lcom/taomee/pwdlogin/view/LoginDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->accountEditText:Landroid/widget/EditText;

    .line 47
    sget v0, Lcom/example/taomeeaccount/R$id;->tm_account_pwd_edittext:I

    invoke-virtual {p0, v0}, Lcom/taomee/pwdlogin/view/LoginDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->pwdEditText:Landroid/widget/EditText;

    .line 48
    sget v0, Lcom/example/taomeeaccount/R$id;->tm_account_close_input:I

    invoke-virtual {p0, v0}, Lcom/taomee/pwdlogin/view/LoginDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->removeImageView:Landroid/widget/ImageView;

    .line 49
    sget v0, Lcom/example/taomeeaccount/R$id;->tm_account_selected:I

    invoke-virtual {p0, v0}, Lcom/taomee/pwdlogin/view/LoginDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->selectImageView:Landroid/widget/ImageView;

    .line 50
    sget v0, Lcom/example/taomeeaccount/R$id;->tm_account_selected_text:I

    invoke-virtual {p0, v0}, Lcom/taomee/pwdlogin/view/LoginDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->selectTextView:Landroid/widget/TextView;

    .line 51
    sget v0, Lcom/example/taomeeaccount/R$id;->tm_account_forget_pwd:I

    invoke-virtual {p0, v0}, Lcom/taomee/pwdlogin/view/LoginDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->forgetPwdTextView:Landroid/widget/TextView;

    .line 52
    sget v0, Lcom/example/taomeeaccount/R$id;->tm_account_reg:I

    invoke-virtual {p0, v0}, Lcom/taomee/pwdlogin/view/LoginDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->regImageView:Landroid/widget/ImageView;

    .line 53
    sget v0, Lcom/example/taomeeaccount/R$id;->tm_account_login:I

    invoke-virtual {p0, v0}, Lcom/taomee/pwdlogin/view/LoginDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->loginImageView:Landroid/widget/ImageView;

    .line 54
    iget-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->loginImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    iget-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->regImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    iget-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->forgetPwdTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    iget-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->selectTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    iget-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->selectImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    iget-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->removeImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    iget-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->accountEditText:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->textWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 61
    iget-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->titleImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setFocusable(Z)V

    .line 62
    iget-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->titleImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setFocusableInTouchMode(Z)V

    .line 63
    iget-object v0, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->titleImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->requestFocus()Z

    .line 64
    return-void
.end method

.method public onLogin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "pwd"    # Ljava/lang/String;
    .param p3, "isRemember"    # Ljava/lang/String;

    .prologue
    .line 129
    new-instance v0, Lcom/taomee/pwdlogin/service/LoginManager;

    iget-object v1, p0, Lcom/taomee/pwdlogin/view/LoginDialog;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/taomee/pwdlogin/service/LoginManager;-><init>(Landroid/app/Activity;)V

    .line 130
    .local v0, "loginManager":Lcom/taomee/pwdlogin/service/LoginManager;
    const/4 v4, 0x0

    .line 131
    new-instance v5, Lcom/taomee/pwdlogin/view/LoginDialog$2;

    invoke-direct {v5, p0}, Lcom/taomee/pwdlogin/view/LoginDialog$2;-><init>(Lcom/taomee/pwdlogin/view/LoginDialog;)V

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    .line 130
    invoke-virtual/range {v0 .. v5}, Lcom/taomee/pwdlogin/service/LoginManager;->doLogin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/taomee/pwdlogin/service/LoginResponse;)V

    .line 159
    return-void
.end method

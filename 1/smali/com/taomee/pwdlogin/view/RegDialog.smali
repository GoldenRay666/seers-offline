.class public Lcom/taomee/pwdlogin/view/RegDialog;
.super Landroid/app/Dialog;
.source "RegDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private activity:Landroid/app/Activity;

.field private loginBtnImageView:Landroid/widget/ImageView;

.field private regBtnImageView:Landroid/widget/ImageView;

.field private titleImageView:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 24
    sget v0, Lcom/example/taomeeaccount/R$style;->tm_account_dialog_theme:I

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 25
    iput-object p1, p0, Lcom/taomee/pwdlogin/view/RegDialog;->activity:Landroid/app/Activity;

    .line 26
    return-void
.end method

.method static synthetic access$0(Lcom/taomee/pwdlogin/view/RegDialog;)Landroid/app/Activity;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/taomee/pwdlogin/view/RegDialog;->activity:Landroid/app/Activity;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 10
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 50
    iget-object v4, p0, Lcom/taomee/pwdlogin/view/RegDialog;->regBtnImageView:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getId()I

    move-result v4

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    if-ne v4, v5, :cond_0

    .line 51
    sget v4, Lcom/example/taomeeaccount/R$id;->username:I

    invoke-virtual {p0, v4}, Lcom/taomee/pwdlogin/view/RegDialog;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    .line 52
    .local v9, "usernameEditText":Landroid/widget/EditText;
    sget v4, Lcom/example/taomeeaccount/R$id;->pwd:I

    invoke-virtual {p0, v4}, Lcom/taomee/pwdlogin/view/RegDialog;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/EditText;

    .line 53
    .local v8, "pwdEditText":Landroid/widget/EditText;
    sget v4, Lcom/example/taomeeaccount/R$id;->confirmPwd:I

    invoke-virtual {p0, v4}, Lcom/taomee/pwdlogin/view/RegDialog;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    .line 54
    .local v6, "confirmPwdEditText":Landroid/widget/EditText;
    invoke-virtual {v9}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    .line 55
    .local v1, "userName":Ljava/lang/String;
    invoke-virtual {v8}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    .line 56
    .local v2, "pwd":Ljava/lang/String;
    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    .line 57
    .local v3, "confirmPwd":Ljava/lang/String;
    new-instance v0, Lcom/taomee/pwdlogin/service/RegManager;

    invoke-virtual {p0}, Lcom/taomee/pwdlogin/view/RegDialog;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/taomee/pwdlogin/service/RegManager;-><init>(Landroid/content/Context;)V

    .line 58
    .local v0, "regManager":Lcom/taomee/pwdlogin/service/RegManager;
    const-string v4, "yes"

    new-instance v5, Lcom/taomee/pwdlogin/view/RegDialog$1;

    invoke-direct {v5, p0, v0}, Lcom/taomee/pwdlogin/view/RegDialog$1;-><init>(Lcom/taomee/pwdlogin/view/RegDialog;Lcom/taomee/pwdlogin/service/RegManager;)V

    invoke-virtual/range {v0 .. v5}, Lcom/taomee/pwdlogin/service/RegManager;->doReg(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/taomee/pwdlogin/service/RegResponse;)V

    .line 76
    .end local v0    # "regManager":Lcom/taomee/pwdlogin/service/RegManager;
    .end local v1    # "userName":Ljava/lang/String;
    .end local v2    # "pwd":Ljava/lang/String;
    .end local v3    # "confirmPwd":Ljava/lang/String;
    .end local v6    # "confirmPwdEditText":Landroid/widget/EditText;
    .end local v8    # "pwdEditText":Landroid/widget/EditText;
    .end local v9    # "usernameEditText":Landroid/widget/EditText;
    :cond_0
    iget-object v4, p0, Lcom/taomee/pwdlogin/view/RegDialog;->loginBtnImageView:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getId()I

    move-result v4

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    if-ne v4, v5, :cond_1

    .line 77
    invoke-virtual {p0}, Lcom/taomee/pwdlogin/view/RegDialog;->dismiss()V

    .line 78
    new-instance v7, Lcom/taomee/pwdlogin/view/LoginDialog;

    iget-object v4, p0, Lcom/taomee/pwdlogin/view/RegDialog;->activity:Landroid/app/Activity;

    invoke-direct {v7, v4}, Lcom/taomee/pwdlogin/view/LoginDialog;-><init>(Landroid/app/Activity;)V

    .line 79
    .local v7, "loginDialog":Lcom/taomee/pwdlogin/view/LoginDialog;
    invoke-virtual {v7}, Lcom/taomee/pwdlogin/view/LoginDialog;->show()V

    .line 82
    .end local v7    # "loginDialog":Lcom/taomee/pwdlogin/view/LoginDialog;
    :cond_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x1

    .line 30
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 31
    sget v3, Lcom/example/taomeeaccount/R$layout;->tm_account_reg:I

    invoke-virtual {p0, v3}, Lcom/taomee/pwdlogin/view/RegDialog;->setContentView(I)V

    .line 32
    sget v3, Lcom/example/taomeeaccount/R$id;->tm_account_title_image:I

    invoke-virtual {p0, v3}, Lcom/taomee/pwdlogin/view/RegDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/taomee/pwdlogin/view/RegDialog;->titleImageView:Landroid/widget/ImageView;

    .line 33
    sget v3, Lcom/example/taomeeaccount/R$id;->loginBtn:I

    invoke-virtual {p0, v3}, Lcom/taomee/pwdlogin/view/RegDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/taomee/pwdlogin/view/RegDialog;->loginBtnImageView:Landroid/widget/ImageView;

    .line 34
    sget v3, Lcom/example/taomeeaccount/R$id;->regBtn:I

    invoke-virtual {p0, v3}, Lcom/taomee/pwdlogin/view/RegDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/taomee/pwdlogin/view/RegDialog;->regBtnImageView:Landroid/widget/ImageView;

    .line 35
    iget-object v3, p0, Lcom/taomee/pwdlogin/view/RegDialog;->loginBtnImageView:Landroid/widget/ImageView;

    invoke-virtual {v3, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 36
    iget-object v3, p0, Lcom/taomee/pwdlogin/view/RegDialog;->regBtnImageView:Landroid/widget/ImageView;

    invoke-virtual {v3, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    iget-object v3, p0, Lcom/taomee/pwdlogin/view/RegDialog;->titleImageView:Landroid/widget/ImageView;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setFocusable(Z)V

    .line 38
    iget-object v3, p0, Lcom/taomee/pwdlogin/view/RegDialog;->titleImageView:Landroid/widget/ImageView;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setFocusableInTouchMode(Z)V

    .line 39
    iget-object v3, p0, Lcom/taomee/pwdlogin/view/RegDialog;->titleImageView:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->requestFocus()Z

    .line 40
    sget v3, Lcom/example/taomeeaccount/R$id;->accountTextView:I

    invoke-virtual {p0, v3}, Lcom/taomee/pwdlogin/view/RegDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 41
    .local v0, "accountTextView":Landroid/widget/TextView;
    const-string v3, "<html>\u8d26&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\u53f7</html>"

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    sget v3, Lcom/example/taomeeaccount/R$id;->pwdTextView:I

    invoke-virtual {p0, v3}, Lcom/taomee/pwdlogin/view/RegDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 43
    .local v2, "pwdTextView":Landroid/widget/TextView;
    const-string v3, "<html>\u5bc6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\u7801</html>"

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    sget v3, Lcom/example/taomeeaccount/R$id;->confirmPwdTextView:I

    invoke-virtual {p0, v3}, Lcom/taomee/pwdlogin/view/RegDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 45
    .local v1, "confirmPwdTextView":Landroid/widget/TextView;
    const-string v3, "<html>\u786e\u8ba4\u5bc6\u7801</html>"

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    return-void
.end method

.class Lcom/taomee/pwdlogin/view/LoginDialog$1;
.super Ljava/lang/Object;
.source "LoginDialog.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/taomee/pwdlogin/view/LoginDialog;
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
    iput-object p1, p0, Lcom/taomee/pwdlogin/view/LoginDialog$1;->this$0:Lcom/taomee/pwdlogin/view/LoginDialog;

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 125
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 119
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 3
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 106
    iget-object v1, p0, Lcom/taomee/pwdlogin/view/LoginDialog$1;->this$0:Lcom/taomee/pwdlogin/view/LoginDialog;

    invoke-static {v1}, Lcom/taomee/pwdlogin/view/LoginDialog;->access$0(Lcom/taomee/pwdlogin/view/LoginDialog;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    .line 107
    .local v0, "len":I
    if-lez v0, :cond_0

    .line 108
    iget-object v1, p0, Lcom/taomee/pwdlogin/view/LoginDialog$1;->this$0:Lcom/taomee/pwdlogin/view/LoginDialog;

    invoke-static {v1}, Lcom/taomee/pwdlogin/view/LoginDialog;->access$1(Lcom/taomee/pwdlogin/view/LoginDialog;)Landroid/widget/ImageView;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 112
    :goto_0
    return-void

    .line 110
    :cond_0
    iget-object v1, p0, Lcom/taomee/pwdlogin/view/LoginDialog$1;->this$0:Lcom/taomee/pwdlogin/view/LoginDialog;

    invoke-static {v1}, Lcom/taomee/pwdlogin/view/LoginDialog;->access$1(Lcom/taomee/pwdlogin/view/LoginDialog;)Landroid/widget/ImageView;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method

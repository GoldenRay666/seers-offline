.class Lcom/taomee/pwdlogin/view/RegDialog$1;
.super Ljava/lang/Object;
.source "RegDialog.java"

# interfaces
.implements Lcom/taomee/pwdlogin/service/RegResponse;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/pwdlogin/view/RegDialog;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/taomee/pwdlogin/view/RegDialog;

.field private final synthetic val$regManager:Lcom/taomee/pwdlogin/service/RegManager;


# direct methods
.method constructor <init>(Lcom/taomee/pwdlogin/view/RegDialog;Lcom/taomee/pwdlogin/service/RegManager;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/taomee/pwdlogin/view/RegDialog$1;->this$0:Lcom/taomee/pwdlogin/view/RegDialog;

    iput-object p2, p0, Lcom/taomee/pwdlogin/view/RegDialog$1;->val$regManager:Lcom/taomee/pwdlogin/service/RegManager;

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public regFail(ILjava/lang/String;)V
    .locals 2
    .param p1, "errorCode"    # I
    .param p2, "errorInfo"    # Ljava/lang/String;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/taomee/pwdlogin/view/RegDialog$1;->this$0:Lcom/taomee/pwdlogin/view/RegDialog;

    invoke-virtual {v0}, Lcom/taomee/pwdlogin/view/RegDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 70
    const/4 v1, 0x1

    .line 69
    invoke-static {v0, p2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 70
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 72
    return-void
.end method

.method public regSuc(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "userId"    # Ljava/lang/String;

    .prologue
    .line 62
    iget-object v1, p0, Lcom/taomee/pwdlogin/view/RegDialog$1;->this$0:Lcom/taomee/pwdlogin/view/RegDialog;

    invoke-virtual {v1}, Lcom/taomee/pwdlogin/view/RegDialog;->dismiss()V

    .line 63
    new-instance v0, Lcom/taomee/pwdlogin/view/LoginDialog;

    iget-object v1, p0, Lcom/taomee/pwdlogin/view/RegDialog$1;->this$0:Lcom/taomee/pwdlogin/view/RegDialog;

    invoke-static {v1}, Lcom/taomee/pwdlogin/view/RegDialog;->access$0(Lcom/taomee/pwdlogin/view/RegDialog;)Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/taomee/pwdlogin/view/LoginDialog;-><init>(Landroid/app/Activity;)V

    .line 64
    .local v0, "loginDialog":Lcom/taomee/pwdlogin/view/LoginDialog;
    iget-object v1, p0, Lcom/taomee/pwdlogin/view/RegDialog$1;->val$regManager:Lcom/taomee/pwdlogin/service/RegManager;

    iget-object v1, v1, Lcom/taomee/pwdlogin/service/RegManager;->userName:Ljava/lang/String;

    iget-object v2, p0, Lcom/taomee/pwdlogin/view/RegDialog$1;->val$regManager:Lcom/taomee/pwdlogin/service/RegManager;

    iget-object v2, v2, Lcom/taomee/pwdlogin/service/RegManager;->pwd:Ljava/lang/String;

    iget-object v3, p0, Lcom/taomee/pwdlogin/view/RegDialog$1;->val$regManager:Lcom/taomee/pwdlogin/service/RegManager;

    iget-object v3, v3, Lcom/taomee/pwdlogin/service/RegManager;->isRemember:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lcom/taomee/pwdlogin/view/LoginDialog;->onLogin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    return-void
.end method

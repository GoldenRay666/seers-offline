.class Lcom/taomee/pwdlogin/service/TaomeeLogin$1;
.super Ljava/lang/Object;
.source "TaomeeLogin.java"

# interfaces
.implements Lcom/taomee/pwdlogin/service/LoginResponse;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/pwdlogin/service/TaomeeLogin;->onAutoLogin(Lcom/taomee/pwdlogin/service/LoginResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/taomee/pwdlogin/service/TaomeeLogin;


# direct methods
.method constructor <init>(Lcom/taomee/pwdlogin/service/TaomeeLogin;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin$1;->this$0:Lcom/taomee/pwdlogin/service/TaomeeLogin;

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public loginFail(ILjava/lang/String;)V
    .locals 3
    .param p1, "errorCode"    # I
    .param p2, "errorInfo"    # Ljava/lang/String;

    .prologue
    .line 74
    new-instance v0, Lcom/taomee/pwdlogin/view/LoginDialog;

    iget-object v1, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin$1;->this$0:Lcom/taomee/pwdlogin/service/TaomeeLogin;

    invoke-static {v1}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->access$3(Lcom/taomee/pwdlogin/service/TaomeeLogin;)Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/taomee/pwdlogin/view/LoginDialog;-><init>(Landroid/app/Activity;)V

    .line 75
    .local v0, "loginDialog":Lcom/taomee/pwdlogin/view/LoginDialog;
    invoke-virtual {v0}, Lcom/taomee/pwdlogin/view/LoginDialog;->show()V

    .line 76
    iget-object v1, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin$1;->this$0:Lcom/taomee/pwdlogin/service/TaomeeLogin;

    invoke-static {v1}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->access$3(Lcom/taomee/pwdlogin/service/TaomeeLogin;)Landroid/app/Activity;

    move-result-object v1

    .line 77
    const/4 v2, 0x1

    .line 76
    invoke-static {v1, p2, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 77
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 78
    return-void
.end method

.method public loginSuc(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "userId"    # Ljava/lang/String;
    .param p3, "session"    # Ljava/lang/String;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin$1;->this$0:Lcom/taomee/pwdlogin/service/TaomeeLogin;

    invoke-static {v0, p2}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->access$0(Lcom/taomee/pwdlogin/service/TaomeeLogin;Ljava/lang/String;)V

    .line 66
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin$1;->this$0:Lcom/taomee/pwdlogin/service/TaomeeLogin;

    invoke-static {v0, p1}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->access$1(Lcom/taomee/pwdlogin/service/TaomeeLogin;Ljava/lang/String;)V

    .line 67
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin$1;->this$0:Lcom/taomee/pwdlogin/service/TaomeeLogin;

    invoke-static {v0, p3}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->access$2(Lcom/taomee/pwdlogin/service/TaomeeLogin;Ljava/lang/String;)V

    .line 68
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin$1;->this$0:Lcom/taomee/pwdlogin/service/TaomeeLogin;

    invoke-static {v0}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->access$3(Lcom/taomee/pwdlogin/service/TaomeeLogin;)Landroid/app/Activity;

    move-result-object v0

    const-string v1, "\u767b\u5f55\u6210\u529f"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 69
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/TaomeeLogin$1;->this$0:Lcom/taomee/pwdlogin/service/TaomeeLogin;

    invoke-static {v0}, Lcom/taomee/pwdlogin/service/TaomeeLogin;->access$4(Lcom/taomee/pwdlogin/service/TaomeeLogin;)Lcom/taomee/pwdlogin/service/LoginResponse;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lcom/taomee/pwdlogin/service/LoginResponse;->loginSuc(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    return-void
.end method

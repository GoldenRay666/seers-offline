.class Lcom/taomee/seer2/a/b;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Landroid/content/Intent;

.field final synthetic b:Landroid/content/Context;

.field final synthetic c:Lcom/taomee/seer2/a/Ci;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/a/Ci;Landroid/content/Intent;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/a/b;->c:Lcom/taomee/seer2/a/Ci;

    iput-object p2, p0, Lcom/taomee/seer2/a/b;->a:Landroid/content/Intent;

    iput-object p3, p0, Lcom/taomee/seer2/a/b;->b:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/taomee/seer2/a/b;->a:Landroid/content/Intent;

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    sget-object v1, Lcom/taomee/seer2/a/d/b;->Q:Ljava/lang/String;

    iget-object v2, p0, Lcom/taomee/seer2/a/b;->a:Landroid/content/Intent;

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/taomee/seer2/a/d/b;->R:Ljava/lang/String;

    iget-object v2, p0, Lcom/taomee/seer2/a/b;->a:Landroid/content/Intent;

    invoke-virtual {v2}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/taomee/seer2/a/b;->b:Landroid/content/Context;

    invoke-static {v1}, Lcom/taomee/seer2/a/a;->a(Landroid/content/Context;)Lcom/taomee/seer2/a/a;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/taomee/seer2/a/a;->a(Landroid/os/Bundle;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/taomee/seer2/a/b;->a:Landroid/content/Intent;

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/taomee/seer2/a/b;->b:Landroid/content/Context;

    invoke-static {v0}, Lcom/taomee/seer2/a/d/a;->e(Landroid/content/Context;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/taomee/seer2/a/b;->b:Landroid/content/Context;

    invoke-static {v0}, Lcom/taomee/seer2/a/d;->a(Landroid/content/Context;)Lcom/taomee/seer2/a/d;

    move-result-object v0

    invoke-virtual {v0}, Lcom/taomee/seer2/a/d;->a()V

    goto :goto_0
.end method

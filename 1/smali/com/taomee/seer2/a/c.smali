.class Lcom/taomee/seer2/a/c;
.super Ljava/lang/Object;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/a/Yg;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/a/Yg;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/a/c;->a:Lcom/taomee/seer2/a/Yg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Intent;II)I
    .locals 3

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/taomee/seer2/a/c;->a:Lcom/taomee/seer2/a/Yg;

    invoke-static {v1}, Lcom/taomee/seer2/a/Yg;->b(Lcom/taomee/seer2/a/Yg;)Lcom/taomee/seer2/a/b/a;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/taomee/seer2/a/b/a;->b(Landroid/os/Bundle;)I

    move-result v0

    return v0

    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    sget-object v1, Lcom/taomee/seer2/a/d/b;->Q:Ljava/lang/String;

    sget-object v2, Lcom/taomee/seer2/a/d/b;->A:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public a()V
    .locals 6

    const/4 v5, 0x1

    iget-object v0, p0, Lcom/taomee/seer2/a/c;->a:Lcom/taomee/seer2/a/Yg;

    iget-object v1, p0, Lcom/taomee/seer2/a/c;->a:Lcom/taomee/seer2/a/Yg;

    invoke-virtual {v1}, Lcom/taomee/seer2/a/Yg;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/taomee/seer2/a/Yg;->a(Lcom/taomee/seer2/a/Yg;Landroid/content/Context;)Landroid/content/Context;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/taomee/seer2/a/c;->a:Lcom/taomee/seer2/a/Yg;

    invoke-static {v1}, Lcom/taomee/seer2/a/Yg;->a(Lcom/taomee/seer2/a/Yg;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/taomee/seer2/a/d/d;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/taomee/seer2/a/d/b;->F:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/taomee/seer2/a/d/b;->E:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/taomee/seer2/a/c;->a:Lcom/taomee/seer2/a/Yg;

    new-instance v2, Lcom/taomee/seer2/a/b/a;

    iget-object v3, p0, Lcom/taomee/seer2/a/c;->a:Lcom/taomee/seer2/a/Yg;

    iget-object v4, p0, Lcom/taomee/seer2/a/c;->a:Lcom/taomee/seer2/a/Yg;

    invoke-static {v4}, Lcom/taomee/seer2/a/Yg;->a(Lcom/taomee/seer2/a/Yg;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v0, v5}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v3, v4, v5, v0}, Lcom/taomee/seer2/a/b/a;-><init>(Lcom/taomee/seer2/a/Yg;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1, v2}, Lcom/taomee/seer2/a/Yg;->a(Lcom/taomee/seer2/a/Yg;Lcom/taomee/seer2/a/b/a;)Lcom/taomee/seer2/a/b/a;

    :goto_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    sget-object v1, Lcom/taomee/seer2/a/d/b;->Q:Ljava/lang/String;

    sget-object v2, Lcom/taomee/seer2/a/d/b;->A:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/taomee/seer2/a/c;->a:Lcom/taomee/seer2/a/Yg;

    invoke-static {v1}, Lcom/taomee/seer2/a/Yg;->b(Lcom/taomee/seer2/a/Yg;)Lcom/taomee/seer2/a/b/a;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/taomee/seer2/a/b/a;->a(Landroid/os/Bundle;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/taomee/seer2/a/c;->a:Lcom/taomee/seer2/a/Yg;

    new-instance v1, Lcom/taomee/seer2/a/b/a;

    iget-object v2, p0, Lcom/taomee/seer2/a/c;->a:Lcom/taomee/seer2/a/Yg;

    iget-object v3, p0, Lcom/taomee/seer2/a/c;->a:Lcom/taomee/seer2/a/Yg;

    invoke-static {v3}, Lcom/taomee/seer2/a/Yg;->a(Lcom/taomee/seer2/a/Yg;)Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/taomee/seer2/a/b/a;-><init>(Lcom/taomee/seer2/a/Yg;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/taomee/seer2/a/Yg;->a(Lcom/taomee/seer2/a/Yg;Lcom/taomee/seer2/a/b/a;)Lcom/taomee/seer2/a/b/a;

    goto :goto_0
.end method

.method public b()V
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/a/c;->a:Lcom/taomee/seer2/a/Yg;

    invoke-static {v0}, Lcom/taomee/seer2/a/Yg;->b(Lcom/taomee/seer2/a/Yg;)Lcom/taomee/seer2/a/b/a;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/taomee/seer2/a/c;->a:Lcom/taomee/seer2/a/Yg;

    invoke-static {v0}, Lcom/taomee/seer2/a/Yg;->b(Lcom/taomee/seer2/a/Yg;)Lcom/taomee/seer2/a/b/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/taomee/seer2/a/b/a;->a()V

    :cond_0
    return-void
.end method

.class Le22/c55/s88/g/e;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Le22/c55/s88/g/a;


# direct methods
.method constructor <init>(Le22/c55/s88/g/a;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/e;->a:Le22/c55/s88/g/a;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    const/4 v5, 0x0

    iget-object v0, p0, Le22/c55/s88/g/e;->a:Le22/c55/s88/g/a;

    iget-object v0, v0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    sget-object v1, Le22/c55/s88/f/e;->bK:Ljava/lang/String;

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    sget-object v2, Le22/c55/s88/f/e;->bN:Ljava/lang/String;

    invoke-virtual {v0, v2, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    sget-object v3, Le22/c55/s88/f/e;->bM:Ljava/lang/String;

    invoke-virtual {v0, v3, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    sget-object v4, Le22/c55/s88/f/e;->bL:Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iget-object v4, p0, Le22/c55/s88/g/e;->a:Le22/c55/s88/g/a;

    invoke-static {v4}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v4

    iget v4, v4, Le22/c55/s88/e/j;->h:I

    if-ne v4, v1, :cond_0

    if-eqz v2, :cond_2

    iget-object v0, p0, Le22/c55/s88/g/e;->a:Le22/c55/s88/g/a;

    iget-object v0, v0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    sget-object v1, Le22/c55/s88/f/e;->T:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->h(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    if-eqz v3, :cond_3

    iget-object v0, p0, Le22/c55/s88/g/e;->a:Le22/c55/s88/g/a;

    iget-object v0, v0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    sget-object v1, Le22/c55/s88/f/e;->Q:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->h(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/e;->a:Le22/c55/s88/g/a;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Le22/c55/s88/g/a;->a(Le22/c55/s88/g/a;Z)Z

    goto :goto_0

    :cond_3
    iget-object v1, p0, Le22/c55/s88/g/e;->a:Le22/c55/s88/g/a;

    iget-object v1, v1, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Le22/c55/s88/f/e;->U:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " %"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Le22/c55/s88/ui/i;->h(Ljava/lang/String;)V

    goto :goto_0
.end method

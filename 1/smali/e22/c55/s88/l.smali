.class Le22/c55/s88/l;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Le22/c55/s88/Vrr;


# direct methods
.method constructor <init>(Le22/c55/s88/Vrr;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/l;->a:Le22/c55/s88/Vrr;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 10

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Le22/c55/s88/l;->a:Le22/c55/s88/Vrr;

    iget-object v1, p0, Le22/c55/s88/l;->a:Le22/c55/s88/Vrr;

    invoke-static {v1}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;Landroid/content/Context;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v9, p1, Landroid/os/Message;->arg1:I

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Le22/c55/s88/c/e;

    iget-object v0, p0, Le22/c55/s88/l;->a:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, v8, Le22/c55/s88/c/e;->f:Ljava/lang/String;

    invoke-static {v0, v1}, Le22/c55/s88/f/a;->f(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    iget-object v0, p0, Le22/c55/s88/l;->a:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    const v1, 0x1080034

    sget-object v2, Le22/c55/s88/f/e;->ah:Ljava/lang/String;

    iget v3, v8, Le22/c55/s88/c/e;->e:I

    const/16 v4, 0x10

    if-nez v5, :cond_2

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    :cond_2
    iget-object v6, v8, Le22/c55/s88/c/e;->d:Ljava/lang/String;

    const/4 v7, -0x1

    invoke-static/range {v0 .. v7}, Le22/c55/s88/e/g;->a(Landroid/content/Context;ILjava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

    invoke-static {}, Le22/c55/s88/Vrr;->b()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/m;

    invoke-static {v8}, Le22/c55/s88/f/a;->a(Le22/c55/s88/c/e;)Le22/c55/s88/e/j;

    move-result-object v2

    invoke-interface {v0, v2}, Le22/c55/s88/m;->a(Le22/c55/s88/e/j;)V

    goto :goto_1

    :cond_3
    invoke-static {}, Le22/c55/s88/c/a;->a()Le22/c55/s88/c/a;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/l;->a:Le22/c55/s88/Vrr;

    invoke-static {v1}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v9, v2}, Le22/c55/s88/c/a;->a(Landroid/content/Context;II)V

    iget-object v0, p0, Le22/c55/s88/l;->a:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v8}, Le22/c55/s88/f/a;->b(Le22/c55/s88/c/e;)Ljava/lang/String;

    move-result-object v1

    iget v2, v8, Le22/c55/s88/c/e;->e:I

    const/4 v3, 0x1

    invoke-static {v0, v1, v2, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Ljava/lang/String;IZ)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->aO:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/l;->a:Le22/c55/s88/Vrr;

    invoke-static {v2}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v8, Le22/c55/s88/c/e;->e:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v8}, Le22/c55/s88/f/a;->b(Le22/c55/s88/c/e;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto/16 :goto_0
.end method

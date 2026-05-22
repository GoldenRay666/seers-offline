.class Le22/c55/s88/g;
.super Ljava/util/TimerTask;


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Le22/c55/s88/Vrr;


# direct methods
.method constructor <init>(Le22/c55/s88/Vrr;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    iput-object p2, p0, Le22/c55/s88/g;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    const/4 v10, 0x1

    const v1, 0x1080034

    const/16 v4, 0x10

    const/4 v9, 0x3

    const/4 v7, -0x1

    iget-object v0, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Le22/c55/s88/g;->a:Ljava/lang/String;

    invoke-static {v0, v2}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Ljava/lang/String;)Le22/c55/s88/e/j;

    move-result-object v8

    if-eqz v8, :cond_2

    iget-object v0, v8, Le22/c55/s88/e/j;->l:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, v8, Le22/c55/s88/e/j;->l:Ljava/lang/Integer;

    iget-object v0, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v8}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Le22/c55/s88/e/j;)Z

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    const/16 v3, 0xa

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v2, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v2}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v0}, Le22/c55/s88/Vrr;->a(Landroid/content/Context;Landroid/content/Intent;)V

    sget-object v0, Le22/c55/s88/f/e;->cb:Ljava/lang/String;

    sget-object v2, Le22/c55/s88/f/e;->cv:Ljava/lang/String;

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v8}, Le22/c55/s88/f/a;->b(Le22/c55/s88/e/j;)Ljava/lang/String;

    move-result-object v2

    iget v3, v8, Le22/c55/s88/e/j;->h:I

    invoke-static {v0, v2, v3, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Ljava/lang/String;IZ)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Le22/c55/s88/f/e;->aO:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v3}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v8, Le22/c55/s88/e/j;->h:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v8}, Le22/c55/s88/f/a;->b(Le22/c55/s88/e/j;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_0
    iget-object v0, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Le22/c55/s88/g;->a:Ljava/lang/String;

    invoke-static {v0, v2}, Le22/c55/s88/f/a;->f(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    iget-object v0, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    sget-object v2, Le22/c55/s88/f/e;->ah:Ljava/lang/String;

    iget v3, v8, Le22/c55/s88/e/j;->h:I

    if-nez v5, :cond_1

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    :cond_1
    iget-object v6, v8, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-static/range {v0 .. v7}, Le22/c55/s88/e/g;->a(Landroid/content/Context;ILjava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

    invoke-static {}, Le22/c55/s88/Vrr;->b()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/m;

    invoke-interface {v0, v8}, Le22/c55/s88/m;->a(Le22/c55/s88/e/j;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Le22/c55/s88/g;->a:Ljava/lang/String;

    invoke-static {v0, v2}, Le22/c55/s88/f/a;->n(Landroid/content/Context;Ljava/lang/String;)Le22/c55/s88/e/j;

    move-result-object v8

    if-eqz v8, :cond_4

    iget-object v0, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    iget v2, v8, Le22/c55/s88/e/j;->h:I

    invoke-static {v0, v2, v9}, Le22/c55/s88/f/a;->a(Landroid/content/Context;II)Z

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    const/16 v3, 0xc

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v2, Le22/c55/s88/f/e;->bJ:Ljava/lang/String;

    invoke-virtual {v0, v2, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v2, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v2}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v0}, Le22/c55/s88/Vrr;->a(Landroid/content/Context;Landroid/content/Intent;)V

    iget-object v0, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v8}, Le22/c55/s88/f/a;->f(Landroid/content/Context;Le22/c55/s88/e/j;)V

    iget-object v0, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Le22/c55/s88/g;->a:Ljava/lang/String;

    invoke-static {v0, v2}, Le22/c55/s88/f/a;->f(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    iget-object v0, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    sget-object v2, Le22/c55/s88/f/e;->ah:Ljava/lang/String;

    iget v3, v8, Le22/c55/s88/e/j;->h:I

    if-nez v5, :cond_3

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    :cond_3
    iget-object v6, v8, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-static/range {v0 .. v7}, Le22/c55/s88/e/g;->a(Landroid/content/Context;ILjava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

    invoke-static {}, Le22/c55/s88/Vrr;->b()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/m;

    invoke-interface {v0, v8}, Le22/c55/s88/m;->a(Le22/c55/s88/e/j;)V

    goto :goto_1

    :cond_4
    iget-object v0, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Le22/c55/s88/g;->a:Ljava/lang/String;

    invoke-static {v0, v2}, Le22/c55/s88/f/a;->o(Landroid/content/Context;Ljava/lang/String;)Le22/c55/s88/e/j;

    move-result-object v8

    if-eqz v8, :cond_6

    iget-object v0, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    iget v2, v8, Le22/c55/s88/e/j;->h:I

    invoke-static {v0, v2, v9}, Le22/c55/s88/f/a;->b(Landroid/content/Context;II)Z

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    const/16 v3, 0xd

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v2, Le22/c55/s88/f/e;->bJ:Ljava/lang/String;

    const/4 v3, 0x2

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v2, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v2}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v0}, Le22/c55/s88/Vrr;->a(Landroid/content/Context;Landroid/content/Intent;)V

    iget-object v0, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v8}, Le22/c55/s88/f/a;->f(Landroid/content/Context;Le22/c55/s88/e/j;)V

    iget-object v0, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Le22/c55/s88/g;->a:Ljava/lang/String;

    invoke-static {v0, v2}, Le22/c55/s88/f/a;->f(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    iget-object v0, p0, Le22/c55/s88/g;->b:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    sget-object v2, Le22/c55/s88/f/e;->ah:Ljava/lang/String;

    iget v3, v8, Le22/c55/s88/e/j;->h:I

    if-nez v5, :cond_5

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    :cond_5
    iget-object v6, v8, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-static/range {v0 .. v7}, Le22/c55/s88/e/g;->a(Landroid/content/Context;ILjava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

    invoke-static {}, Le22/c55/s88/Vrr;->b()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/m;

    invoke-interface {v0, v8}, Le22/c55/s88/m;->a(Le22/c55/s88/e/j;)V

    goto :goto_2

    :cond_6
    return-void
.end method

.class final Le22/c55/s88/p;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Le22/c55/s88/Vss;


# direct methods
.method public constructor <init>(Le22/c55/s88/Vss;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 10

    const/4 v9, 0x4

    const/4 v8, 0x1

    const/16 v7, 0xc

    const/16 v6, 0xa

    const/4 v5, 0x0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    invoke-virtual {v0, v1, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iget-object v2, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    sget-object v3, Le22/c55/s88/f/e;->bJ:Ljava/lang/String;

    invoke-virtual {v0, v3, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v2, v3}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;I)I

    iget-object v2, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    sget-object v3, Le22/c55/s88/f/e;->bZ:Ljava/lang/String;

    invoke-virtual {v0, v3, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v2, v3}, Le22/c55/s88/Vss;->b(Le22/c55/s88/Vss;I)I

    iget-object v2, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    sget-object v3, Le22/c55/s88/f/e;->cq:Ljava/lang/String;

    invoke-virtual {v0, v3, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v2, v3}, Le22/c55/s88/Vss;->c(Le22/c55/s88/Vss;I)I

    iget-object v2, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    sget-object v3, Le22/c55/s88/f/e;->ca:Ljava/lang/String;

    invoke-virtual {v0, v3, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v2, v0}, Le22/c55/s88/Vss;->d(Le22/c55/s88/Vss;I)I

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0, v1}, Le22/c55/s88/Vss;->e(Le22/c55/s88/Vss;I)V

    sget-object v0, Le22/c55/s88/f/e;->cb:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Le22/c55/s88/f/e;->aG:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v3}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v3

    iget-object v3, v3, Le22/c55/s88/e/i;->n:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Le22/c55/s88/f/e;->cb:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Le22/c55/s88/f/e;->aH:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v3}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v3

    iget-object v3, v3, Le22/c55/s88/e/i;->o:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v0

    iget v0, v0, Le22/c55/s88/e/i;->i:I

    const v2, 0x186dd

    if-eq v0, v2, :cond_0

    sget-object v0, Le22/c55/s88/f/e;->cb:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Le22/c55/s88/f/e;->aI:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v3}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v3

    iget v3, v3, Le22/c55/s88/e/i;->i:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :try_start_0
    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-virtual {v0}, Le22/c55/s88/Vss;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    sget-object v2, Le22/c55/s88/f/e;->cy:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    array-length v0, v0

    if-nez v0, :cond_3

    :cond_1
    sget-object v0, Le22/c55/s88/f/e;->bZ:Ljava/lang/String;

    sget-object v2, Le22/c55/s88/f/e;->aJ:Ljava/lang/String;

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_3
    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v0

    iget-object v0, v0, Le22/c55/s88/e/i;->n:Ljava/lang/String;

    if-eqz v0, :cond_2

    sget-object v0, Le22/c55/s88/f/e;->bZ:Ljava/lang/String;

    sget-object v2, Le22/c55/s88/f/e;->aK:Ljava/lang/String;

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0}, Le22/c55/s88/f/a;->h(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v2}, Le22/c55/s88/f/a;->d(Landroid/content/Context;)I

    move-result v2

    sget-object v3, Le22/c55/s88/f/e;->v:Ljava/lang/String;

    iget-object v4, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v4}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v4

    iget-object v4, v4, Le22/c55/s88/e/i;->n:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    sget-object v3, Le22/c55/s88/f/e;->cE:Ljava/lang/String;

    iget-object v4, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v4}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v4

    iget-object v4, v4, Le22/c55/s88/e/i;->n:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    :cond_4
    if-eq v1, v6, :cond_5

    if-ne v1, v9, :cond_6

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v0

    iput v9, v0, Le22/c55/s88/e/i;->m:I

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0, v5}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;Z)V

    :cond_5
    :goto_1
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget-object v1, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v1, v0}, Le22/c55/s88/Vrr;->a(Landroid/app/Service;I)V

    goto :goto_0

    :cond_6
    const/4 v0, 0x7

    if-ne v1, v0, :cond_7

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v0

    const/4 v1, 0x7

    iput v1, v0, Le22/c55/s88/e/i;->m:I

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0, v5}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;Z)V

    goto :goto_1

    :cond_7
    if-ne v1, v7, :cond_8

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v0

    iput v7, v0, Le22/c55/s88/e/i;->m:I

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0, v5}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;Z)V

    goto :goto_1

    :cond_8
    sget-object v0, Le22/c55/s88/f/e;->bZ:Ljava/lang/String;

    sget-object v1, Le22/c55/s88/f/e;->aL:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v0

    invoke-static {}, Le22/c55/s88/Vss;->a()I

    move-result v1

    iput v1, v0, Le22/c55/s88/e/i;->m:I

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0, v5}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;Z)V

    goto :goto_1

    :cond_9
    if-eq v1, v6, :cond_a

    const/4 v3, 0x2

    if-ne v2, v3, :cond_b

    :cond_a
    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v0

    iput v6, v0, Le22/c55/s88/e/i;->m:I

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0, v5}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;Z)V

    goto :goto_1

    :cond_b
    if-ne v1, v7, :cond_c

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v0

    iput v7, v0, Le22/c55/s88/e/i;->m:I

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0, v5}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;Z)V

    goto :goto_1

    :cond_c
    const/16 v3, 0xd

    if-ne v1, v3, :cond_d

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v0

    const/16 v1, 0xd

    iput v1, v0, Le22/c55/s88/e/i;->m:I

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0, v5}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;Z)V

    goto :goto_1

    :cond_d
    if-ne v1, v9, :cond_e

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v0

    iput v1, v0, Le22/c55/s88/e/i;->m:I

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0, v5}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;Z)V

    goto/16 :goto_1

    :cond_e
    const/4 v3, 0x7

    if-ne v1, v3, :cond_f

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v0

    iput v1, v0, Le22/c55/s88/e/i;->m:I

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0, v5}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;Z)V

    goto/16 :goto_1

    :cond_f
    iget-object v3, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v3}, Le22/c55/s88/Vss;->b(Le22/c55/s88/Vss;)Z

    move-result v3

    if-eqz v3, :cond_5

    if-nez v0, :cond_10

    if-eq v1, v6, :cond_10

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v0

    const/4 v1, 0x3

    iput v1, v0, Le22/c55/s88/e/i;->m:I

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0, v5}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;Z)V

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v1}, Le22/c55/s88/f/a;->h(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Le22/c55/s88/e/i;->r:Ljava/lang/String;

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v0

    invoke-static {}, Le22/c55/s88/Vss;->a()I

    move-result v1

    iput v1, v0, Le22/c55/s88/e/i;->m:I

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0, v8}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;Z)V

    goto/16 :goto_1

    :cond_10
    if-eqz v2, :cond_11

    if-ne v2, v8, :cond_12

    :cond_11
    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;

    move-result-object v0

    invoke-static {}, Le22/c55/s88/Vss;->a()I

    move-result v1

    iput v1, v0, Le22/c55/s88/e/i;->m:I

    iget-object v0, p0, Le22/c55/s88/p;->a:Le22/c55/s88/Vss;

    invoke-static {v0, v8}, Le22/c55/s88/Vss;->a(Le22/c55/s88/Vss;Z)V

    goto/16 :goto_1

    :cond_12
    sget-object v0, Le22/c55/s88/f/e;->bZ:Ljava/lang/String;

    sget-object v1, Le22/c55/s88/f/e;->aM:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1
.end method

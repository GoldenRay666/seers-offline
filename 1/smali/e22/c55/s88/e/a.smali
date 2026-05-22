.class public Le22/c55/s88/e/a;
.super Ljava/lang/Object;

# interfaces
.implements Le22/c55/s88/b/a;


# static fields
.field private static d:Landroid/os/Handler;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Le22/c55/s88/e/j;

.field private c:Landroid/os/Handler;

.field private e:I

.field private f:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Le22/c55/s88/e/j;Landroid/os/Handler;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Le22/c55/s88/e/a;->e:I

    iput v0, p0, Le22/c55/s88/e/a;->f:I

    iput-object p1, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    iput-object p2, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iput-object p3, p0, Le22/c55/s88/e/a;->c:Landroid/os/Handler;

    return-void
.end method

.method private a(I)V
    .locals 5

    const/4 v4, 0x1

    sget-object v0, Le22/c55/s88/e/a;->d:Landroid/os/Handler;

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    packed-switch p1, :pswitch_data_0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    sget-object v1, Le22/c55/s88/e/a;->d:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void

    :pswitch_0
    sget-object v2, Le22/c55/s88/f/e;->bK:Ljava/lang/String;

    iget-object v3, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget v3, v3, Le22/c55/s88/e/j;->h:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    sget-object v2, Le22/c55/s88/f/e;->bL:Ljava/lang/String;

    iget v3, p0, Le22/c55/s88/e/a;->f:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_0

    :pswitch_1
    sget-object v2, Le22/c55/s88/f/e;->bK:Ljava/lang/String;

    iget-object v3, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget v3, v3, Le22/c55/s88/e/j;->h:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    sget-object v2, Le22/c55/s88/f/e;->bM:Ljava/lang/String;

    invoke-virtual {v1, v2, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    :pswitch_2
    sget-object v2, Le22/c55/s88/f/e;->bK:Ljava/lang/String;

    iget-object v3, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget v3, v3, Le22/c55/s88/e/j;->h:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    sget-object v2, Le22/c55/s88/f/e;->bN:Ljava/lang/String;

    invoke-virtual {v1, v2, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static a(Landroid/os/Handler;)V
    .locals 0

    sput-object p0, Le22/c55/s88/e/a;->d:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public a(Le22/c55/s88/b/f;I)V
    .locals 13

    const/16 v12, 0xc

    const/4 v11, 0x1

    const/4 v7, -0x1

    const/4 v10, 0x4

    const/4 v9, 0x2

    invoke-virtual {p1}, Le22/c55/s88/b/f;->c()Ljava/io/File;

    move-result-object v0

    packed-switch p2, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Le22/c55/s88/f/e;->aN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Le22/c55/s88/f/e;->aO:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Le22/c55/s88/f/e;->aP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_1
    invoke-virtual {p1}, Le22/c55/s88/b/f;->c()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v2, Le22/c55/s88/f/e;->ad:Ljava/lang/String;

    iget-object v0, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    const v1, 0x1080082

    iget-object v3, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget v3, v3, Le22/c55/s88/e/j;->h:I

    const/16 v4, 0x20

    iget-object v5, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    invoke-virtual {p1}, Le22/c55/s88/b/f;->c()Ljava/io/File;

    move-result-object v6

    iget-object v8, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget v8, v8, Le22/c55/s88/e/j;->w:I

    invoke-static {v5, v6, v8}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Ljava/io/File;I)Landroid/content/Intent;

    move-result-object v5

    iget-object v6, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget-object v6, v6, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-static/range {v0 .. v7}, Le22/c55/s88/e/g;->a(Landroid/content/Context;ILjava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

    invoke-direct {p0, v9}, Le22/c55/s88/e/a;->a(I)V

    iget-object v0, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget-byte v0, v0, Le22/c55/s88/e/j;->e:B

    const/16 v1, 0xd

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    iget-object v1, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget v1, v1, Le22/c55/s88/e/j;->h:I

    invoke-static {v0, v1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;II)Z

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    iget-object v2, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    invoke-static {v2}, Le22/c55/s88/VManager;->getMainChildService(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v1, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    invoke-virtual {v0, v1, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bJ:Ljava/lang/String;

    invoke-virtual {v0, v1, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    iget-object v0, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    iget-object v1, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    invoke-static {v0, v1}, Le22/c55/s88/f/a;->d(Landroid/content/Context;Le22/c55/s88/e/j;)Z

    :goto_2
    iget-object v0, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    invoke-virtual {p1}, Le22/c55/s88/b/f;->c()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget-object v2, v2, Le22/c55/s88/e/j;->i:Ljava/lang/String;

    iget-object v3, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget v3, v3, Le22/c55/s88/e/j;->w:I

    invoke-static {v0, v1, v2, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget-byte v0, v0, Le22/c55/s88/e/j;->e:B

    if-ne v0, v12, :cond_0

    invoke-static {}, Le22/c55/s88/c/a;->a()Le22/c55/s88/c/a;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    iget-object v2, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget v2, v2, Le22/c55/s88/e/j;->h:I

    invoke-virtual {v0, v1, v2, v9}, Le22/c55/s88/c/a;->a(Landroid/content/Context;II)V

    goto/16 :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_1

    :cond_2
    iget-object v0, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget-byte v0, v0, Le22/c55/s88/e/j;->e:B

    const/16 v1, 0xe

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    iget-object v1, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget v1, v1, Le22/c55/s88/e/j;->h:I

    invoke-static {v0, v1, v10}, Le22/c55/s88/f/a;->b(Landroid/content/Context;II)Z

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    iget-object v2, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    invoke-static {v2}, Le22/c55/s88/VManager;->getMainChildService(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v1, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    const/16 v2, 0xd

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bJ:Ljava/lang/String;

    invoke-virtual {v0, v1, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_2

    :cond_3
    iget-object v0, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Le22/c55/s88/e/j;->l:Ljava/lang/Integer;

    iget-object v0, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    iget-object v1, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    invoke-static {v0, v1}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Le22/c55/s88/e/j;)Z

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    iget-object v2, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    invoke-static {v2}, Le22/c55/s88/VManager;->getMainChildService(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v1, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto/16 :goto_2

    :cond_4
    iget-object v0, p0, Le22/c55/s88/e/a;->c:Landroid/os/Handler;

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    sget-object v0, Le22/c55/s88/f/e;->bq:Ljava/lang/String;

    invoke-virtual {p1}, Le22/c55/s88/b/f;->c()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v3, Le22/c55/s88/f/e;->bp:Ljava/lang/String;

    invoke-virtual {p1}, Le22/c55/s88/b/f;->p()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v1, v2}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    iget-object v0, p0, Le22/c55/s88/e/a;->c:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    :pswitch_2
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Le22/c55/s88/f/e;->aN:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v2, Le22/c55/s88/f/e;->N:Ljava/lang/String;

    invoke-virtual {p1}, Le22/c55/s88/b/f;->n()I

    move-result v0

    if-ne v0, v11, :cond_5

    sget-object v2, Le22/c55/s88/f/e;->M:Ljava/lang/String;

    :cond_5
    iget-object v0, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    const v1, 0x1080078

    iget-object v3, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget v3, v3, Le22/c55/s88/e/j;->h:I

    sget v4, Le22/c55/s88/f/a;->a:I

    iget-object v5, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    iget-object v6, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    invoke-static {v5, v6}, Le22/c55/s88/e/b;->c(Landroid/content/Context;Le22/c55/s88/e/j;)Landroid/content/Intent;

    move-result-object v5

    iget-object v6, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget-object v6, v6, Le22/c55/s88/e/j;->m:Ljava/lang/String;

    invoke-static/range {v0 .. v7}, Le22/c55/s88/e/g;->a(Landroid/content/Context;ILjava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

    const/4 v0, 0x3

    invoke-direct {p0, v0}, Le22/c55/s88/e/a;->a(I)V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public a(Le22/c55/s88/b/f;J)V
    .locals 9

    const/4 v8, 0x1

    invoke-virtual {p1}, Le22/c55/s88/b/f;->c()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Le22/c55/s88/f/e;->aN:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Le22/c55/s88/b/f;->k()I

    move-result v0

    mul-int/lit8 v0, v0, 0x64

    invoke-virtual {p1}, Le22/c55/s88/b/f;->j()I

    move-result v1

    div-int/2addr v0, v1

    iget v1, p0, Le22/c55/s88/e/a;->f:I

    sub-int v1, v0, v1

    if-lt v1, v8, :cond_0

    iput v0, p0, Le22/c55/s88/e/a;->f:I

    iget-object v0, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    const v1, 0x1080081

    sget-object v2, Le22/c55/s88/f/e;->S:Ljava/lang/String;

    iget-object v3, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget v3, v3, Le22/c55/s88/e/j;->h:I

    sget v4, Le22/c55/s88/f/a;->a:I

    iget-object v5, p0, Le22/c55/s88/e/a;->a:Landroid/content/Context;

    iget-object v6, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    invoke-static {v5, v6}, Le22/c55/s88/e/b;->c(Landroid/content/Context;Le22/c55/s88/e/j;)Landroid/content/Intent;

    move-result-object v5

    iget-object v6, p0, Le22/c55/s88/e/a;->b:Le22/c55/s88/e/j;

    iget-object v6, v6, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    iget v7, p0, Le22/c55/s88/e/a;->f:I

    invoke-static/range {v0 .. v7}, Le22/c55/s88/e/g;->a(Landroid/content/Context;ILjava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

    invoke-direct {p0, v8}, Le22/c55/s88/e/a;->a(I)V

    :cond_0
    return-void
.end method

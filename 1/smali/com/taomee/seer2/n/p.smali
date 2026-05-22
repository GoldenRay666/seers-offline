.class Lcom/taomee/seer2/n/p;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/taomee/seer2/n/b/c;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Lcom/taomee/seer2/n/am;

.field private c:Landroid/os/Handler;

.field private d:I

.field private e:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/taomee/seer2/n/am;Landroid/os/Handler;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/taomee/seer2/n/p;->d:I

    iput v0, p0, Lcom/taomee/seer2/n/p;->e:I

    iput-object p1, p0, Lcom/taomee/seer2/n/p;->a:Landroid/content/Context;

    iput-object p2, p0, Lcom/taomee/seer2/n/p;->b:Lcom/taomee/seer2/n/am;

    iput-object p3, p0, Lcom/taomee/seer2/n/p;->c:Landroid/os/Handler;

    return-void
.end method

.method private a(Landroid/os/Message;)V
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/n/p;->c:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method


# virtual methods
.method public a(Ljava/io/File;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/taomee/seer2/n/d/b;->aK:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public a(Lcom/taomee/seer2/n/b/h;I)V
    .locals 9

    const/4 v7, -0x1

    invoke-virtual {p1}, Lcom/taomee/seer2/n/b/h;->c()Ljava/io/File;

    move-result-object v0

    packed-switch p2, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/taomee/seer2/n/d/b;->aH:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/taomee/seer2/n/d/b;->r:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    invoke-virtual {p0, v0}, Lcom/taomee/seer2/n/p;->a(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_1
    invoke-virtual {p1}, Lcom/taomee/seer2/n/b/h;->c()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v2, Lcom/taomee/seer2/n/d/b;->cA:Ljava/lang/String;

    const v0, 0x1080082

    iget-object v1, p0, Lcom/taomee/seer2/n/p;->a:Landroid/content/Context;

    iget-object v3, p0, Lcom/taomee/seer2/n/p;->b:Lcom/taomee/seer2/n/am;

    iget v3, v3, Lcom/taomee/seer2/n/am;->h:I

    const/16 v4, 0x20

    iget-object v5, p0, Lcom/taomee/seer2/n/p;->a:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/taomee/seer2/n/b/h;->c()Ljava/io/File;

    move-result-object v6

    iget-object v8, p0, Lcom/taomee/seer2/n/p;->b:Lcom/taomee/seer2/n/am;

    iget v8, v8, Lcom/taomee/seer2/n/am;->w:I

    invoke-static {v5, v6, v8}, Lcom/taomee/seer2/n/ba;->a(Landroid/content/Context;Ljava/io/File;I)Landroid/content/Intent;

    move-result-object v5

    iget-object v6, p0, Lcom/taomee/seer2/n/p;->b:Lcom/taomee/seer2/n/am;

    iget-object v6, v6, Lcom/taomee/seer2/n/am;->g:Ljava/lang/String;

    invoke-static/range {v0 .. v7}, Lcom/taomee/seer2/n/aj;->a(ILandroid/content/Context;Ljava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

    iget-object v0, p0, Lcom/taomee/seer2/n/p;->b:Lcom/taomee/seer2/n/am;

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/taomee/seer2/n/am;->l:Ljava/lang/Integer;

    iget-object v0, p0, Lcom/taomee/seer2/n/p;->a:Landroid/content/Context;

    iget-object v1, p0, Lcom/taomee/seer2/n/p;->b:Lcom/taomee/seer2/n/am;

    invoke-static {v0, v1}, Lcom/taomee/seer2/n/ba;->b(Landroid/content/Context;Lcom/taomee/seer2/n/am;)Z

    iget-object v0, p0, Lcom/taomee/seer2/n/p;->a:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/taomee/seer2/n/b/h;->c()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/taomee/seer2/n/p;->b:Lcom/taomee/seer2/n/am;

    iget-object v2, v2, Lcom/taomee/seer2/n/am;->i:Ljava/lang/String;

    iget-object v3, p0, Lcom/taomee/seer2/n/p;->b:Lcom/taomee/seer2/n/am;

    iget v3, v3, Lcom/taomee/seer2/n/am;->w:I

    invoke-static {v0, v1, v2, v3}, Lcom/taomee/seer2/n/ba;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/taomee/seer2/n/p;->a:Landroid/content/Context;

    iget-object v2, p0, Lcom/taomee/seer2/n/p;->a:Landroid/content/Context;

    invoke-static {v2}, Lcom/taomee/seer2/n/ba;->t(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v1, Lcom/taomee/seer2/n/d/b;->T:Ljava/lang/String;

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Lcom/taomee/seer2/n/p;->a:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    iget-object v0, p0, Lcom/taomee/seer2/n/p;->b:Lcom/taomee/seer2/n/am;

    iget-byte v0, v0, Lcom/taomee/seer2/n/am;->e:B

    const/16 v1, 0xc

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/taomee/seer2/n/e;->a()Lcom/taomee/seer2/n/e;

    move-result-object v0

    iget-object v1, p0, Lcom/taomee/seer2/n/p;->a:Landroid/content/Context;

    iget-object v2, p0, Lcom/taomee/seer2/n/p;->b:Lcom/taomee/seer2/n/am;

    iget v2, v2, Lcom/taomee/seer2/n/am;->h:I

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Lcom/taomee/seer2/n/e;->a(Landroid/content/Context;II)V

    iget-object v0, p0, Lcom/taomee/seer2/n/p;->a:Landroid/content/Context;

    iget-object v1, p0, Lcom/taomee/seer2/n/p;->b:Lcom/taomee/seer2/n/am;

    invoke-static {v1}, Lcom/taomee/seer2/n/ba;->a(Lcom/taomee/seer2/n/am;)Lcom/taomee/seer2/n/w;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/taomee/seer2/n/ba;->a(Landroid/content/Context;Lcom/taomee/seer2/n/w;)Z

    goto/16 :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_1

    :cond_2
    iget-object v0, p0, Lcom/taomee/seer2/n/p;->c:Landroid/os/Handler;

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    sget-object v0, Lcom/taomee/seer2/n/d/b;->aC:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/taomee/seer2/n/b/h;->c()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v3, Lcom/taomee/seer2/n/d/b;->aE:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/taomee/seer2/n/b/h;->n()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v1, v2}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    invoke-direct {p0, v1}, Lcom/taomee/seer2/n/p;->a(Landroid/os/Message;)V

    goto/16 :goto_0

    :pswitch_2
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/taomee/seer2/n/d/b;->aH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v2, Lcom/taomee/seer2/n/d/b;->cB:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/taomee/seer2/n/b/h;->l()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    sget-object v2, Lcom/taomee/seer2/n/d/b;->cC:Ljava/lang/String;

    :cond_3
    const v0, 0x1080078

    iget-object v1, p0, Lcom/taomee/seer2/n/p;->a:Landroid/content/Context;

    iget-object v3, p0, Lcom/taomee/seer2/n/p;->b:Lcom/taomee/seer2/n/am;

    iget v3, v3, Lcom/taomee/seer2/n/am;->h:I

    const/16 v4, 0x10

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    iget-object v6, p0, Lcom/taomee/seer2/n/p;->b:Lcom/taomee/seer2/n/am;

    iget-object v6, v6, Lcom/taomee/seer2/n/am;->m:Ljava/lang/String;

    invoke-static/range {v0 .. v7}, Lcom/taomee/seer2/n/aj;->a(ILandroid/content/Context;Ljava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

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

.method public a(Lcom/taomee/seer2/n/b/h;J)V
    .locals 8

    invoke-virtual {p1}, Lcom/taomee/seer2/n/b/h;->c()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/taomee/seer2/n/d/b;->aH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/taomee/seer2/n/b/h;->i()I

    move-result v0

    mul-int/lit8 v0, v0, 0x64

    invoke-virtual {p1}, Lcom/taomee/seer2/n/b/h;->h()I

    move-result v1

    div-int/2addr v0, v1

    iget v1, p0, Lcom/taomee/seer2/n/p;->e:I

    sub-int v1, v0, v1

    const/4 v2, 0x1

    if-lt v1, v2, :cond_0

    iput v0, p0, Lcom/taomee/seer2/n/p;->e:I

    const v0, 0x1080081

    iget-object v1, p0, Lcom/taomee/seer2/n/p;->a:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/taomee/seer2/n/d/b;->cD:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/taomee/seer2/n/d/b;->aW:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/taomee/seer2/n/p;->b:Lcom/taomee/seer2/n/am;

    iget v3, v3, Lcom/taomee/seer2/n/am;->h:I

    const/16 v4, 0x10

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    iget-object v6, p0, Lcom/taomee/seer2/n/p;->b:Lcom/taomee/seer2/n/am;

    iget-object v6, v6, Lcom/taomee/seer2/n/am;->g:Ljava/lang/String;

    iget v7, p0, Lcom/taomee/seer2/n/p;->e:I

    invoke-static/range {v0 .. v7}, Lcom/taomee/seer2/n/aj;->a(ILandroid/content/Context;Ljava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

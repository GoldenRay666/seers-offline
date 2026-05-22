.class Le22/c55/s88/g/d;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Le22/c55/s88/g/a;


# direct methods
.method constructor <init>(Le22/c55/s88/g/a;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private a(Ljava/lang/String;)Landroid/content/Intent;
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v1, Le22/c55/s88/f/e;->ck:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.TEXT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.SUBJECT"

    sget-object v2, Le22/c55/s88/f/e;->cl:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->ap:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method private a()V
    .locals 9

    const/4 v5, 0x1

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v0

    iget v0, v0, Le22/c55/s88/e/j;->o:I

    div-int/lit16 v0, v0, 0x400

    invoke-static {}, Le22/c55/s88/f/a;->d()J

    move-result-wide v1

    long-to-int v1, v1

    if-le v1, v0, :cond_2

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v1

    invoke-static {v1}, Le22/c55/s88/f/a;->b(Le22/c55/s88/e/j;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v2}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v2

    iget v2, v2, Le22/c55/s88/e/j;->h:I

    invoke-static {v0, v1, v2}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    :cond_0
    :goto_0
    new-instance v8, Le22/c55/s88/b/f;

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v1

    iget-object v1, v1, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    invoke-direct {v8, v1, v0, v5}, Le22/c55/s88/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v0

    iget v0, v0, Le22/c55/s88/e/j;->E:I

    if-ne v0, v5, :cond_1

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Le22/c55/s88/e/g;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Le22/c55/s88/b/f;->a(Ljava/lang/String;)V

    :cond_1
    const/4 v0, -0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v8, v0}, Le22/c55/s88/b/f;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    const v1, 0x1080081

    sget-object v2, Le22/c55/s88/f/e;->S:Ljava/lang/String;

    iget-object v3, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v3}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v3

    iget v3, v3, Le22/c55/s88/e/j;->h:I

    sget v4, Le22/c55/s88/f/a;->a:I

    iget-object v5, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v5}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v5

    iget-object v6, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v6}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v6

    invoke-static {v5, v6}, Le22/c55/s88/e/b;->c(Landroid/content/Context;Le22/c55/s88/e/j;)Landroid/content/Intent;

    move-result-object v5

    iget-object v6, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v6}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v6

    iget-object v6, v6, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static/range {v0 .. v7}, Le22/c55/s88/e/g;->a(Landroid/content/Context;ILjava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

    new-instance v0, Le22/c55/s88/e/a;

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v2}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Le22/c55/s88/e/a;-><init>(Landroid/content/Context;Le22/c55/s88/e/j;Landroid/os/Handler;)V

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, v8, v0}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Le22/c55/s88/b/f;Le22/c55/s88/b/a;)V

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    iget-object v0, v0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    sget-object v1, Le22/c55/s88/f/e;->S:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->h(Ljava/lang/String;)V

    :goto_1
    return-void

    :cond_2
    invoke-static {}, Le22/c55/s88/f/a;->e()J

    move-result-wide v1

    int-to-long v3, v0

    cmp-long v0, v1, v3

    if-lez v0, :cond_3

    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->aO:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v2}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v2}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v2

    invoke-static {v2}, Le22/c55/s88/f/a;->b(Le22/c55/s88/e/j;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    goto/16 :goto_0

    :cond_3
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    sget-object v1, Le22/c55/s88/f/e;->I:Ljava/lang/String;

    const/16 v2, 0xbb8

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_1
.end method

.method private a(Landroid/content/Context;Le22/c55/s88/e/j;)V
    .locals 7

    const/4 v6, 0x1

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p2, Le22/c55/s88/e/j;->l:Ljava/lang/Integer;

    invoke-static {p1, p2}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Le22/c55/s88/e/j;)Z

    invoke-static {p1, p2}, Le22/c55/s88/f/a;->g(Landroid/content/Context;Le22/c55/s88/e/j;)V

    invoke-static {p1}, Le22/c55/s88/e/g;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iget v0, p2, Le22/c55/s88/e/j;->o:I

    div-int/lit16 v0, v0, 0x400

    invoke-static {}, Le22/c55/s88/f/a;->d()J

    move-result-wide v2

    long-to-int v2, v2

    if-le v2, v0, :cond_3

    invoke-static {p2}, Le22/c55/s88/f/a;->b(Le22/c55/s88/e/j;)Ljava/lang/String;

    move-result-object v0

    iget v2, p2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v0, v2}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    :cond_0
    :goto_0
    new-instance v2, Le22/c55/s88/b/f;

    iget-object v3, p2, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    invoke-direct {v2, v3, v0, v6}, Le22/c55/s88/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    iget v0, p2, Le22/c55/s88/e/j;->E:I

    if-ne v0, v6, :cond_1

    invoke-static {p1}, Le22/c55/s88/e/g;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Le22/c55/s88/b/f;->a(Ljava/lang/String;)V

    :cond_1
    const/4 v0, -0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, v0}, Le22/c55/s88/b/f;->a(Ljava/lang/Object;)V

    new-instance v0, Le22/c55/s88/e/a;

    const/4 v3, 0x0

    invoke-direct {v0, p1, p2, v3}, Le22/c55/s88/e/a;-><init>(Landroid/content/Context;Le22/c55/s88/e/j;Landroid/os/Handler;)V

    invoke-static {p1, v2, v0}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Le22/c55/s88/b/f;Le22/c55/s88/b/a;)V

    const-string v0, "wifi"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {v2}, Le22/c55/s88/b/f;->f()V

    :cond_2
    :goto_1
    return-void

    :cond_3
    invoke-static {}, Le22/c55/s88/f/a;->e()J

    move-result-wide v2

    int-to-long v4, v0

    cmp-long v0, v2, v4

    if-lez v0, :cond_4

    new-instance v0, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Le22/c55/s88/f/e;->aO:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p2}, Le22/c55/s88/f/a;->b(Le22/c55/s88/e/j;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    goto :goto_0

    :cond_4
    sget-object v0, Le22/c55/s88/f/e;->A:Ljava/lang/String;

    const/16 v1, 0xbb8

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_1
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 10

    const/4 v2, -0x1

    const/high16 v9, 0x10000000

    const/4 v8, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_0
    :goto_0
    :sswitch_0
    return-void

    :sswitch_1
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v1

    invoke-static {v0, v1}, Le22/c55/s88/Vaa;->a(Landroid/content/Context;Le22/c55/s88/e/j;)V

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Le22/c55/s88/f/e;->B:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v3}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v3

    iget-object v3, v3, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v3, Le22/c55/s88/f/e;->C:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v0

    iget-byte v0, v0, Le22/c55/s88/e/j;->e:B

    const/4 v1, 0x7

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    iget-object v3, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v3}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v3

    sget v4, Le22/c55/s88/f/a;->a:I

    invoke-static/range {v0 .. v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Landroid/content/Intent;ILe22/c55/s88/e/j;IZZ)V

    :cond_1
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    :sswitch_2
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v0

    iget-boolean v0, v0, Le22/c55/s88/e/j;->j:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v1

    iget-object v1, v1, Le22/c55/s88/e/j;->i:Ljava/lang/String;

    invoke-static {v0, v1}, Le22/c55/s88/f/a;->e(Landroid/content/Context;Ljava/lang/String;)Z

    goto :goto_0

    :cond_2
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->e(Le22/c55/s88/g/a;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v1

    invoke-static {v1}, Le22/c55/s88/f/a;->b(Le22/c55/s88/e/j;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v2}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v2

    iget v2, v2, Le22/c55/s88/e/j;->h:I

    invoke-static {v0, v1, v2}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v2}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v2

    iget-object v2, v2, Le22/c55/s88/e/j;->i:Ljava/lang/String;

    invoke-static {v1, v0, v2, v5}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    goto/16 :goto_0

    :cond_3
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0, v5}, Le22/c55/s88/g/a;->a(Le22/c55/s88/g/a;Z)Z

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    iget-object v0, v0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    sget-object v1, Le22/c55/s88/f/e;->R:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->h(Ljava/lang/String;)V

    :cond_4
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->f(Le22/c55/s88/g/a;)I

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Le22/c55/s88/e/j;->l:Ljava/lang/Integer;

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v1

    invoke-static {v0, v1}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Le22/c55/s88/e/j;)Z

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v2}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Le22/c55/s88/VManager;->getMainChildService(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v1, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :goto_1
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v0

    iget-byte v0, v0, Le22/c55/s88/e/j;->e:B

    packed-switch v0, :pswitch_data_0

    :goto_2
    :pswitch_0
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v0

    iget-byte v0, v0, Le22/c55/s88/e/j;->e:B

    const/16 v1, 0xd

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v0

    iget-byte v0, v0, Le22/c55/s88/e/j;->e:B

    if-eq v0, v6, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v0

    iget-byte v0, v0, Le22/c55/s88/e/j;->e:B

    const/16 v1, 0xc

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto/16 :goto_0

    :cond_5
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->f(Le22/c55/s88/g/a;)I

    move-result v0

    if-ne v0, v6, :cond_6

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v1

    iget v1, v1, Le22/c55/s88/e/j;->h:I

    invoke-static {v0, v1, v8}, Le22/c55/s88/f/a;->a(Landroid/content/Context;II)Z

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v2}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Le22/c55/s88/VManager;->getMainChildService(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v1, Le22/c55/s88/f/e;->bJ:Ljava/lang/String;

    invoke-virtual {v0, v1, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    const/16 v2, 0xc

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_1

    :cond_6
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->f(Le22/c55/s88/g/a;)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_7

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v1

    iget v1, v1, Le22/c55/s88/e/j;->h:I

    invoke-static {v0, v1, v8}, Le22/c55/s88/f/a;->b(Landroid/content/Context;II)Z

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v2}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Le22/c55/s88/VManager;->getMainChildService(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v1, Le22/c55/s88/f/e;->bJ:Ljava/lang/String;

    invoke-virtual {v0, v1, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    const/16 v2, 0xd

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto/16 :goto_1

    :cond_7
    invoke-static {}, Le22/c55/s88/c/a;->a()Le22/c55/s88/c/a;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v2}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v2

    iget v2, v2, Le22/c55/s88/e/j;->h:I

    invoke-virtual {v0, v1, v2, v6}, Le22/c55/s88/c/a;->a(Landroid/content/Context;II)V

    goto/16 :goto_1

    :pswitch_1
    invoke-direct {p0}, Le22/c55/s88/g/d;->a()V

    goto/16 :goto_2

    :pswitch_2
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v0

    iget-object v0, v0, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v1

    iget-object v1, v1, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    const-string v2, "]"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    iget-object v2, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v2}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v2

    iget-object v2, v2, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v2}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v2

    iget-object v2, v2, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    const-string v3, "["

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    iget-object v2, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v2}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v2

    iget-object v2, v2, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    const-string v3, "]"

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    iget-object v3, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v3}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v3

    iget-object v3, v3, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    invoke-virtual {v3, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string v3, "android.intent.action.SENDTO"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v2, v9}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "smsto:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    sget-object v0, Le22/c55/s88/f/e;->cj:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    :pswitch_3
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v0

    iget-object v0, v0, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v1

    iget-object v1, v1, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    const-string v2, "]"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    iget-object v2, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v2}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v2

    iget-object v2, v2, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string v3, "android.intent.action.DIAL"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v2, v9}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object v3, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v3}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v3

    iget-object v3, v3, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    invoke-virtual {v3, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Le22/c55/s88/f/e;->cr:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    :pswitch_4
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v0

    iget-object v0, v0, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v1

    iget-object v1, v1, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    iget-object v2, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v2}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v2

    iget-object v2, v2, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    array-length v1, v0

    if-ne v1, v8, :cond_0

    aget-object v1, v0, v5

    invoke-static {v1}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    aget-object v0, v0, v6

    invoke-static {v0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    new-instance v7, Landroid/content/Intent;

    invoke-direct {v7}, Landroid/content/Intent;-><init>()V

    const-string v0, "android.intent.action.VIEW"

    invoke-virtual {v7, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v7, v9}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v0, "http://ditu.google.cn/maps?hl=zh&mrt=loc&q=%s,%s"

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v8, v5

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    aput-object v1, v8, v6

    invoke-static {v0, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, v7, v5}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_8

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_9

    :cond_8
    sget-object v0, Le22/c55/s88/f/e;->cb:Ljava/lang/String;

    const-string v1, "not find the matched Activity click action not work!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_9
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    sget-object v2, Le22/c55/s88/f/e;->cs:Ljava/lang/String;

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    :cond_b
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    :pswitch_5
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v1

    iget-object v1, v1, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    invoke-static {v0, v1}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Le22/c55/s88/e/j;->l:Ljava/lang/Integer;

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v1

    invoke-static {v0, v1}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Le22/c55/s88/e/j;)Z

    goto/16 :goto_2

    :sswitch_3
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v0

    iget v0, v0, Le22/c55/s88/e/j;->B:I

    if-ne v0, v6, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    iget-object v3, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v3}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v3

    sget v4, Le22/c55/s88/f/a;->a:I

    invoke-static/range {v0 .. v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Landroid/content/Intent;ILe22/c55/s88/e/j;IZZ)V

    goto/16 :goto_0

    :sswitch_4
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v1, Le22/c55/s88/f/e;->ck:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.TEXT"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v3}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v3

    iget-object v3, v3, Le22/c55/s88/e/j;->m:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v3}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v3

    iget-object v3, v3, Le22/c55/s88/e/j;->b:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v3}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v3

    iget-object v3, v3, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v0, v9}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v1

    sget-object v2, Le22/c55/s88/f/e;->D:Ljava/lang/String;

    invoke-static {v0, v2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    :sswitch_5
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->G:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v2}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v2

    iget-object v2, v2, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Le22/c55/s88/f/e;->H:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x5dc

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    :sswitch_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Le22/c55/s88/f/e;->E:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v1

    iget-object v1, v1, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Le22/c55/s88/f/e;->F:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v1

    iget-object v1, v1, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v1

    invoke-direct {p0, v0}, Le22/c55/s88/g/d;->a(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    :sswitch_7
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->a(Le22/c55/s88/g/a;)V

    goto/16 :goto_0

    :sswitch_8
    iget-object v0, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->b(Le22/c55/s88/g/a;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/d;->a:Le22/c55/s88/g/a;

    invoke-static {v1}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Le22/c55/s88/g/d;->a(Landroid/content/Context;Le22/c55/s88/e/j;)V

    goto/16 :goto_0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1
        0x1 -> :sswitch_2
        0x2 -> :sswitch_3
        0xa -> :sswitch_0
        0xb -> :sswitch_4
        0xc -> :sswitch_0
        0x15 -> :sswitch_5
        0x16 -> :sswitch_6
        0x17 -> :sswitch_7
        0x18 -> :sswitch_8
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_5
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

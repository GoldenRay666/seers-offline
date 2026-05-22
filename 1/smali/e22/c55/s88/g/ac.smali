.class public Le22/c55/s88/g/ac;
.super Le22/c55/s88/ui/a;

# interfaces
.implements Le22/c55/s88/c/l;
.implements Le22/c55/s88/m;


# instance fields
.field e:Landroid/view/View$OnClickListener;

.field protected f:Landroid/widget/AdapterView$OnItemClickListener;

.field private g:Landroid/app/Activity;

.field private h:Le22/c55/s88/e/j;

.field private i:I

.field private j:I

.field private k:Z

.field private l:Le22/c55/s88/c/i;

.field private m:Landroid/os/Handler;

.field private n:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Le22/c55/s88/e/j;I)V
    .locals 1

    invoke-direct {p0}, Le22/c55/s88/ui/a;-><init>()V

    const/4 v0, 0x2

    iput v0, p0, Le22/c55/s88/g/ac;->j:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Le22/c55/s88/g/ac;->k:Z

    new-instance v0, Le22/c55/s88/g/ae;

    invoke-direct {v0, p0}, Le22/c55/s88/g/ae;-><init>(Le22/c55/s88/g/ac;)V

    iput-object v0, p0, Le22/c55/s88/g/ac;->m:Landroid/os/Handler;

    new-instance v0, Le22/c55/s88/g/af;

    invoke-direct {v0, p0}, Le22/c55/s88/g/af;-><init>(Le22/c55/s88/g/ac;)V

    iput-object v0, p0, Le22/c55/s88/g/ac;->n:Landroid/os/Handler;

    new-instance v0, Le22/c55/s88/g/ag;

    invoke-direct {v0, p0}, Le22/c55/s88/g/ag;-><init>(Le22/c55/s88/g/ac;)V

    iput-object v0, p0, Le22/c55/s88/g/ac;->e:Landroid/view/View$OnClickListener;

    new-instance v0, Le22/c55/s88/g/ah;

    invoke-direct {v0, p0}, Le22/c55/s88/g/ah;-><init>(Le22/c55/s88/g/ac;)V

    iput-object v0, p0, Le22/c55/s88/g/ac;->f:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {p0, p1, p2, p3}, Le22/c55/s88/g/ac;->a(Landroid/app/Activity;Le22/c55/s88/e/j;I)V

    return-void
.end method

.method static synthetic a(Le22/c55/s88/g/ac;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    invoke-direct {p0, p1}, Le22/c55/s88/g/ac;->a(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
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

    sget-object v1, Le22/c55/s88/f/e;->J:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
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

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Le22/c55/s88/f/e;->at:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p2, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Le22/c55/s88/f/e;->au:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

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

    goto/16 :goto_0

    :cond_4
    sget-object v0, Le22/c55/s88/f/e;->A:Ljava/lang/String;

    const/16 v1, 0xbb8

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_1
.end method

.method static synthetic a(Le22/c55/s88/g/ac;)V
    .locals 0

    invoke-direct {p0}, Le22/c55/s88/g/ac;->c()V

    return-void
.end method

.method static synthetic a(Le22/c55/s88/g/ac;Landroid/content/Context;Le22/c55/s88/e/j;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Le22/c55/s88/g/ac;->a(Landroid/content/Context;Le22/c55/s88/e/j;)V

    return-void
.end method

.method private a(Le22/c55/s88/g/l;)V
    .locals 3

    iget v0, p0, Le22/c55/s88/g/ac;->i:I

    invoke-virtual {p1, v0}, Le22/c55/s88/g/l;->a(I)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    iget-object v0, v0, Le22/c55/s88/e/j;->b:Ljava/lang/String;

    invoke-virtual {p1, v0}, Le22/c55/s88/g/l;->f(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    iget-object v0, v0, Le22/c55/s88/e/j;->m:Ljava/lang/String;

    invoke-virtual {p1, v0}, Le22/c55/s88/g/l;->g(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    iget-object v0, v0, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-virtual {p1, v0}, Le22/c55/s88/g/l;->a(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    iget-object v0, v0, Le22/c55/s88/e/j;->L:Ljava/lang/String;

    invoke-virtual {p1, v0}, Le22/c55/s88/g/l;->e(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    iget-object v0, v0, Le22/c55/s88/e/j;->M:Ljava/lang/String;

    invoke-virtual {p1, v0}, Le22/c55/s88/g/l;->d(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    iget-object v0, v0, Le22/c55/s88/e/j;->n:Ljava/lang/String;

    invoke-virtual {p1, v0}, Le22/c55/s88/g/l;->b(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    iget-object v0, v0, Le22/c55/s88/e/j;->p:Ljava/lang/String;

    invoke-virtual {p1, v0}, Le22/c55/s88/g/l;->c(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    iget v0, v0, Le22/c55/s88/e/j;->o:I

    invoke-virtual {p1, v0}, Le22/c55/s88/g/l;->c(I)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    iget v0, v0, Le22/c55/s88/e/j;->Q:I

    if-nez v0, :cond_3

    const v0, 0x493e0

    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    const v2, 0x186a1

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p1, v0}, Le22/c55/s88/g/l;->d(I)V

    :goto_0
    iget-object v0, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    iget-object v0, v0, Le22/c55/s88/e/j;->V:Ljava/lang/String;

    invoke-virtual {p1, v0}, Le22/c55/s88/g/l;->j(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    iget-boolean v0, v0, Le22/c55/s88/e/j;->j:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Le22/c55/s88/g/l;->c()V

    :cond_0
    iget-object v0, p0, Le22/c55/s88/g/ac;->g:Landroid/app/Activity;

    iget-object v1, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    iget-object v1, v1, Le22/c55/s88/e/j;->i:Ljava/lang/String;

    invoke-static {v0, v1}, Le22/c55/s88/f/a;->r(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    const/4 v1, 0x0

    iput v1, v0, Le22/c55/s88/e/j;->O:I

    iget-object v0, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    const/4 v1, 0x1

    iput-boolean v1, v0, Le22/c55/s88/e/j;->j:Z

    sget-object v0, Le22/c55/s88/f/e;->P:Ljava/lang/String;

    invoke-virtual {p1, v0}, Le22/c55/s88/g/l;->h(Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Le22/c55/s88/g/ac;->g:Landroid/app/Activity;

    iget-object v1, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    invoke-static {v1}, Le22/c55/s88/f/a;->b(Le22/c55/s88/e/j;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    iget v2, v2, Le22/c55/s88/e/j;->h:I

    invoke-static {v0, v1, v2}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Le22/c55/s88/f/e;->Q:Ljava/lang/String;

    invoke-virtual {p1, v0}, Le22/c55/s88/g/l;->h(Ljava/lang/String;)V

    :cond_2
    iget-object v0, p0, Le22/c55/s88/g/ac;->e:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v0}, Le22/c55/s88/g/l;->a(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->f:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {p1, v0}, Le22/c55/s88/g/l;->a(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void

    :cond_3
    iget-object v0, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    iget v0, v0, Le22/c55/s88/e/j;->Q:I

    invoke-virtual {p1, v0}, Le22/c55/s88/g/l;->d(I)V

    goto :goto_0
.end method

.method private a(Ljava/util/List;)V
    .locals 6

    iget-object v0, p0, Le22/c55/s88/g/ac;->g:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v2

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/c/e;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/PackageInfo;

    iget-object v5, v0, Le22/c55/s88/c/e;->f:Ljava/lang/String;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    iput-boolean v1, v0, Le22/c55/s88/c/e;->B:Z

    goto :goto_0

    :cond_2
    return-void
.end method

.method static synthetic a(Le22/c55/s88/g/ac;Z)Z
    .locals 0

    iput-boolean p1, p0, Le22/c55/s88/g/ac;->k:Z

    return p1
.end method

.method static synthetic b(Le22/c55/s88/g/ac;)Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/ac;->g:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic c(Le22/c55/s88/g/ac;)I
    .locals 1

    iget v0, p0, Le22/c55/s88/g/ac;->i:I

    return v0
.end method

.method private c()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/ac;->l:Le22/c55/s88/c/i;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/ac;->l:Le22/c55/s88/c/i;

    if-eqz v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/g/ac;->l:Le22/c55/s88/c/i;

    invoke-virtual {v0}, Le22/c55/s88/c/i;->a()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Le22/c55/s88/c/i;

    iget-object v1, p0, Le22/c55/s88/g/ac;->g:Landroid/app/Activity;

    invoke-direct {v0, v1}, Le22/c55/s88/c/i;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/ac;->l:Le22/c55/s88/c/i;

    iget-object v0, p0, Le22/c55/s88/g/ac;->l:Le22/c55/s88/c/i;

    iget-object v1, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    invoke-virtual {v0, v1}, Le22/c55/s88/c/i;->a(Le22/c55/s88/e/j;)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->l:Le22/c55/s88/c/i;

    invoke-virtual {v0, p0}, Le22/c55/s88/c/i;->a(Le22/c55/s88/c/l;)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->b:Landroid/view/View;

    check-cast v0, Le22/c55/s88/g/l;

    invoke-virtual {v0}, Le22/c55/s88/g/l;->a()V

    :cond_1
    return-void
.end method

.method static synthetic d(Le22/c55/s88/g/ac;)Le22/c55/s88/e/j;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    return-object v0
.end method

.method static synthetic e(Le22/c55/s88/g/ac;)Z
    .locals 1

    iget-boolean v0, p0, Le22/c55/s88/g/ac;->k:Z

    return v0
.end method

.method static synthetic f(Le22/c55/s88/g/ac;)I
    .locals 1

    iget v0, p0, Le22/c55/s88/g/ac;->j:I

    return v0
.end method


# virtual methods
.method public a(I)V
    .locals 2

    invoke-super {p0, p1}, Le22/c55/s88/ui/a;->a(I)V

    if-nez p1, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/ac;->b:Landroid/view/View;

    check-cast v0, Le22/c55/s88/g/l;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Le22/c55/s88/g/l;->a(Z)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Le22/c55/s88/g/ac;->b:Landroid/view/View;

    check-cast v0, Le22/c55/s88/g/l;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le22/c55/s88/g/l;->a(Z)V

    goto :goto_0
.end method

.method public a(Landroid/app/Activity;Le22/c55/s88/e/j;I)V
    .locals 8

    const/4 v1, 0x0

    iput-object p1, p0, Le22/c55/s88/g/ac;->g:Landroid/app/Activity;

    iput-object p2, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    iput p3, p0, Le22/c55/s88/g/ac;->j:I

    new-instance v2, Le22/c55/s88/e/a;

    iget-object v0, p0, Le22/c55/s88/g/ac;->m:Landroid/os/Handler;

    invoke-direct {v2, p1, p2, v0}, Le22/c55/s88/e/a;-><init>(Landroid/content/Context;Le22/c55/s88/e/j;Landroid/os/Handler;)V

    new-instance v0, Le22/c55/s88/b/f;

    iget-object v3, p2, Le22/c55/s88/e/j;->q:Ljava/lang/String;

    sget-object v4, Le22/c55/s88/f/e;->w:Ljava/lang/String;

    iget v5, p2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v4, v5}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v4

    invoke-direct {v0, v3, v4, v1}, Le22/c55/s88/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    const/4 v3, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Le22/c55/s88/b/f;->a(Ljava/lang/Object;)V

    invoke-static {p1, v0, v2}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Le22/c55/s88/b/f;Le22/c55/s88/b/a;)V

    iget-object v0, p2, Le22/c55/s88/e/j;->r:Ljava/lang/String;

    const-string v3, ";"

    invoke-static {v0, v3}, Le22/c55/s88/f/a;->a(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    array-length v0, v3

    iput v0, p0, Le22/c55/s88/g/ac;->i:I

    :cond_0
    move v0, v1

    :goto_0
    iget v4, p0, Le22/c55/s88/g/ac;->i:I

    if-ge v0, v4, :cond_1

    new-instance v4, Le22/c55/s88/b/f;

    aget-object v5, v3, v0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Le22/c55/s88/f/e;->x:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget v7, p2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v6, v7}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v6

    invoke-direct {v4, v5, v6, v1}, Le22/c55/s88/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Le22/c55/s88/b/f;->a(Ljava/lang/Object;)V

    invoke-static {p1, v4, v2}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Le22/c55/s88/b/f;Le22/c55/s88/b/a;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    sget v0, Le22/c55/s88/ui/d;->a:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Le22/c55/s88/g/g;

    iget-object v1, p0, Le22/c55/s88/g/ac;->g:Landroid/app/Activity;

    invoke-direct {v0, v1}, Le22/c55/s88/g/g;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/ac;->b:Landroid/view/View;

    :goto_1
    iget-object v0, p0, Le22/c55/s88/g/ac;->b:Landroid/view/View;

    check-cast v0, Le22/c55/s88/g/l;

    invoke-direct {p0, v0}, Le22/c55/s88/g/ac;->a(Le22/c55/s88/g/l;)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->m:Landroid/os/Handler;

    new-instance v1, Le22/c55/s88/g/ad;

    invoke-direct {v1, p0}, Le22/c55/s88/g/ad;-><init>(Le22/c55/s88/g/ac;)V

    const-wide/16 v2, 0x190

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    invoke-static {p0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/m;)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->n:Landroid/os/Handler;

    invoke-static {v0}, Le22/c55/s88/e/a;->a(Landroid/os/Handler;)V

    return-void

    :pswitch_0
    new-instance v0, Le22/c55/s88/g/g;

    iget-object v1, p0, Le22/c55/s88/g/ac;->g:Landroid/app/Activity;

    invoke-direct {v0, v1}, Le22/c55/s88/g/g;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/ac;->b:Landroid/view/View;

    goto :goto_1

    :pswitch_1
    new-instance v0, Le22/c55/s88/g/g;

    iget-object v1, p0, Le22/c55/s88/g/ac;->g:Landroid/app/Activity;

    invoke-direct {v0, v1}, Le22/c55/s88/g/g;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/ac;->b:Landroid/view/View;

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public a(Le22/c55/s88/e/j;)V
    .locals 2

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v0, p1, Le22/c55/s88/e/j;->h:I

    iget-object v1, p0, Le22/c55/s88/g/ac;->h:Le22/c55/s88/e/j;

    iget v1, v1, Le22/c55/s88/e/j;->h:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/ac;->m:Landroid/os/Handler;

    new-instance v1, Le22/c55/s88/g/ai;

    invoke-direct {v1, p0}, Le22/c55/s88/g/ai;-><init>(Le22/c55/s88/g/ac;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public a([Le22/c55/s88/c/e;)V
    .locals 4

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    array-length v2, p1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, p1, v0

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Le22/c55/s88/g/ac;->b:Landroid/view/View;

    check-cast v0, Le22/c55/s88/g/l;

    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0, v1}, Le22/c55/s88/g/ac;->a(Ljava/util/List;)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->b:Landroid/view/View;

    check-cast v0, Le22/c55/s88/g/l;

    invoke-virtual {v0, v1}, Le22/c55/s88/g/l;->b(Ljava/util/List;)V

    iget-object v0, p0, Le22/c55/s88/g/ac;->b:Landroid/view/View;

    check-cast v0, Le22/c55/s88/g/l;

    invoke-virtual {v0}, Le22/c55/s88/g/l;->b()V

    :cond_1
    return-void
.end method

.method public b()Z
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/ac;->b:Landroid/view/View;

    check-cast v0, Le22/c55/s88/g/l;

    invoke-virtual {v0}, Le22/c55/s88/g/l;->d()Z

    move-result v0

    return v0
.end method

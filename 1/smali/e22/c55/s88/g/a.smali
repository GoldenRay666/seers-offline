.class public Le22/c55/s88/g/a;
.super Ljava/lang/Object;

# interfaces
.implements Le22/c55/s88/c/l;
.implements Le22/c55/s88/m;


# static fields
.field static b:Ljava/util/List;


# instance fields
.field public a:Le22/c55/s88/ui/i;

.field c:Landroid/view/View$OnClickListener;

.field private d:I

.field private e:Le22/c55/s88/e/j;

.field private f:Landroid/app/Activity;

.field private g:Z

.field private h:Le22/c55/s88/e/a;

.field private i:Le22/c55/s88/c/i;

.field private j:Z

.field private k:Z

.field private l:Landroid/os/Handler;

.field private m:I

.field private n:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Le22/c55/s88/e/j;)V
    .locals 7

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v1, p0, Le22/c55/s88/g/a;->d:I

    iput-boolean v1, p0, Le22/c55/s88/g/a;->g:Z

    iput-boolean v1, p0, Le22/c55/s88/g/a;->j:Z

    iput-boolean v1, p0, Le22/c55/s88/g/a;->k:Z

    new-instance v0, Le22/c55/s88/g/c;

    invoke-direct {v0, p0}, Le22/c55/s88/g/c;-><init>(Le22/c55/s88/g/a;)V

    iput-object v0, p0, Le22/c55/s88/g/a;->l:Landroid/os/Handler;

    const/4 v0, 0x2

    iput v0, p0, Le22/c55/s88/g/a;->m:I

    new-instance v0, Le22/c55/s88/g/d;

    invoke-direct {v0, p0}, Le22/c55/s88/g/d;-><init>(Le22/c55/s88/g/a;)V

    iput-object v0, p0, Le22/c55/s88/g/a;->c:Landroid/view/View$OnClickListener;

    new-instance v0, Le22/c55/s88/g/e;

    invoke-direct {v0, p0}, Le22/c55/s88/g/e;-><init>(Le22/c55/s88/g/a;)V

    iput-object v0, p0, Le22/c55/s88/g/a;->n:Landroid/os/Handler;

    if-nez p2, :cond_0

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    :cond_0
    iput-object p1, p0, Le22/c55/s88/g/a;->f:Landroid/app/Activity;

    iput-object p2, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    new-instance v0, Le22/c55/s88/e/a;

    iget-object v2, p0, Le22/c55/s88/g/a;->l:Landroid/os/Handler;

    invoke-direct {v0, p1, p2, v2}, Le22/c55/s88/e/a;-><init>(Landroid/content/Context;Le22/c55/s88/e/j;Landroid/os/Handler;)V

    iput-object v0, p0, Le22/c55/s88/g/a;->h:Le22/c55/s88/e/a;

    new-instance v0, Le22/c55/s88/b/f;

    iget-object v2, p2, Le22/c55/s88/e/j;->q:Ljava/lang/String;

    sget-object v3, Le22/c55/s88/f/e;->w:Ljava/lang/String;

    iget v4, p2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v3, v4}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v3

    invoke-direct {v0, v2, v3, v1}, Le22/c55/s88/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Le22/c55/s88/b/f;->a(Ljava/lang/Object;)V

    iget-object v2, p0, Le22/c55/s88/g/a;->h:Le22/c55/s88/e/a;

    invoke-static {p1, v0, v2}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Le22/c55/s88/b/f;Le22/c55/s88/b/a;)V

    iget-object v0, p2, Le22/c55/s88/e/j;->r:Ljava/lang/String;

    const-string v2, ";"

    invoke-static {v0, v2}, Le22/c55/s88/f/a;->a(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    array-length v0, v2

    iput v0, p0, Le22/c55/s88/g/a;->d:I

    :cond_1
    move v0, v1

    :goto_0
    iget v3, p0, Le22/c55/s88/g/a;->d:I

    if-ge v0, v3, :cond_2

    new-instance v3, Le22/c55/s88/b/f;

    aget-object v4, v2, v0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Le22/c55/s88/f/e;->x:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iget v6, p2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v5, v6}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v5

    invoke-direct {v3, v4, v5, v1}, Le22/c55/s88/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Le22/c55/s88/b/f;->a(Ljava/lang/Object;)V

    iget-object v4, p0, Le22/c55/s88/g/a;->f:Landroid/app/Activity;

    iget-object v5, p0, Le22/c55/s88/g/a;->h:Le22/c55/s88/e/a;

    invoke-static {v4, v3, v5}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Le22/c55/s88/b/f;Le22/c55/s88/b/a;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    new-instance v0, Le22/c55/s88/b/f;

    iget-object v2, p2, Le22/c55/s88/e/j;->R:Ljava/lang/String;

    sget-object v3, Le22/c55/s88/f/e;->y:Ljava/lang/String;

    iget v4, p2, Le22/c55/s88/e/j;->h:I

    invoke-static {p1, v3, v4}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v3

    invoke-direct {v0, v2, v3, v1}, Le22/c55/s88/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    const/4 v1, -0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Le22/c55/s88/b/f;->a(Ljava/lang/Object;)V

    iget-object v1, p0, Le22/c55/s88/g/a;->h:Le22/c55/s88/e/a;

    invoke-static {p1, v0, v1}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Le22/c55/s88/b/f;Le22/c55/s88/b/a;)V

    invoke-direct {p0}, Le22/c55/s88/g/a;->c()V

    iget-object v0, p0, Le22/c55/s88/g/a;->l:Landroid/os/Handler;

    new-instance v1, Le22/c55/s88/g/b;

    invoke-direct {v1, p0}, Le22/c55/s88/g/b;-><init>(Le22/c55/s88/g/a;)V

    const-wide/16 v2, 0x190

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    invoke-static {p0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/m;)V

    iget-object v0, p0, Le22/c55/s88/g/a;->n:Landroid/os/Handler;

    invoke-static {v0}, Le22/c55/s88/e/a;->a(Landroid/os/Handler;)V

    return-void
.end method

.method static synthetic a(Le22/c55/s88/g/a;)V
    .locals 0

    invoke-direct {p0}, Le22/c55/s88/g/a;->b()V

    return-void
.end method

.method private a(Ljava/util/List;)V
    .locals 6

    iget-object v0, p0, Le22/c55/s88/g/a;->f:Landroid/app/Activity;

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

.method static synthetic a(Le22/c55/s88/g/a;Z)Z
    .locals 0

    iput-boolean p1, p0, Le22/c55/s88/g/a;->k:Z

    return p1
.end method

.method static synthetic b(Le22/c55/s88/g/a;)Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/a;->f:Landroid/app/Activity;

    return-object v0
.end method

.method private b()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/a;->i:Le22/c55/s88/c/i;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/a;->i:Le22/c55/s88/c/i;

    if-eqz v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/g/a;->i:Le22/c55/s88/c/i;

    invoke-virtual {v0}, Le22/c55/s88/c/i;->a()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Le22/c55/s88/c/i;

    iget-object v1, p0, Le22/c55/s88/g/a;->f:Landroid/app/Activity;

    invoke-direct {v0, v1}, Le22/c55/s88/c/i;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/a;->i:Le22/c55/s88/c/i;

    iget-object v0, p0, Le22/c55/s88/g/a;->i:Le22/c55/s88/c/i;

    iget-object v1, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    invoke-virtual {v0, v1}, Le22/c55/s88/c/i;->a(Le22/c55/s88/e/j;)V

    iget-object v0, p0, Le22/c55/s88/g/a;->i:Le22/c55/s88/c/i;

    invoke-virtual {v0, p0}, Le22/c55/s88/c/i;->a(Le22/c55/s88/c/l;)V

    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    invoke-virtual {v0}, Le22/c55/s88/ui/i;->a()V

    :cond_1
    return-void
.end method

.method static synthetic c(Le22/c55/s88/g/a;)I
    .locals 1

    iget v0, p0, Le22/c55/s88/g/a;->d:I

    return v0
.end method

.method private c()V
    .locals 4

    const/4 v3, 0x1

    new-instance v0, Le22/c55/s88/ui/i;

    iget-object v1, p0, Le22/c55/s88/g/a;->f:Landroid/app/Activity;

    invoke-direct {v0, v1}, Le22/c55/s88/ui/i;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    iget v1, p0, Le22/c55/s88/g/a;->d:I

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->a(I)V

    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    iget-object v1, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    iget-object v1, v1, Le22/c55/s88/e/j;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->f(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    iget-object v1, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    iget-object v1, v1, Le22/c55/s88/e/j;->m:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->g(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    iget-object v1, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    iget-object v1, v1, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->a(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    iget-object v1, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    iget-object v1, v1, Le22/c55/s88/e/j;->L:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->e(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    iget-object v1, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    iget-object v1, v1, Le22/c55/s88/e/j;->M:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->d(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    iget-boolean v0, v0, Le22/c55/s88/e/j;->j:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    invoke-virtual {v0}, Le22/c55/s88/ui/i;->c()V

    :cond_0
    iget-object v0, p0, Le22/c55/s88/g/a;->f:Landroid/app/Activity;

    iget-object v1, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    iget-object v1, v1, Le22/c55/s88/e/j;->i:Ljava/lang/String;

    invoke-static {v0, v1}, Le22/c55/s88/f/a;->r(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    const/4 v1, 0x0

    iput v1, v0, Le22/c55/s88/e/j;->O:I

    iget-object v0, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    iput-boolean v3, v0, Le22/c55/s88/e/j;->j:Z

    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    sget-object v1, Le22/c55/s88/f/e;->P:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->h(Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Le22/c55/s88/g/a;->f:Landroid/app/Activity;

    iget-object v1, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    invoke-static {v1}, Le22/c55/s88/f/a;->b(Le22/c55/s88/e/j;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    iget v2, v2, Le22/c55/s88/e/j;->h:I

    invoke-static {v0, v1, v2}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    iput-boolean v3, p0, Le22/c55/s88/g/a;->k:Z

    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    sget-object v1, Le22/c55/s88/f/e;->Q:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->h(Ljava/lang/String;)V

    :cond_2
    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    iget-object v1, p0, Le22/c55/s88/g/a;->c:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->a(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    iget-byte v0, v0, Le22/c55/s88/e/j;->e:B

    sparse-switch v0, :sswitch_data_0

    :goto_0
    return-void

    :sswitch_0
    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    iget-object v1, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    iget-object v1, v1, Le22/c55/s88/e/j;->n:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->b(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    iget-object v1, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    iget-object v1, v1, Le22/c55/s88/e/j;->p:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->c(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    iget-object v1, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    iget v1, v1, Le22/c55/s88/e/j;->o:I

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->c(I)V

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x3 -> :sswitch_0
        0x5 -> :sswitch_0
        0x7 -> :sswitch_0
        0xc -> :sswitch_0
    .end sparse-switch
.end method

.method static synthetic d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    return-object v0
.end method

.method static synthetic e(Le22/c55/s88/g/a;)Z
    .locals 1

    iget-boolean v0, p0, Le22/c55/s88/g/a;->k:Z

    return v0
.end method

.method static synthetic f(Le22/c55/s88/g/a;)I
    .locals 1

    iget v0, p0, Le22/c55/s88/g/a;->m:I

    return v0
.end method


# virtual methods
.method public a(I)V
    .locals 2

    iput p1, p0, Le22/c55/s88/g/a;->m:I

    iget-object v0, p0, Le22/c55/s88/g/a;->f:Landroid/app/Activity;

    check-cast v0, Le22/c55/s88/Vaa;

    iget-object v1, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    invoke-virtual {v0, v1}, Le22/c55/s88/Vaa;->a(Landroid/view/View;)V

    return-void
.end method

.method public a(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    invoke-virtual {v0, p1}, Le22/c55/s88/ui/i;->a(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void
.end method

.method public a(Le22/c55/s88/e/j;)V
    .locals 2

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v0, p1, Le22/c55/s88/e/j;->h:I

    iget-object v1, p0, Le22/c55/s88/g/a;->e:Le22/c55/s88/e/j;

    iget v1, v1, Le22/c55/s88/e/j;->h:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/a;->l:Landroid/os/Handler;

    new-instance v1, Le22/c55/s88/g/f;

    invoke-direct {v1, p0}, Le22/c55/s88/g/f;-><init>(Le22/c55/s88/g/a;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public a([Le22/c55/s88/c/e;)V
    .locals 5

    const/4 v1, 0x0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Le22/c55/s88/g/a;->b:Ljava/util/List;

    array-length v2, p1

    move v0, v1

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, p1, v0

    sget-object v4, Le22/c55/s88/g/a;->b:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    if-eqz v0, :cond_1

    sget-object v0, Le22/c55/s88/g/a;->b:Ljava/util/List;

    if-eqz v0, :cond_1

    sget-object v0, Le22/c55/s88/g/a;->b:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Le22/c55/s88/g/a;->b:Ljava/util/List;

    invoke-direct {p0, v0}, Le22/c55/s88/g/a;->a(Ljava/util/List;)V

    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    sget-object v2, Le22/c55/s88/g/a;->b:Ljava/util/List;

    invoke-virtual {v0, v2}, Le22/c55/s88/ui/i;->b(Ljava/util/List;)V

    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    invoke-virtual {v0}, Le22/c55/s88/ui/i;->b()V

    :cond_1
    iput-boolean v1, p0, Le22/c55/s88/g/a;->g:Z

    return-void
.end method

.method public a()Z
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    invoke-virtual {v0}, Le22/c55/s88/ui/i;->d()Z

    move-result v0

    return v0
.end method

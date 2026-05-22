.class public Le22/c55/s88/g/s;
.super Ljava/lang/Object;

# interfaces
.implements Le22/c55/s88/e/f;
.implements Le22/c55/s88/o;


# instance fields
.field private a:Landroid/app/Activity;

.field private b:Le22/c55/s88/g/y;

.field private c:Landroid/widget/FrameLayout;

.field private d:Le22/c55/s88/g/a;

.field private e:Ljava/util/List;

.field private f:Landroid/os/Handler;

.field private g:I

.field private h:Landroid/widget/AdapterView$OnItemClickListener;

.field private i:Landroid/os/Handler;

.field private j:Le22/c55/s88/e/j;

.field private k:Landroid/widget/AdapterView$OnItemClickListener;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Le22/c55/s88/e/j;Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 3

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le22/c55/s88/g/s;->e:Ljava/util/List;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Le22/c55/s88/g/s;->f:Landroid/os/Handler;

    iput v1, p0, Le22/c55/s88/g/s;->g:I

    iput-object v2, p0, Le22/c55/s88/g/s;->h:Landroid/widget/AdapterView$OnItemClickListener;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Le22/c55/s88/g/s;->i:Landroid/os/Handler;

    iput-object v2, p0, Le22/c55/s88/g/s;->j:Le22/c55/s88/e/j;

    new-instance v0, Le22/c55/s88/g/v;

    invoke-direct {v0, p0}, Le22/c55/s88/g/v;-><init>(Le22/c55/s88/g/s;)V

    iput-object v0, p0, Le22/c55/s88/g/s;->k:Landroid/widget/AdapterView$OnItemClickListener;

    iput-object p1, p0, Le22/c55/s88/g/s;->a:Landroid/app/Activity;

    iput-object p2, p0, Le22/c55/s88/g/s;->j:Le22/c55/s88/e/j;

    iput-object p3, p0, Le22/c55/s88/g/s;->h:Landroid/widget/AdapterView$OnItemClickListener;

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Le22/c55/s88/g/s;->a(Z)Landroid/widget/FrameLayout;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/g/s;->c:Landroid/widget/FrameLayout;

    iput v1, p0, Le22/c55/s88/g/s;->g:I

    iget v0, p0, Le22/c55/s88/g/s;->g:I

    invoke-virtual {p0, v0}, Le22/c55/s88/g/s;->a(I)V

    invoke-static {p0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/o;)V

    return-void
.end method

.method static synthetic a(Le22/c55/s88/g/s;)I
    .locals 1

    iget v0, p0, Le22/c55/s88/g/s;->g:I

    return v0
.end method

.method static synthetic a(Le22/c55/s88/g/s;I)I
    .locals 0

    iput p1, p0, Le22/c55/s88/g/s;->g:I

    return p1
.end method

.method static synthetic a(Le22/c55/s88/g/s;Z)Landroid/widget/FrameLayout;
    .locals 1

    invoke-direct {p0, p1}, Le22/c55/s88/g/s;->a(Z)Landroid/widget/FrameLayout;

    move-result-object v0

    return-object v0
.end method

.method private a(Z)Landroid/widget/FrameLayout;
    .locals 6

    const/16 v5, 0x11

    const/4 v4, -0x2

    new-instance v0, Landroid/widget/FrameLayout;

    iget-object v1, p0, Le22/c55/s88/g/s;->a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const v1, -0xd8d8d9

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    iget-object v1, p0, Le22/c55/s88/g/s;->a:Landroid/app/Activity;

    iget-object v2, p0, Le22/c55/s88/g/s;->j:Le22/c55/s88/e/j;

    invoke-static {v1, v2}, Le22/c55/s88/g/y;->a(Landroid/content/Context;Le22/c55/s88/e/j;)Landroid/widget/FrameLayout;

    move-result-object v1

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x30

    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    if-eqz p1, :cond_0

    new-instance v1, Landroid/widget/ProgressBar;

    iget-object v2, p0, Le22/c55/s88/g/s;->a:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iput v5, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_0
    return-object v0

    :cond_0
    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Le22/c55/s88/g/s;->a:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget-object v2, Le22/c55/s88/f/e;->ae:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v2, 0x41c80000    # 25.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v2, Le22/c55/s88/g/u;

    invoke-direct {v2, p0}, Le22/c55/s88/g/u;-><init>(Le22/c55/s88/g/s;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iput v5, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method static synthetic a(Le22/c55/s88/g/s;Le22/c55/s88/g/a;)Le22/c55/s88/g/a;
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/s;->d:Le22/c55/s88/g/a;

    return-object p1
.end method

.method static synthetic b(Le22/c55/s88/g/s;)Le22/c55/s88/g/y;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/s;->b:Le22/c55/s88/g/y;

    return-object v0
.end method

.method private b([Le22/c55/s88/e/j;)V
    .locals 7

    const/4 v0, 0x0

    iget-object v1, p0, Le22/c55/s88/g/s;->a:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v2

    array-length v3, p1

    move v1, v0

    :goto_0
    if-ge v1, v3, :cond_2

    aget-object v4, p1, v1

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/PackageInfo;

    iget-object v6, v4, Le22/c55/s88/e/j;->i:Ljava/lang/String;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, v4, Le22/c55/s88/e/j;->j:Z

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_2
    return-void
.end method

.method static synthetic c(Le22/c55/s88/g/s;)Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/s;->a:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic d(Le22/c55/s88/g/s;)Ljava/util/List;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/s;->e:Ljava/util/List;

    return-object v0
.end method

.method static synthetic e(Le22/c55/s88/g/s;)Le22/c55/s88/g/a;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/s;->d:Le22/c55/s88/g/a;

    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/s;->i:Landroid/os/Handler;

    new-instance v1, Le22/c55/s88/g/w;

    invoke-direct {v1, p0}, Le22/c55/s88/g/w;-><init>(Le22/c55/s88/g/s;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public a(I)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/g/s;->a:Landroid/app/Activity;

    iget-object v2, p0, Le22/c55/s88/g/s;->a:Landroid/app/Activity;

    invoke-static {v2}, Le22/c55/s88/VManager;->getMainChildService(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v1, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bZ:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bJ:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->cq:Ljava/lang/String;

    iget-object v2, p0, Le22/c55/s88/g/s;->j:Le22/c55/s88/e/j;

    iget v2, v2, Le22/c55/s88/e/j;->h:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/g/s;->a:Landroid/app/Activity;

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    invoke-static {p0}, Le22/c55/s88/e/b;->a(Le22/c55/s88/e/f;)V

    return-void
.end method

.method public a([Le22/c55/s88/e/j;)V
    .locals 6

    invoke-direct {p0, p1}, Le22/c55/s88/g/s;->b([Le22/c55/s88/e/j;)V

    array-length v1, p1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    aget-object v2, p1, v0

    iget-object v3, p0, Le22/c55/s88/g/s;->e:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Le22/c55/s88/g/s;->a:Landroid/app/Activity;

    iget v1, p0, Le22/c55/s88/g/s;->g:I

    invoke-static {v0, p1, v1}, Le22/c55/s88/f/a;->a(Landroid/content/Context;[Le22/c55/s88/e/j;I)Z

    iget v0, p0, Le22/c55/s88/g/s;->g:I

    if-nez v0, :cond_1

    new-instance v0, Le22/c55/s88/g/y;

    iget-object v1, p0, Le22/c55/s88/g/s;->a:Landroid/app/Activity;

    iget-object v2, p0, Le22/c55/s88/g/s;->k:Landroid/widget/AdapterView$OnItemClickListener;

    iget-object v3, p0, Le22/c55/s88/g/s;->j:Le22/c55/s88/e/j;

    iget-object v4, p0, Le22/c55/s88/g/s;->e:Ljava/util/List;

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Le22/c55/s88/g/y;-><init>(Landroid/content/Context;Landroid/widget/AdapterView$OnItemClickListener;Le22/c55/s88/e/j;Ljava/util/List;Le22/c55/s88/g/s;)V

    iput-object v0, p0, Le22/c55/s88/g/s;->b:Le22/c55/s88/g/y;

    :cond_1
    iget-object v0, p0, Le22/c55/s88/g/s;->f:Landroid/os/Handler;

    new-instance v1, Le22/c55/s88/g/t;

    invoke-direct {v1, p0, p1}, Le22/c55/s88/g/t;-><init>(Le22/c55/s88/g/s;[Le22/c55/s88/e/j;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public b()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/s;->a:Landroid/app/Activity;

    iget-object v1, p0, Le22/c55/s88/g/s;->c:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method public c()Z
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/s;->d:Le22/c55/s88/g/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/s;->d:Le22/c55/s88/g/a;

    invoke-virtual {v0}, Le22/c55/s88/g/a;->a()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

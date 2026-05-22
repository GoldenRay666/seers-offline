.class public Le22/c55/s88/ui/n;
.super Ljava/lang/Object;

# interfaces
.implements Le22/c55/s88/e/f;
.implements Le22/c55/s88/o;


# instance fields
.field a:Landroid/widget/AdapterView$OnItemClickListener;

.field private b:Le22/c55/s88/Vaa;

.field private c:Landroid/view/View;

.field private d:Le22/c55/s88/ui/d;

.field private e:Landroid/widget/FrameLayout;

.field private f:I

.field private g:Landroid/os/Handler;

.field private h:Landroid/widget/FrameLayout;

.field private i:Landroid/widget/ProgressBar;

.field private j:Le22/c55/s88/g/p;

.field private k:Ljava/util/List;

.field private l:I

.field private m:Le22/c55/s88/a/d;

.field private n:I

.field private o:I

.field private p:Landroid/widget/FrameLayout$LayoutParams;


# direct methods
.method public constructor <init>(Le22/c55/s88/Vaa;Le22/c55/s88/ui/d;I)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Le22/c55/s88/ui/n;->f:I

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Le22/c55/s88/ui/n;->g:Landroid/os/Handler;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le22/c55/s88/ui/n;->k:Ljava/util/List;

    iput v1, p0, Le22/c55/s88/ui/n;->n:I

    iput v1, p0, Le22/c55/s88/ui/n;->o:I

    new-instance v0, Le22/c55/s88/ui/r;

    invoke-direct {v0, p0}, Le22/c55/s88/ui/r;-><init>(Le22/c55/s88/ui/n;)V

    iput-object v0, p0, Le22/c55/s88/ui/n;->a:Landroid/widget/AdapterView$OnItemClickListener;

    iput-object p1, p0, Le22/c55/s88/ui/n;->b:Le22/c55/s88/Vaa;

    iput-object p2, p0, Le22/c55/s88/ui/n;->d:Le22/c55/s88/ui/d;

    iput p3, p0, Le22/c55/s88/ui/n;->l:I

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/n;->c:Landroid/view/View;

    iget-object v0, p0, Le22/c55/s88/ui/n;->c:Landroid/view/View;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-direct {p0, v0}, Le22/c55/s88/ui/n;->a(Landroid/widget/LinearLayout;)V

    invoke-virtual {p0}, Le22/c55/s88/ui/n;->b()V

    return-void
.end method

.method static synthetic a(Le22/c55/s88/ui/n;I)I
    .locals 0

    iput p1, p0, Le22/c55/s88/ui/n;->n:I

    return p1
.end method

.method private a(Landroid/widget/LinearLayout;)V
    .locals 9

    const/4 v8, 0x5

    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v4, -0x2

    const/4 v5, -0x1

    invoke-virtual {p1, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Le22/c55/s88/ui/n;->b:Le22/c55/s88/Vaa;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const v1, -0xff7231

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, 0x3

    invoke-direct {v1, v5, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    new-instance v1, Landroid/widget/FrameLayout;

    iget-object v2, p0, Le22/c55/s88/ui/n;->b:Le22/c55/s88/Vaa;

    invoke-direct {v1, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/ui/n;->e:Landroid/widget/FrameLayout;

    iget-object v1, p0, Le22/c55/s88/ui/n;->e:Landroid/widget/FrameLayout;

    iget-object v2, p0, Le22/c55/s88/ui/n;->b:Le22/c55/s88/Vaa;

    const/16 v3, 0x31

    invoke-static {v2, v3}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x11

    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Le22/c55/s88/ui/n;->b:Le22/c55/s88/Vaa;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget-object v3, Le22/c55/s88/f/e;->bk:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, -0x1000000

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v3, 0x41c80000    # 25.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v3, p0, Le22/c55/s88/ui/n;->b:Le22/c55/s88/Vaa;

    invoke-static {v3, v8}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iget-object v4, p0, Le22/c55/s88/ui/n;->b:Le22/c55/s88/Vaa;

    invoke-static {v4, v8}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v2, v6, v3, v6, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v3, p0, Le22/c55/s88/ui/n;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v2, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Le22/c55/s88/ui/n;->e:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/FrameLayout;

    iget-object v1, p0, Le22/c55/s88/ui/n;->b:Le22/c55/s88/Vaa;

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/n;->h:Landroid/widget/FrameLayout;

    invoke-direct {p0}, Le22/c55/s88/ui/n;->e()V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Le22/c55/s88/ui/n;->h:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static synthetic a(Le22/c55/s88/ui/n;)V
    .locals 0

    invoke-direct {p0}, Le22/c55/s88/ui/n;->f()V

    return-void
.end method

.method static synthetic a(Le22/c55/s88/ui/n;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0, p1}, Le22/c55/s88/ui/n;->a(Ljava/util/List;)V

    return-void
.end method

.method private a(Ljava/util/List;)V
    .locals 4

    const/4 v3, 0x0

    const/4 v2, -0x1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    iget v0, p0, Le22/c55/s88/ui/n;->o:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Le22/c55/s88/ui/n;->o:I

    :cond_0
    iget-object v0, p0, Le22/c55/s88/ui/n;->h:Landroid/widget/FrameLayout;

    iget-object v1, p0, Le22/c55/s88/ui/n;->i:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    iget-object v0, p0, Le22/c55/s88/ui/n;->j:Le22/c55/s88/g/p;

    if-eqz v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/ui/n;->m:Le22/c55/s88/a/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/ui/n;->m:Le22/c55/s88/a/d;

    invoke-virtual {v0, p1}, Le22/c55/s88/a/d;->a(Ljava/util/List;)V

    iget-object v0, p0, Le22/c55/s88/ui/n;->j:Le22/c55/s88/g/p;

    invoke-virtual {v0}, Le22/c55/s88/g/p;->c()V

    :goto_0
    return-void

    :cond_1
    new-instance v0, Le22/c55/s88/g/p;

    iget-object v1, p0, Le22/c55/s88/ui/n;->b:Le22/c55/s88/Vaa;

    invoke-direct {v0, v1, p0}, Le22/c55/s88/g/p;-><init>(Landroid/content/Context;Le22/c55/s88/ui/n;)V

    iput-object v0, p0, Le22/c55/s88/ui/n;->j:Le22/c55/s88/g/p;

    iget-object v0, p0, Le22/c55/s88/ui/n;->j:Le22/c55/s88/g/p;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le22/c55/s88/g/p;->setDivider(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Le22/c55/s88/ui/n;->j:Le22/c55/s88/g/p;

    invoke-virtual {v0, v3}, Le22/c55/s88/g/p;->setDividerHeight(I)V

    iget-object v0, p0, Le22/c55/s88/ui/n;->j:Le22/c55/s88/g/p;

    invoke-virtual {v0, v3}, Le22/c55/s88/g/p;->setFadingEdgeLength(I)V

    iget-object v0, p0, Le22/c55/s88/ui/n;->h:Landroid/widget/FrameLayout;

    iget-object v1, p0, Le22/c55/s88/ui/n;->j:Le22/c55/s88/g/p;

    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    new-instance v0, Le22/c55/s88/a/d;

    iget-object v1, p0, Le22/c55/s88/ui/n;->b:Le22/c55/s88/Vaa;

    iget-object v2, p0, Le22/c55/s88/ui/n;->j:Le22/c55/s88/g/p;

    invoke-direct {v0, v1, p1, v2}, Le22/c55/s88/a/d;-><init>(Landroid/content/Context;Ljava/util/List;Landroid/widget/ListView;)V

    iput-object v0, p0, Le22/c55/s88/ui/n;->m:Le22/c55/s88/a/d;

    iget-object v0, p0, Le22/c55/s88/ui/n;->j:Le22/c55/s88/g/p;

    iget-object v1, p0, Le22/c55/s88/ui/n;->m:Le22/c55/s88/a/d;

    invoke-virtual {v0, v1}, Le22/c55/s88/g/p;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v0, p0, Le22/c55/s88/ui/n;->j:Le22/c55/s88/g/p;

    invoke-virtual {v0}, Le22/c55/s88/g/p;->c()V

    iget-object v0, p0, Le22/c55/s88/ui/n;->m:Le22/c55/s88/a/d;

    invoke-virtual {v0}, Le22/c55/s88/a/d;->notifyDataSetChanged()V

    goto :goto_0
.end method

.method static synthetic a(Le22/c55/s88/ui/n;Ljava/util/List;Le22/c55/s88/e/j;)Z
    .locals 1

    invoke-direct {p0, p1, p2}, Le22/c55/s88/ui/n;->a(Ljava/util/List;Le22/c55/s88/e/j;)Z

    move-result v0

    return v0
.end method

.method private a(Ljava/util/List;Le22/c55/s88/e/j;)Z
    .locals 3

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/e/j;

    iget v0, v0, Le22/c55/s88/e/j;->h:I

    iget v2, p2, Le22/c55/s88/e/j;->h:I

    if-ne v0, v2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic b(Le22/c55/s88/ui/n;)I
    .locals 1

    iget v0, p0, Le22/c55/s88/ui/n;->n:I

    return v0
.end method

.method static synthetic c(Le22/c55/s88/ui/n;)Ljava/util/List;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/n;->k:Ljava/util/List;

    return-object v0
.end method

.method static synthetic d(Le22/c55/s88/ui/n;)Le22/c55/s88/Vaa;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/n;->b:Le22/c55/s88/Vaa;

    return-object v0
.end method

.method static synthetic e(Le22/c55/s88/ui/n;)Le22/c55/s88/g/p;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/n;->j:Le22/c55/s88/g/p;

    return-object v0
.end method

.method private e()V
    .locals 3

    const/4 v2, -0x2

    iget-object v0, p0, Le22/c55/s88/ui/n;->h:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    iget-object v0, p0, Le22/c55/s88/ui/n;->h:Landroid/widget/FrameLayout;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Le22/c55/s88/ui/n;->p:Landroid/widget/FrameLayout$LayoutParams;

    iget-object v0, p0, Le22/c55/s88/ui/n;->p:Landroid/widget/FrameLayout$LayoutParams;

    const/16 v1, 0x11

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    new-instance v0, Landroid/widget/ProgressBar;

    iget-object v1, p0, Le22/c55/s88/ui/n;->b:Le22/c55/s88/Vaa;

    invoke-direct {v0, v1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/n;->i:Landroid/widget/ProgressBar;

    iget-object v0, p0, Le22/c55/s88/ui/n;->h:Landroid/widget/FrameLayout;

    iget-object v1, p0, Le22/c55/s88/ui/n;->i:Landroid/widget/ProgressBar;

    iget-object v2, p0, Le22/c55/s88/ui/n;->p:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static synthetic f(Le22/c55/s88/ui/n;)Le22/c55/s88/ui/d;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/n;->d:Le22/c55/s88/ui/d;

    return-object v0
.end method

.method private f()V
    .locals 3

    const/4 v2, -0x2

    iget-object v0, p0, Le22/c55/s88/ui/n;->h:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Le22/c55/s88/ui/n;->b:Le22/c55/s88/Vaa;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget-object v1, Le22/c55/s88/f/e;->bY:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Le22/c55/s88/ui/o;

    invoke-direct {v1, p0}, Le22/c55/s88/ui/o;-><init>(Le22/c55/s88/ui/n;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Le22/c55/s88/ui/n;->p:Landroid/widget/FrameLayout$LayoutParams;

    iget-object v0, p0, Le22/c55/s88/ui/n;->p:Landroid/widget/FrameLayout$LayoutParams;

    const/16 v1, 0x11

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v0, p0, Le22/c55/s88/ui/n;->h:Landroid/widget/FrameLayout;

    iget-object v1, p0, Le22/c55/s88/ui/n;->i:Landroid/widget/ProgressBar;

    iget-object v2, p0, Le22/c55/s88/ui/n;->p:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    iget v0, p0, Le22/c55/s88/ui/n;->n:I

    if-nez v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/ui/n;->g:Landroid/os/Handler;

    new-instance v1, Le22/c55/s88/ui/q;

    invoke-direct {v1, p0}, Le22/c55/s88/ui/q;-><init>(Le22/c55/s88/ui/n;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public a(I)V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/ui/n;->c:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget-object v1, p0, Le22/c55/s88/ui/n;->c:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le22/c55/s88/ui/n;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget-object v1, p0, Le22/c55/s88/ui/n;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public a([Le22/c55/s88/e/j;)V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/ui/n;->g:Landroid/os/Handler;

    new-instance v1, Le22/c55/s88/ui/p;

    invoke-direct {v1, p0, p1}, Le22/c55/s88/ui/p;-><init>(Le22/c55/s88/ui/n;[Le22/c55/s88/e/j;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public b()V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/ui/n;->b:Le22/c55/s88/Vaa;

    iget-object v2, p0, Le22/c55/s88/ui/n;->b:Le22/c55/s88/Vaa;

    invoke-static {v2}, Le22/c55/s88/VManager;->getMainChildService(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v1, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    const/4 v2, 0x7

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bZ:Ljava/lang/String;

    iget v2, p0, Le22/c55/s88/ui/n;->n:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bJ:Ljava/lang/String;

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->ca:Ljava/lang/String;

    iget v2, p0, Le22/c55/s88/ui/n;->l:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/ui/n;->b:Le22/c55/s88/Vaa;

    invoke-virtual {v1, v0}, Le22/c55/s88/Vaa;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    invoke-static {p0}, Le22/c55/s88/e/b;->a(Le22/c55/s88/e/f;)V

    invoke-static {p0}, Le22/c55/s88/Vss;->a(Le22/c55/s88/o;)V

    return-void
.end method

.method public c()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/n;->c:Landroid/view/View;

    return-object v0
.end method

.method public d()I
    .locals 1

    iget v0, p0, Le22/c55/s88/ui/n;->n:I

    return v0
.end method

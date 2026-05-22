.class public Le22/c55/s88/g/z;
.super Landroid/widget/ListView;


# instance fields
.field private a:Landroid/widget/ProgressBar;

.field private b:Landroid/content/Context;

.field private c:Z

.field private d:Le22/c55/s88/g/s;

.field private e:I

.field private f:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Le22/c55/s88/g/s;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0, p1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/g/z;->a:Landroid/widget/ProgressBar;

    const/4 v0, 0x0

    iput-boolean v0, p0, Le22/c55/s88/g/z;->c:Z

    iput-object v1, p0, Le22/c55/s88/g/z;->f:Landroid/widget/TextView;

    iput-object p1, p0, Le22/c55/s88/g/z;->b:Landroid/content/Context;

    iput-object p2, p0, Le22/c55/s88/g/z;->d:Le22/c55/s88/g/s;

    invoke-virtual {p0}, Le22/c55/s88/g/z;->e()V

    return-void
.end method

.method static synthetic a(Le22/c55/s88/g/z;I)I
    .locals 0

    iput p1, p0, Le22/c55/s88/g/z;->e:I

    return p1
.end method

.method static synthetic a(Le22/c55/s88/g/z;)Z
    .locals 1

    iget-boolean v0, p0, Le22/c55/s88/g/z;->c:Z

    return v0
.end method

.method static synthetic b(Le22/c55/s88/g/z;)I
    .locals 1

    iget v0, p0, Le22/c55/s88/g/z;->e:I

    return v0
.end method

.method static synthetic c(Le22/c55/s88/g/z;)Landroid/widget/TextView;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/z;->f:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic d(Le22/c55/s88/g/z;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/z;->b:Landroid/content/Context;

    return-object v0
.end method

.method private f()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/z;->b:Landroid/content/Context;

    invoke-static {v0}, Le22/c55/s88/f/a;->v(Landroid/content/Context;)I

    move-result v0

    iget-object v1, p0, Le22/c55/s88/g/z;->b:Landroid/content/Context;

    invoke-static {v1}, Le22/c55/s88/f/a;->o(Landroid/content/Context;)I

    move-result v1

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/z;->f:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 9

    const/4 v8, 0x0

    const/16 v7, 0x11

    const/16 v6, 0x8

    const/4 v5, 0x1

    const/4 v4, -0x1

    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Le22/c55/s88/g/z;->b:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/g/z;->b:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {v0, v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v1, Landroid/widget/ProgressBar;

    iget-object v2, p0, Le22/c55/s88/g/z;->b:Landroid/content/Context;

    const v3, 0x1010078

    invoke-direct {v1, v2, v8, v3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v1, p0, Le22/c55/s88/g/z;->a:Landroid/widget/ProgressBar;

    iget-object v1, p0, Le22/c55/s88/g/z;->a:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v5}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    iget-object v1, p0, Le22/c55/s88/g/z;->a:Landroid/widget/ProgressBar;

    iget-object v2, p0, Le22/c55/s88/g/z;->b:Landroid/content/Context;

    invoke-static {v2, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v0, v1, v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    iget-object v1, p0, Le22/c55/s88/g/z;->a:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v6}, Landroid/widget/ProgressBar;->setVisibility(I)V

    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Le22/c55/s88/g/z;->b:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/g/z;->f:Landroid/widget/TextView;

    iget-object v1, p0, Le22/c55/s88/g/z;->f:Landroid/widget/TextView;

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v1, p0, Le22/c55/s88/g/z;->f:Landroid/widget/TextView;

    const/high16 v2, 0x41c80000    # 25.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Le22/c55/s88/g/z;->f:Landroid/widget/TextView;

    sget-object v2, Le22/c55/s88/f/e;->O:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le22/c55/s88/g/z;->f:Landroid/widget/TextView;

    new-instance v2, Le22/c55/s88/g/aa;

    invoke-direct {v2, p0}, Le22/c55/s88/g/aa;-><init>(Le22/c55/s88/g/z;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Le22/c55/s88/g/z;->f:Landroid/widget/TextView;

    invoke-virtual {v0, v1, v4, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    invoke-direct {p0}, Le22/c55/s88/g/z;->f()V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v8, v1}, Le22/c55/s88/g/z;->addFooterView(Landroid/view/View;Ljava/lang/Object;Z)V

    return-void
.end method

.method public b()V
    .locals 2

    iget-boolean v0, p0, Le22/c55/s88/g/z;->c:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/g/z;->a:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/z;->a:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Le22/c55/s88/g/z;->c:Z

    iget-object v0, p0, Le22/c55/s88/g/z;->b:Landroid/content/Context;

    invoke-static {v0}, Le22/c55/s88/f/a;->v(Landroid/content/Context;)I

    move-result v0

    iget-object v1, p0, Le22/c55/s88/g/z;->d:Le22/c55/s88/g/s;

    invoke-virtual {v1, v0}, Le22/c55/s88/g/s;->a(I)V

    :cond_1
    return-void
.end method

.method public c()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/z;->f:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/z;->f:Landroid/widget/TextView;

    sget-object v1, Le22/c55/s88/f/e;->O:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    iget-object v0, p0, Le22/c55/s88/g/z;->a:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/g/z;->a:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Le22/c55/s88/g/z;->c:Z

    invoke-direct {p0}, Le22/c55/s88/g/z;->f()V

    return-void
.end method

.method public d()V
    .locals 1

    invoke-virtual {p0}, Le22/c55/s88/g/z;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/HeaderViewListAdapter;

    invoke-virtual {v0}, Landroid/widget/HeaderViewListAdapter;->getWrappedAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Le22/c55/s88/a/d;

    invoke-virtual {v0}, Le22/c55/s88/a/d;->notifyDataSetChanged()V

    invoke-direct {p0}, Le22/c55/s88/g/z;->f()V

    return-void
.end method

.method public e()V
    .locals 1

    new-instance v0, Le22/c55/s88/g/ab;

    invoke-direct {v0, p0}, Le22/c55/s88/g/ab;-><init>(Le22/c55/s88/g/z;)V

    invoke-virtual {p0, v0}, Le22/c55/s88/g/z;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    return-void
.end method

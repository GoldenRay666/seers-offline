.class public Le22/c55/s88/g/p;
.super Landroid/widget/ListView;


# instance fields
.field private a:I

.field private b:Z

.field private c:Landroid/widget/TextView;

.field private d:Landroid/widget/ProgressBar;

.field private e:Landroid/content/Context;

.field private f:Le22/c55/s88/ui/n;


# direct methods
.method public constructor <init>(Landroid/content/Context;Le22/c55/s88/ui/n;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/p;->c:Landroid/widget/TextView;

    iput-object v0, p0, Le22/c55/s88/g/p;->d:Landroid/widget/ProgressBar;

    iput-object p1, p0, Le22/c55/s88/g/p;->e:Landroid/content/Context;

    iput-object p2, p0, Le22/c55/s88/g/p;->f:Le22/c55/s88/ui/n;

    invoke-virtual {p0}, Le22/c55/s88/g/p;->a()V

    invoke-virtual {p0}, Le22/c55/s88/g/p;->d()V

    return-void
.end method

.method static synthetic a(Le22/c55/s88/g/p;I)I
    .locals 0

    iput p1, p0, Le22/c55/s88/g/p;->a:I

    return p1
.end method

.method static synthetic a(Le22/c55/s88/g/p;)Z
    .locals 1

    iget-boolean v0, p0, Le22/c55/s88/g/p;->b:Z

    return v0
.end method

.method static synthetic b(Le22/c55/s88/g/p;)I
    .locals 1

    iget v0, p0, Le22/c55/s88/g/p;->a:I

    return v0
.end method

.method static synthetic c(Le22/c55/s88/g/p;)Landroid/widget/TextView;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/p;->c:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic d(Le22/c55/s88/g/p;)Le22/c55/s88/ui/n;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/p;->f:Le22/c55/s88/ui/n;

    return-object v0
.end method

.method private e()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/p;->f:Le22/c55/s88/ui/n;

    invoke-virtual {v0}, Le22/c55/s88/ui/n;->d()I

    move-result v0

    const/16 v1, 0x1f4

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/p;->c:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 8

    const/4 v7, 0x0

    const/16 v6, 0x11

    const/4 v5, 0x1

    const/4 v4, -0x1

    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Le22/c55/s88/g/p;->e:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v1, Landroid/widget/ProgressBar;

    iget-object v2, p0, Le22/c55/s88/g/p;->e:Landroid/content/Context;

    const v3, 0x1010078

    invoke-direct {v1, v2, v7, v3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v1, p0, Le22/c55/s88/g/p;->d:Landroid/widget/ProgressBar;

    iget-object v1, p0, Le22/c55/s88/g/p;->d:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v5}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    iget-object v1, p0, Le22/c55/s88/g/p;->d:Landroid/widget/ProgressBar;

    iget-object v2, p0, Le22/c55/s88/g/p;->e:Landroid/content/Context;

    const/16 v3, 0xa

    invoke-static {v2, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v0, v1, v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    iget-object v1, p0, Le22/c55/s88/g/p;->d:Landroid/widget/ProgressBar;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Le22/c55/s88/g/p;->e:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/g/p;->c:Landroid/widget/TextView;

    iget-object v1, p0, Le22/c55/s88/g/p;->c:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v1, p0, Le22/c55/s88/g/p;->c:Landroid/widget/TextView;

    const/high16 v2, 0x41c80000    # 25.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Le22/c55/s88/g/p;->c:Landroid/widget/TextView;

    sget-object v2, Le22/c55/s88/f/e;->cn:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le22/c55/s88/g/p;->c:Landroid/widget/TextView;

    new-instance v2, Le22/c55/s88/g/q;

    invoke-direct {v2, p0}, Le22/c55/s88/g/q;-><init>(Le22/c55/s88/g/p;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Le22/c55/s88/g/p;->c:Landroid/widget/TextView;

    invoke-virtual {v0, v1, v4, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    invoke-direct {p0}, Le22/c55/s88/g/p;->e()V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v7, v1}, Le22/c55/s88/g/p;->addFooterView(Landroid/view/View;Ljava/lang/Object;Z)V

    return-void
.end method

.method public b()V
    .locals 2

    iget-boolean v0, p0, Le22/c55/s88/g/p;->b:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/g/p;->d:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/p;->d:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Le22/c55/s88/g/p;->b:Z

    iget-object v0, p0, Le22/c55/s88/g/p;->f:Le22/c55/s88/ui/n;

    invoke-virtual {v0}, Le22/c55/s88/ui/n;->b()V

    :cond_1
    return-void
.end method

.method public c()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/p;->c:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/p;->c:Landroid/widget/TextView;

    sget-object v1, Le22/c55/s88/f/e;->cp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    iget-object v0, p0, Le22/c55/s88/g/p;->d:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/g/p;->d:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Le22/c55/s88/g/p;->b:Z

    invoke-direct {p0}, Le22/c55/s88/g/p;->e()V

    return-void
.end method

.method public d()V
    .locals 1

    new-instance v0, Le22/c55/s88/g/r;

    invoke-direct {v0, p0}, Le22/c55/s88/g/r;-><init>(Le22/c55/s88/g/p;)V

    invoke-virtual {p0, v0}, Le22/c55/s88/g/p;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    return-void
.end method

.class public Lcom/taomee/seer2/n/ax;
.super Landroid/widget/LinearLayout;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/n/au;

.field private b:Landroid/widget/ImageView;

.field private c:Landroid/widget/TextView;

.field private d:Landroid/widget/TextView;

.field private e:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Lcom/taomee/seer2/n/au;Landroid/content/Context;)V
    .locals 10

    const/high16 v9, 0x41400000    # 12.0f

    const v8, -0x464343

    const/4 v7, -0x1

    const/4 v6, 0x1

    const/4 v5, -0x2

    iput-object p1, p0, Lcom/taomee/seer2/n/ax;->a:Lcom/taomee/seer2/n/au;

    invoke-direct {p0, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v6}, Lcom/taomee/seer2/n/ax;->setOrientation(I)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v1}, Lcom/taomee/seer2/n/ax;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/taomee/seer2/n/ax;->e:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/taomee/seer2/n/ax;->e:Landroid/widget/ImageView;

    invoke-virtual {v1, v8}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v2, p0, Lcom/taomee/seer2/n/ax;->e:Landroid/widget/ImageView;

    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    const/4 v3, 0x7

    invoke-static {p2, v3}, Lcom/taomee/seer2/n/ba;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v3, 0x5

    invoke-static {p2, v3}, Lcom/taomee/seer2/n/ba;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/taomee/seer2/n/ax;->b:Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/taomee/seer2/n/ax;->b:Landroid/widget/ImageView;

    invoke-virtual {v1, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v4, 0x2

    invoke-static {p2, v4}, Lcom/taomee/seer2/n/ba;->a(Landroid/content/Context;I)I

    move-result v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/taomee/seer2/n/ax;->c:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/taomee/seer2/n/ax;->c:Landroid/widget/TextView;

    const/16 v3, 0x11

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v1, p0, Lcom/taomee/seer2/n/ax;->c:Landroid/widget/TextView;

    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Lcom/taomee/seer2/n/ax;->c:Landroid/widget/TextView;

    const/high16 v3, -0x1000000

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, p0, Lcom/taomee/seer2/n/ax;->c:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v1, p0, Lcom/taomee/seer2/n/ax;->c:Landroid/widget/TextView;

    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v3, p0, Lcom/taomee/seer2/n/ax;->c:Landroid/widget/TextView;

    invoke-virtual {v2, v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/taomee/seer2/n/ax;->d:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/taomee/seer2/n/ax;->d:Landroid/widget/TextView;

    const/16 v4, 0x11

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v3, p0, Lcom/taomee/seer2/n/ax;->d:Landroid/widget/TextView;

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v3, p0, Lcom/taomee/seer2/n/ax;->d:Landroid/widget/TextView;

    const/high16 v4, -0x1000000

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v3, p0, Lcom/taomee/seer2/n/ax;->d:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v3, p0, Lcom/taomee/seer2/n/ax;->d:Landroid/widget/TextView;

    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v3, p0, Lcom/taomee/seer2/n/ax;->d:Landroid/widget/TextView;

    invoke-virtual {v2, v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v8}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1, v2}, Lcom/taomee/seer2/n/ax;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/taomee/seer2/n/ax;->e:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/taomee/seer2/n/ax;->e:Landroid/widget/ImageView;

    invoke-virtual {v1, v8}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v2, p0, Lcom/taomee/seer2/n/ax;->e:Landroid/widget/ImageView;

    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static synthetic a(Lcom/taomee/seer2/n/ax;)Landroid/widget/ImageView;
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/n/ax;->b:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic b(Lcom/taomee/seer2/n/ax;)Landroid/widget/TextView;
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/n/ax;->c:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic c(Lcom/taomee/seer2/n/ax;)Landroid/widget/TextView;
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/n/ax;->d:Landroid/widget/TextView;

    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 0

    return-void
.end method

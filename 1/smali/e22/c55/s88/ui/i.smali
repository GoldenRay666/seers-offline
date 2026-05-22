.class public Le22/c55/s88/ui/i;
.super Le22/c55/s88/g/l;

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Le22/c55/s88/g/o;


# instance fields
.field private A:Le22/c55/s88/ui/ImageGallery;

.field private B:Landroid/content/Context;

.field private C:Z

.field private D:Le22/c55/s88/a/a;

.field private E:Landroid/widget/ImageView;

.field private F:Le22/c55/s88/ui/h;

.field private G:Landroid/widget/TextView;

.field private H:Landroid/widget/ImageView;

.field private I:Landroid/widget/AdapterView$OnItemClickListener;

.field private a:Landroid/widget/LinearLayout;

.field private b:Landroid/widget/FrameLayout;

.field private c:Landroid/widget/TextView;

.field private d:Landroid/view/View$OnClickListener;

.field private e:Landroid/widget/LinearLayout;

.field private f:Landroid/widget/ImageView;

.field private g:Landroid/widget/TextView;

.field private h:Landroid/widget/TextView;

.field private i:Landroid/widget/TextView;

.field private j:Landroid/widget/TextView;

.field private k:Landroid/widget/TextView;

.field private l:Landroid/widget/TextView;

.field private m:Landroid/widget/LinearLayout;

.field private n:Landroid/widget/TextView;

.field private o:Landroid/widget/ScrollView;

.field private p:Landroid/widget/LinearLayout;

.field private q:Landroid/widget/TextView;

.field private r:Landroid/widget/ImageView;

.field private s:Landroid/widget/LinearLayout;

.field private t:Le22/c55/s88/g/m;

.field private u:Landroid/widget/LinearLayout;

.field private v:Landroid/widget/LinearLayout;

.field private w:Landroid/widget/TextView;

.field private x:Landroid/widget/TextView;

.field private y:Landroid/widget/LinearLayout;

.field private z:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 11

    const/4 v10, 0x5

    const/4 v9, 0x1

    const/4 v8, -0x1

    const/4 v7, 0x0

    const/4 v6, -0x2

    invoke-direct {p0, p1}, Le22/c55/s88/g/l;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput-object v0, p0, Le22/c55/s88/ui/i;->I:Landroid/widget/AdapterView$OnItemClickListener;

    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    const-string v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iput-boolean v7, p0, Le22/c55/s88/ui/i;->C:Z

    iput-object p1, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->a:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le22/c55/s88/ui/i;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->a:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v1, v0}, Le22/c55/s88/ui/i;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->b:Landroid/widget/FrameLayout;

    iget-object v0, p0, Le22/c55/s88/ui/i;->b:Landroid/widget/FrameLayout;

    const v1, -0xff5f17

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->a:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/ui/i;->b:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->c:Landroid/widget/TextView;

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x11

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v1, p0, Le22/c55/s88/ui/i;->c:Landroid/widget/TextView;

    const/16 v2, 0xa

    const/16 v3, 0xa

    invoke-virtual {v1, v7, v2, v7, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->c:Landroid/widget/TextView;

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->c:Landroid/widget/TextView;

    const/high16 v2, 0x41900000    # 18.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v1, Landroid/widget/FrameLayout;

    iget-object v2, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->c:Landroid/widget/TextView;

    invoke-virtual {v1, v2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    const/16 v2, 0x19

    invoke-static {v0, v2}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {v1, v7, v7, v0, v7}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v8, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->b:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->H:Landroid/widget/ImageView;

    iget-object v0, p0, Le22/c55/s88/ui/i;->H:Landroid/widget/ImageView;

    const/16 v1, 0x19

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->H:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x15

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iget-object v1, p0, Le22/c55/s88/ui/i;->b:Landroid/widget/FrameLayout;

    iget-object v2, p0, Le22/c55/s88/ui/i;->H:Landroid/widget/ImageView;

    invoke-virtual {v1, v2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->o:Landroid/widget/ScrollView;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    iget-object v1, p0, Le22/c55/s88/ui/i;->a:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/ui/i;->o:Landroid/widget/ScrollView;

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->p:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le22/c55/s88/ui/i;->p:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->p:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->o:Landroid/widget/ScrollView;

    iget-object v1, p0, Le22/c55/s88/ui/i;->p:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1, v8, v6}, Landroid/widget/ScrollView;->addView(Landroid/view/View;II)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->e:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le22/c55/s88/ui/i;->e:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->e:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iget-object v1, p0, Le22/c55/s88/ui/i;->p:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/ui/i;->e:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->f:Landroid/widget/ImageView;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xa

    invoke-static {p1, v1}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    const/16 v2, 0xa

    invoke-static {p1, v2}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v0, v7, v1, v7, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    const/16 v1, 0x10

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iget-object v1, p0, Le22/c55/s88/ui/i;->f:Landroid/widget/ImageView;

    const/16 v2, 0x10

    invoke-static {p1, v2}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->e:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/ui/i;->f:Landroid/widget/ImageView;

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v4

    const/16 v5, 0xa

    invoke-static {p1, v5}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    iget-object v2, p0, Le22/c55/s88/ui/i;->e:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/ui/i;->g:Landroid/widget/TextView;

    iget-object v1, p0, Le22/c55/s88/ui/i;->g:Landroid/widget/TextView;

    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->g:Landroid/widget/TextView;

    const v2, -0x8a888a

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->g:Landroid/widget/TextView;

    const/high16 v2, 0x41700000    # 15.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->g:Landroid/widget/TextView;

    invoke-virtual {v0, v1, v6, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/ui/i;->i:Landroid/widget/TextView;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v2, 0x2

    invoke-static {p1, v2}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget-object v2, p0, Le22/c55/s88/ui/i;->i:Landroid/widget/TextView;

    invoke-virtual {v2, v9}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->i:Landroid/widget/TextView;

    const v3, -0x8a888a

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->i:Landroid/widget/TextView;

    const/high16 v3, 0x41700000    # 15.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->i:Landroid/widget/TextView;

    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/ui/i;->k:Landroid/widget/TextView;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v2, 0x2

    invoke-static {p1, v2}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget-object v2, p0, Le22/c55/s88/ui/i;->k:Landroid/widget/TextView;

    invoke-virtual {v2, v9}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->k:Landroid/widget/TextView;

    const v3, -0x8a888a

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->k:Landroid/widget/TextView;

    const/high16 v3, 0x41700000    # 15.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->k:Landroid/widget/TextView;

    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v1, v2, v3, v7, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->e:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/ui/i;->h:Landroid/widget/TextView;

    iget-object v1, p0, Le22/c55/s88/ui/i;->h:Landroid/widget/TextView;

    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->h:Landroid/widget/TextView;

    const v2, -0x8a888a

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->h:Landroid/widget/TextView;

    const/high16 v2, 0x41700000    # 15.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->h:Landroid/widget/TextView;

    invoke-virtual {v0, v1, v6, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/ui/i;->j:Landroid/widget/TextView;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v2, 0x2

    invoke-static {p1, v2}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget-object v2, p0, Le22/c55/s88/ui/i;->j:Landroid/widget/TextView;

    invoke-virtual {v2, v9}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->j:Landroid/widget/TextView;

    const v3, -0x8a888a

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->j:Landroid/widget/TextView;

    const/high16 v3, 0x41700000    # 15.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->j:Landroid/widget/TextView;

    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/ui/i;->l:Landroid/widget/TextView;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v2, 0x2

    invoke-static {p1, v2}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget-object v2, p0, Le22/c55/s88/ui/i;->l:Landroid/widget/TextView;

    invoke-virtual {v2, v9}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->l:Landroid/widget/TextView;

    const v3, -0x8a888a

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->l:Landroid/widget/TextView;

    const/high16 v3, 0x41700000    # 15.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->l:Landroid/widget/TextView;

    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->m:Landroid/widget/LinearLayout;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->m:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/ui/i;->n:Landroid/widget/TextView;

    iget-object v1, p0, Le22/c55/s88/ui/i;->n:Landroid/widget/TextView;

    sget-object v2, Le22/c55/s88/f/e;->aj:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->n:Landroid/widget/TextView;

    const/high16 v2, 0x41900000    # 18.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->n:Landroid/widget/TextView;

    const v2, -0x8a888a

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iget-object v2, p0, Le22/c55/s88/ui/i;->m:Landroid/widget/LinearLayout;

    iget-object v3, p0, Le22/c55/s88/ui/i;->n:Landroid/widget/TextView;

    invoke-virtual {v2, v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v6, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    const/4 v3, 0x3

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    const/4 v3, 0x3

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    const/16 v3, 0x10

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const v3, -0x5f5f60

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v3, p0, Le22/c55/s88/ui/i;->m:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->p:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/ui/i;->m:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->q:Landroid/widget/TextView;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v0, v1, v7, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->q:Landroid/widget/TextView;

    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->q:Landroid/widget/TextView;

    const/high16 v2, 0x41700000    # 15.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->q:Landroid/widget/TextView;

    invoke-virtual {v1, v10}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->p:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/ui/i;->q:Landroid/widget/TextView;

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/RelativeLayout;

    invoke-direct {v1, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/ImageView;

    invoke-direct {v2, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Le22/c55/s88/ui/i;->r:Landroid/widget/ImageView;

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0xb

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    iget-object v3, p0, Le22/c55/s88/ui/i;->r:Landroid/widget/ImageView;

    iget-object v4, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    invoke-static {v4, v9}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v3, p0, Le22/c55/s88/ui/i;->r:Landroid/widget/ImageView;

    new-instance v4, Le22/c55/s88/ui/j;

    invoke-direct {v4, p0}, Le22/c55/s88/ui/j;-><init>(Le22/c55/s88/ui/i;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v3, p0, Le22/c55/s88/ui/i;->r:Landroid/widget/ImageView;

    invoke-virtual {v1, v3, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->q:Landroid/widget/TextView;

    new-instance v3, Le22/c55/s88/ui/k;

    invoke-direct {v3, p0}, Le22/c55/s88/ui/k;-><init>(Le22/c55/s88/ui/i;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->p:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->s:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le22/c55/s88/ui/i;->s:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v7, v7, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->p:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/ui/i;->s:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Le22/c55/s88/g/m;

    invoke-direct {v0, p1}, Le22/c55/s88/g/m;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->t:Le22/c55/s88/g/m;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->t:Le22/c55/s88/g/m;

    invoke-virtual {v1, p0}, Le22/c55/s88/g/m;->a(Le22/c55/s88/g/o;)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->s:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/ui/i;->t:Le22/c55/s88/g/m;

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->u:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le22/c55/s88/ui/i;->u:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->p:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0, v8, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v3, -0x1000000

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iput v9, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget-object v4, Le22/c55/s88/f/e;->ak:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setSingleLine(Z)V

    const/high16 v4, 0x41a00000    # 20.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    const/high16 v4, -0x10000

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v1, v3, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    new-array v3, v9, [I

    const v4, 0x10100a7

    aput v4, v3, v7

    const/4 v4, 0x6

    invoke-static {p1, v4}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-array v3, v9, [I

    const v4, 0x101009e

    aput v4, v3, v7

    const/4 v4, 0x7

    invoke-static {p1, v4}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Le22/c55/s88/ui/i;->E:Landroid/widget/ImageView;

    iget-object v3, p0, Le22/c55/s88/ui/i;->E:Landroid/widget/ImageView;

    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->E:Landroid/widget/ImageView;

    const/16 v3, 0x17

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->E:Landroid/widget/ImageView;

    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iput v9, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iput v10, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v3, p0, Le22/c55/s88/ui/i;->E:Landroid/widget/ImageView;

    invoke-virtual {v1, v3, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v3, -0x1000000

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->G:Landroid/widget/TextView;

    iget-object v0, p0, Le22/c55/s88/ui/i;->G:Landroid/widget/TextView;

    sget-object v2, Le22/c55/s88/f/e;->al:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->G:Landroid/widget/TextView;

    const/high16 v2, 0x41c80000    # 25.0f

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x11

    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v2, p0, Le22/c55/s88/ui/i;->G:Landroid/widget/TextView;

    invoke-virtual {v1, v2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Le22/c55/s88/ui/h;

    invoke-direct {v0, p1}, Le22/c55/s88/ui/h;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->F:Le22/c55/s88/ui/h;

    iget-object v0, p0, Le22/c55/s88/ui/i;->F:Le22/c55/s88/ui/h;

    const v2, -0xffff01

    invoke-virtual {v0, v2}, Le22/c55/s88/ui/h;->setBackgroundColor(I)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->F:Le22/c55/s88/ui/h;

    invoke-virtual {v0, p0}, Le22/c55/s88/ui/h;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->F:Le22/c55/s88/ui/h;

    invoke-virtual {v1, v0, v8, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v2, -0x1000000

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v4, p0, Le22/c55/s88/ui/i;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/RelativeLayout;

    invoke-direct {v1, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    const v2, -0x777778

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->v:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le22/c55/s88/ui/i;->v:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->v:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v8, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->v:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v8, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    new-instance v1, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    new-array v2, v9, [I

    const v3, 0x10100a7

    aput v3, v2, v7

    iget-object v3, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    const/16 v4, 0x1d

    invoke-static {v3, v4}, Le22/c55/s88/f/b;->d(Landroid/content/Context;I)Landroid/graphics/drawable/NinePatchDrawable;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-array v2, v9, [I

    const v3, 0x101009e

    aput v3, v2, v7

    iget-object v3, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    const/16 v4, 0x1c

    invoke-static {v3, v4}, Le22/c55/s88/f/b;->d(Landroid/content/Context;I)Landroid/graphics/drawable/NinePatchDrawable;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v3, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Le22/c55/s88/ui/i;->y:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/ui/i;->y:Landroid/widget/LinearLayout;

    const/16 v3, 0x11

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->y:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->y:Landroid/widget/LinearLayout;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->y:Landroid/widget/LinearLayout;

    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/ui/i;->w:Landroid/widget/TextView;

    iget-object v1, p0, Le22/c55/s88/ui/i;->y:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/ui/i;->w:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->w:Landroid/widget/TextView;

    sget-object v2, Le22/c55/s88/f/e;->am:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->w:Landroid/widget/TextView;

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v1, v7, v2, v7, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->w:Landroid/widget/TextView;

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->w:Landroid/widget/TextView;

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->v:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/ui/i;->y:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v8, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    new-instance v1, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    new-array v2, v9, [I

    const v3, 0x10100a7

    aput v3, v2, v7

    iget-object v3, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    const/16 v4, 0x1d

    invoke-static {v3, v4}, Le22/c55/s88/f/b;->d(Landroid/content/Context;I)Landroid/graphics/drawable/NinePatchDrawable;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-array v2, v9, [I

    const v3, 0x101009e

    aput v3, v2, v7

    iget-object v3, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    const/16 v4, 0x1c

    invoke-static {v3, v4}, Le22/c55/s88/f/b;->d(Landroid/content/Context;I)Landroid/graphics/drawable/NinePatchDrawable;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v3, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Le22/c55/s88/ui/i;->z:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/ui/i;->z:Landroid/widget/LinearLayout;

    const/16 v3, 0x11

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v2, p0, Le22/c55/s88/ui/i;->z:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->z:Landroid/widget/LinearLayout;

    const/16 v2, 0x18

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->z:Landroid/widget/LinearLayout;

    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/ui/i;->x:Landroid/widget/TextView;

    iget-object v1, p0, Le22/c55/s88/ui/i;->z:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/ui/i;->x:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->x:Landroid/widget/TextView;

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setFocusable(Z)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->x:Landroid/widget/TextView;

    sget-object v2, Le22/c55/s88/f/e;->an:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->x:Landroid/widget/TextView;

    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->x:Landroid/widget/TextView;

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->x:Landroid/widget/TextView;

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->x:Landroid/widget/TextView;

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v1, v7, v2, v7, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->v:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/ui/i;->z:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Le22/c55/s88/ui/ImageGallery;

    invoke-direct {v0, p1, v8}, Le22/c55/s88/ui/ImageGallery;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    iget-object v0, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    const/16 v1, 0xa

    invoke-static {p1, v1}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/ImageGallery;->setSpacing(I)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    const v1, 0x3f8ccccd    # 1.1f

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/ImageGallery;->setUnselectedAlpha(F)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    const/high16 v1, -0x30000000

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/ImageGallery;->setBackgroundColor(I)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    const/16 v1, 0xa

    invoke-static {p1, v1}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    const/16 v2, 0x14

    invoke-static {p1, v2}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v0, v7, v1, v7, v2}, Le22/c55/s88/ui/ImageGallery;->setPadding(IIII)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    const/16 v1, 0xb

    invoke-static {p1, v1}, Le22/c55/s88/f/b;->a(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v1

    const/16 v2, 0xc

    invoke-static {p1, v2}, Le22/c55/s88/f/b;->a(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Le22/c55/s88/ui/ImageGallery;->a(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xa

    invoke-virtual {v0, v1, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v1, 0xc

    invoke-virtual {v0, v1, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    invoke-virtual {p0, v1, v0}, Le22/c55/s88/ui/i;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/ImageGallery;->setVisibility(I)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    invoke-virtual {v0, v7}, Le22/c55/s88/ui/ImageGallery;->setFadingEdgeLength(I)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    new-instance v1, Le22/c55/s88/ui/l;

    invoke-direct {v1, p0}, Le22/c55/s88/ui/l;-><init>(Le22/c55/s88/ui/i;)V

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/ImageGallery;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void
.end method

.method private a(F)Ljava/lang/String;
    .locals 3

    const/high16 v1, 0x44800000    # 1024.0f

    const/high16 v2, 0x42c80000    # 100.0f

    cmpl-float v0, p1, v1

    if-lez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    div-float v1, p1, v1

    mul-float/2addr v1, v2

    float-to-int v1, v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "M"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    float-to-double v1, p1

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "K"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method static synthetic a(Le22/c55/s88/ui/i;)Z
    .locals 1

    iget-boolean v0, p0, Le22/c55/s88/ui/i;->C:Z

    return v0
.end method

.method static synthetic a(Le22/c55/s88/ui/i;Z)Z
    .locals 0

    iput-boolean p1, p0, Le22/c55/s88/ui/i;->C:Z

    return p1
.end method

.method static synthetic b(Le22/c55/s88/ui/i;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic c(Le22/c55/s88/ui/i;)Landroid/widget/ImageView;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/i;->r:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic d(Le22/c55/s88/ui/i;)Landroid/widget/TextView;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/i;->q:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic e(Le22/c55/s88/ui/i;)Le22/c55/s88/ui/ImageGallery;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/ui/i;->F:Le22/c55/s88/ui/h;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/h;->setVisibility(I)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->G:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method public a(I)V
    .locals 4

    invoke-virtual {p0}, Le22/c55/s88/ui/i;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0xa

    invoke-static {v0, v1}, Le22/c55/s88/f/b;->a(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v1

    new-instance v2, Landroid/util/DisplayMetrics;

    invoke-direct {v2}, Landroid/util/DisplayMetrics;-><init>()V

    iget-object v0, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    const-string v3, "window"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v0, v2, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v0, v0

    const v2, 0x3f4ccccd    # 0.8f

    div-float/2addr v0, v2

    float-to-int v0, v0

    invoke-virtual {v1, v0}, Landroid/graphics/Bitmap;->setDensity(I)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v2}, Le22/c55/s88/ui/i;->a(Ljava/util/List;)V

    return-void
.end method

.method public a(Landroid/graphics/Bitmap;)V
    .locals 2

    invoke-virtual {p0}, Le22/c55/s88/ui/i;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Le22/c55/s88/f/b;->a(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/ui/i;->f:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public a(Landroid/graphics/Bitmap;I)V
    .locals 3

    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    iget-object v0, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    const-string v2, "window"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v0, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v0, v0

    const v1, 0x3f4ccccd    # 0.8f

    div-float/2addr v0, v1

    float-to-int v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Bitmap;->setDensity(I)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->t:Le22/c55/s88/g/m;

    invoke-virtual {v0, p1, p2}, Le22/c55/s88/g/m;->a(Landroid/graphics/Bitmap;I)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    invoke-virtual {v0, p1, p2}, Le22/c55/s88/ui/ImageGallery;->a(Landroid/graphics/Bitmap;I)V

    return-void
.end method

.method public a(Landroid/view/View$OnClickListener;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/ui/i;->d:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public a(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/ui/i;->I:Landroid/widget/AdapterView$OnItemClickListener;

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/ui/i;->g:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->W:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public a(Ljava/util/List;)V
    .locals 5

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    new-instance v3, Landroid/util/DisplayMetrics;

    invoke-direct {v3}, Landroid/util/DisplayMetrics;-><init>()V

    iget-object v1, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    const-string v4, "window"

    invoke-virtual {v1, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v1, v3, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v1, v1

    const v3, 0x3f4ccccd    # 0.8f

    div-float/2addr v1, v3

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->setDensity(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    invoke-virtual {v0, p1}, Le22/c55/s88/ui/ImageGallery;->a(Ljava/util/List;)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->t:Le22/c55/s88/g/m;

    invoke-virtual {v0, p1}, Le22/c55/s88/g/m;->a(Ljava/util/List;)V

    return-void
.end method

.method public a(Z)V
    .locals 3

    const/16 v2, 0x22

    if-eqz p1, :cond_0

    iget-object v0, p0, Le22/c55/s88/ui/i;->H:Landroid/widget/ImageView;

    iget-object v1, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    invoke-static {v1, v2}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Le22/c55/s88/ui/i;->H:Landroid/widget/ImageView;

    iget-object v1, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    invoke-static {v1, v2}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method public b()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/ui/i;->F:Le22/c55/s88/ui/h;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/h;->setVisibility(I)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->G:Landroid/widget/TextView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method public b(I)V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/ImageGallery;->setVisibility(I)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    invoke-virtual {v0, p1}, Le22/c55/s88/ui/ImageGallery;->setSelection(I)V

    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/ui/i;->h:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->X:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public b(Ljava/util/List;)V
    .locals 3

    const/4 v2, 0x0

    new-instance v0, Le22/c55/s88/a/a;

    iget-object v1, p0, Le22/c55/s88/ui/i;->B:Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Le22/c55/s88/a/a;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v0, p0, Le22/c55/s88/ui/i;->D:Le22/c55/s88/a/a;

    iget-object v0, p0, Le22/c55/s88/ui/i;->F:Le22/c55/s88/ui/h;

    iget-object v1, p0, Le22/c55/s88/ui/i;->D:Le22/c55/s88/a/a;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/h;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->D:Le22/c55/s88/a/a;

    invoke-virtual {v0}, Le22/c55/s88/a/a;->notifyDataSetChanged()V

    iget-object v0, p0, Le22/c55/s88/ui/i;->F:Le22/c55/s88/ui/h;

    invoke-virtual {v0, v2}, Le22/c55/s88/ui/h;->setFocusable(Z)V

    iget-object v0, p0, Le22/c55/s88/ui/i;->F:Le22/c55/s88/ui/h;

    invoke-virtual {v0, v2}, Le22/c55/s88/ui/h;->setVisibility(I)V

    return-void
.end method

.method public c()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/ui/i;->w:Landroid/widget/TextView;

    sget-object v1, Le22/c55/s88/f/e;->ac:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public c(I)V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/ui/i;->j:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->Z:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    int-to-float v2, p1

    invoke-direct {p0, v2}, Le22/c55/s88/ui/i;->a(F)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/ui/i;->i:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->Y:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/ui/i;->k:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->aa:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public d()Z
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    invoke-virtual {v1}, Le22/c55/s88/ui/ImageGallery;->getVisibility()I

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Le22/c55/s88/ui/i;->A:Le22/c55/s88/ui/ImageGallery;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Le22/c55/s88/ui/ImageGallery;->setVisibility(I)V

    iget-object v1, p0, Le22/c55/s88/ui/i;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public e(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/ui/i;->l:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->ab:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/i;->q:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public g(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/i;->c:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public h(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/i;->w:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/i;->d:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/ui/i;->d:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6

    iget-object v0, p0, Le22/c55/s88/ui/i;->I:Landroid/widget/AdapterView$OnItemClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/ui/i;->I:Landroid/widget/AdapterView$OnItemClickListener;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    :cond_0
    return-void
.end method

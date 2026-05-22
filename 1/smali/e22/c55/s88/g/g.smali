.class public Le22/c55/s88/g/g;
.super Le22/c55/s88/g/l;

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Le22/c55/s88/g/o;


# static fields
.field public static a:Z


# instance fields
.field private A:Landroid/widget/LinearLayout;

.field private B:F

.field private C:Landroid/webkit/WebView;

.field private D:Landroid/widget/FrameLayout;

.field private E:Landroid/os/Handler;

.field private F:Z

.field private G:Landroid/view/View$OnClickListener;

.field private H:Landroid/widget/AdapterView$OnItemClickListener;

.field private b:Landroid/widget/FrameLayout;

.field private c:Landroid/widget/ImageView;

.field private d:Landroid/widget/LinearLayout;

.field private e:Le22/c55/s88/g/m;

.field private f:Le22/c55/s88/ui/ImageGallery;

.field private g:Landroid/widget/TextView;

.field private h:Landroid/widget/TextView;

.field private i:Landroid/widget/TextView;

.field private j:Landroid/widget/TextView;

.field private k:Landroid/widget/TextView;

.field private l:Landroid/widget/TextView;

.field private m:Landroid/widget/TextView;

.field private n:Landroid/widget/ImageView;

.field private o:Le22/c55/s88/ui/ImageGallery;

.field private p:Landroid/widget/ImageView;

.field private q:Landroid/widget/TextView;

.field private r:Landroid/view/View$OnClickListener;

.field private s:Le22/c55/s88/ui/h;

.field private t:Landroid/widget/FrameLayout;

.field private u:Landroid/widget/TextView;

.field private v:Landroid/widget/ImageView;

.field private w:Landroid/widget/ImageView;

.field private x:Le22/c55/s88/a/g;

.field private y:Landroid/content/Context;

.field private z:Landroid/widget/ImageView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-boolean v0, Le22/c55/s88/g/g;->a:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 11

    invoke-direct {p0, p1}, Le22/c55/s88/g/l;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Le22/c55/s88/g/g;->E:Landroid/os/Handler;

    const/4 v0, 0x1

    iput-boolean v0, p0, Le22/c55/s88/g/g;->F:Z

    new-instance v0, Le22/c55/s88/g/k;

    invoke-direct {v0, p0}, Le22/c55/s88/g/k;-><init>(Le22/c55/s88/g/g;)V

    iput-object v0, p0, Le22/c55/s88/g/g;->G:Landroid/view/View$OnClickListener;

    const/4 v0, 0x0

    iput-object v0, p0, Le22/c55/s88/g/g;->H:Landroid/widget/AdapterView$OnItemClickListener;

    iput-object p1, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/g;->b:Landroid/widget/FrameLayout;

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x1

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/g/g;->c:Landroid/widget/ImageView;

    iget-object v1, p0, Le22/c55/s88/g/g;->c:Landroid/widget/ImageView;

    const/16 v2, 0x23

    invoke-static {p1, v2}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x2

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, 0x3

    invoke-direct {v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const v3, -0xff7231

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Le22/c55/s88/g/g;->d:Landroid/widget/LinearLayout;

    iget-object v3, p0, Le22/c55/s88/g/g;->d:Landroid/widget/LinearLayout;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setId(I)V

    iget-object v3, p0, Le22/c55/s88/g/g;->d:Landroid/widget/LinearLayout;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v3, p0, Le22/c55/s88/g/g;->d:Landroid/widget/LinearLayout;

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x1

    invoke-direct {v3, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iget-object v3, p0, Le22/c55/s88/g/g;->d:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v3}, Le22/c55/s88/g/g;->addView(Landroid/view/View;)V

    iget-object v3, p0, Le22/c55/s88/g/g;->b:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v3, v0}, Le22/c55/s88/g/g;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x2

    invoke-direct {v0, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iget-object v3, p0, Le22/c55/s88/g/g;->b:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Le22/c55/s88/g/g;->b:Landroid/widget/FrameLayout;

    iget-object v2, p0, Le22/c55/s88/g/g;->c:Landroid/widget/ImageView;

    invoke-virtual {v1, v2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v1, p0, Le22/c55/s88/g/g;->d:Landroid/widget/LinearLayout;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-virtual {v1, v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x10

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const v3, -0x464343

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v3, p0, Le22/c55/s88/g/g;->d:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/RelativeLayout;

    invoke-direct {v1, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    const v2, -0x211d1b

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Le22/c55/s88/g/g;->g:Landroid/widget/TextView;

    iget-object v2, p0, Le22/c55/s88/g/g;->g:Landroid/widget/TextView;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v2, p0, Le22/c55/s88/g/g;->g:Landroid/widget/TextView;

    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v2, p0, Le22/c55/s88/g/g;->g:Landroid/widget/TextView;

    const v3, -0xbfbebb

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v2, p0, Le22/c55/s88/g/g;->g:Landroid/widget/TextView;

    const/16 v3, 0xf

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    const/16 v4, 0xa

    invoke-static {p1, v4}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v4

    const/4 v5, 0x5

    invoke-static {p1, v5}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    const/16 v6, 0xa

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0xe

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object v3, p0, Le22/c55/s88/g/g;->g:Landroid/widget/TextView;

    invoke-virtual {v1, v3, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/ImageView;

    iget-object v2, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/g/g;->z:Landroid/widget/ImageView;

    iget-object v1, p0, Le22/c55/s88/g/g;->z:Landroid/widget/ImageView;

    const/16 v2, 0x19

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    iget-object v1, p0, Le22/c55/s88/g/g;->z:Landroid/widget/ImageView;

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v2, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/16 v3, 0x8

    invoke-static {v2, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget-object v2, p0, Le22/c55/s88/g/g;->z:Landroid/widget/ImageView;

    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    iget-object v2, p0, Le22/c55/s88/g/g;->d:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/ImageView;

    invoke-direct {v2, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Le22/c55/s88/g/g;->n:Landroid/widget/ImageView;

    iget-object v2, p0, Le22/c55/s88/g/g;->n:Landroid/widget/ImageView;

    const v3, 0x1080093

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v2, p0, Le22/c55/s88/g/g;->n:Landroid/widget/ImageView;

    const/4 v3, 0x5

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    const/4 v4, 0x5

    invoke-static {p1, v4}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v4

    const/4 v5, 0x5

    invoke-static {p1, v5}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    const/4 v6, 0x5

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/widget/ImageView;->setPadding(IIII)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x10

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iget-object v3, p0, Le22/c55/s88/g/g;->n:Landroid/widget/ImageView;

    invoke-virtual {v0, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v4, 0x10

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/TableLayout;

    invoke-direct {v0, p1}, Landroid/widget/TableLayout;-><init>(Landroid/content/Context;)V

    new-instance v3, Landroid/widget/TableRow;

    invoke-direct {v3, p1}, Landroid/widget/TableRow;-><init>(Landroid/content/Context;)V

    new-instance v4, Landroid/widget/TableRow;

    invoke-direct {v4, p1}, Landroid/widget/TableRow;-><init>(Landroid/content/Context;)V

    new-instance v5, Landroid/widget/TableLayout$LayoutParams;

    const/4 v6, -0x2

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/widget/TableLayout$LayoutParams;-><init>(II)V

    const/16 v6, 0xa

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v6

    iput v6, v5, Landroid/widget/TableLayout$LayoutParams;->topMargin:I

    invoke-virtual {v0, v3}, Landroid/widget/TableLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v4, v5}, Landroid/widget/TableLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/g;->h:Landroid/widget/TextView;

    iget-object v0, p0, Le22/c55/s88/g/g;->h:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    iget-object v0, p0, Le22/c55/s88/g/g;->h:Landroid/widget/TextView;

    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v0, p0, Le22/c55/s88/g/g;->h:Landroid/widget/TextView;

    const v2, -0x8b8888

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Le22/c55/s88/g/g;->h:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v0, p0, Le22/c55/s88/g/g;->h:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v0, Landroid/widget/TableRow$LayoutParams;

    invoke-direct {v0}, Landroid/widget/TableRow$LayoutParams;-><init>()V

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, v0, Landroid/widget/TableRow$LayoutParams;->weight:F

    iget-object v2, p0, Le22/c55/s88/g/g;->h:Landroid/widget/TextView;

    invoke-virtual {v3, v2, v0}, Landroid/widget/TableRow;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const v0, 0x40833333    # 4.1f

    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    invoke-virtual {v2}, Ljava/util/Random;->nextFloat()F

    move-result v2

    add-float/2addr v0, v2

    iput v0, p0, Le22/c55/s88/g/g;->B:F

    iget v0, p0, Le22/c55/s88/g/g;->B:F

    const/high16 v2, 0x40a00000    # 5.0f

    cmpl-float v0, v0, v2

    if-lez v0, :cond_0

    const/high16 v0, 0x40a00000    # 5.0f

    iput v0, p0, Le22/c55/s88/g/g;->B:F

    :cond_0
    iget v0, p0, Le22/c55/s88/g/g;->B:F

    float-to-double v5, v0

    const-wide v7, 0x4011333333333333L    # 4.3

    cmpg-double v0, v5, v7

    if-gez v0, :cond_1

    const/high16 v0, 0x40800000    # 4.0f

    iput v0, p0, Le22/c55/s88/g/g;->B:F

    :cond_1
    new-instance v0, Le22/c55/s88/ui/m;

    iget v2, p0, Le22/c55/s88/g/g;->B:F

    invoke-direct {v0, v2, p1}, Le22/c55/s88/ui/m;-><init>(FLandroid/content/Context;)V

    new-instance v2, Landroid/widget/ImageView;

    invoke-direct {v2, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v0, Landroid/widget/TableRow$LayoutParams;

    invoke-direct {v0}, Landroid/widget/TableRow$LayoutParams;-><init>()V

    const/high16 v5, 0x3f800000    # 1.0f

    iput v5, v0, Landroid/widget/TableRow$LayoutParams;->weight:F

    invoke-virtual {v3, v2, v0}, Landroid/widget/TableRow;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/g;->q:Landroid/widget/TextView;

    iget-object v0, p0, Le22/c55/s88/g/g;->q:Landroid/widget/TextView;

    const/high16 v2, 0x41700000    # 15.0f

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v0, p0, Le22/c55/s88/g/g;->q:Landroid/widget/TextView;

    const v2, -0x8b8888

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Le22/c55/s88/g/g;->q:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v0, p0, Le22/c55/s88/g/g;->q:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v0, Landroid/widget/TableRow$LayoutParams;

    invoke-direct {v0}, Landroid/widget/TableRow$LayoutParams;-><init>()V

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, v0, Landroid/widget/TableRow$LayoutParams;->weight:F

    iget-object v2, p0, Le22/c55/s88/g/g;->q:Landroid/widget/TextView;

    invoke-virtual {v4, v2, v0}, Landroid/widget/TableRow;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const v2, -0x211d1b

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x10

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/16 v3, 0x14

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const/16 v4, 0x24

    invoke-static {p1, v4}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x10

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget-object v4, Le22/c55/s88/f/e;->bf:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v4, -0x1000000

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x10

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const/16 v4, 0x25

    invoke-static {p1, v4}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x10

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/high16 v4, -0x1000000

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    sget-object v4, Le22/c55/s88/f/e;->bh:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x10

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const/16 v4, 0x26

    invoke-static {p1, v4}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x10

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    const/16 v3, 0xa

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget-object v4, Le22/c55/s88/f/e;->bg:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v4, -0x1000000

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const/16 v2, 0x2f

    invoke-static {p1, v2}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v3, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/16 v4, 0xf

    invoke-static {v3, v4}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Le22/c55/s88/ui/ImageGallery;

    invoke-direct {v2, p1}, Le22/c55/s88/ui/ImageGallery;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Le22/c55/s88/g/g;->f:Le22/c55/s88/ui/ImageGallery;

    iget-object v2, p0, Le22/c55/s88/g/g;->f:Le22/c55/s88/ui/ImageGallery;

    const/16 v3, 0xec

    const/16 v4, 0xec

    const/16 v5, 0xec

    invoke-static {v3, v4, v5}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    invoke-virtual {v2, v3}, Le22/c55/s88/ui/ImageGallery;->setBackgroundColor(I)V

    iget-object v2, p0, Le22/c55/s88/g/g;->f:Le22/c55/s88/ui/ImageGallery;

    const/4 v3, 0x0

    const/16 v4, 0x14

    invoke-static {p1, v4}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v4

    const/4 v5, 0x0

    const/16 v6, 0x28

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v2, v3, v4, v5, v6}, Le22/c55/s88/ui/ImageGallery;->setPadding(IIII)V

    iget-object v2, p0, Le22/c55/s88/g/g;->f:Le22/c55/s88/ui/ImageGallery;

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Le22/c55/s88/ui/ImageGallery;->setSpacing(I)V

    iget-object v2, p0, Le22/c55/s88/g/g;->f:Le22/c55/s88/ui/ImageGallery;

    const v3, 0x3f8ccccd    # 1.1f

    invoke-virtual {v2, v3}, Le22/c55/s88/ui/ImageGallery;->setUnselectedAlpha(F)V

    const/16 v2, 0xb

    invoke-static {p1, v2}, Le22/c55/s88/f/b;->a(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v2

    const/16 v3, 0xc

    invoke-static {p1, v3}, Le22/c55/s88/f/b;->a(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v3

    const/16 v4, 0xf0

    invoke-virtual {v2, v4}, Landroid/graphics/Bitmap;->setDensity(I)V

    const/16 v4, 0xf0

    invoke-virtual {v3, v4}, Landroid/graphics/Bitmap;->setDensity(I)V

    iget-object v4, p0, Le22/c55/s88/g/g;->f:Le22/c55/s88/ui/ImageGallery;

    invoke-virtual {v4, v2, v3}, Le22/c55/s88/ui/ImageGallery;->a(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    new-instance v4, Le22/c55/s88/g/m;

    iget-object v5, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    invoke-direct {v4, v5}, Le22/c55/s88/g/m;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Le22/c55/s88/g/g;->e:Le22/c55/s88/g/m;

    iget-object v4, p0, Le22/c55/s88/g/g;->e:Le22/c55/s88/g/m;

    const v5, -0x1a1a1b

    invoke-virtual {v4, v5}, Le22/c55/s88/g/m;->setBackgroundColor(I)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v5, p0, Le22/c55/s88/g/g;->e:Le22/c55/s88/g/m;

    invoke-virtual {v0, v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const/16 v4, 0x30

    invoke-static {p1, v4}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v5, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/16 v6, 0xf

    invoke-static {v5, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v1, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le22/c55/s88/g/g;->e:Le22/c55/s88/g/m;

    invoke-virtual {v0, p0}, Le22/c55/s88/g/m;->a(Le22/c55/s88/g/o;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v6, 0x2

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v6

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v0, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget-object v6, Le22/c55/s88/f/e;->bi:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v6, -0x8b8888

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v6, 0xa

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v5, v6, v7, v8, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    const/4 v8, 0x1

    invoke-direct {v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v7, 0x10

    iput v7, v6, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/16 v7, 0x8

    invoke-static {p1, v7}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v7

    iput v7, v6, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v7, v6, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    const v7, -0x464343

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Le22/c55/s88/g/g;->m:Landroid/widget/TextView;

    iget-object v4, p0, Le22/c55/s88/g/g;->m:Landroid/widget/TextView;

    const/4 v5, 0x5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v4, p0, Le22/c55/s88/g/g;->m:Landroid/widget/TextView;

    const/high16 v5, 0x41800000    # 16.0f

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v4, p0, Le22/c55/s88/g/g;->m:Landroid/widget/TextView;

    const/high16 v5, -0x1000000

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v4, p0, Le22/c55/s88/g/g;->m:Landroid/widget/TextView;

    const/16 v5, 0xa

    invoke-static {p1, v5}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x5

    invoke-static {p1, v7}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v7

    const/4 v8, 0x5

    invoke-static {p1, v8}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v4, p0, Le22/c55/s88/g/g;->m:Landroid/widget/TextView;

    const/4 v5, 0x5

    invoke-static {p1, v5}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    int-to-float v5, v5

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual {v4, v5, v6}, Landroid/widget/TextView;->setLineSpacing(FF)V

    iget-object v4, p0, Le22/c55/s88/g/g;->m:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v4, Landroid/widget/ImageView;

    invoke-direct {v4, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Le22/c55/s88/g/g;->p:Landroid/widget/ImageView;

    iget-object v4, p0, Le22/c55/s88/g/g;->p:Landroid/widget/ImageView;

    const/4 v5, 0x1

    invoke-static {p1, v5}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v5, 0xa

    invoke-static {p1, v5}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    const/4 v5, 0x5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iget-object v5, p0, Le22/c55/s88/g/g;->p:Landroid/widget/ImageView;

    invoke-virtual {v0, v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le22/c55/s88/g/g;->p:Landroid/widget/ImageView;

    iget-object v4, p0, Le22/c55/s88/g/g;->G:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Le22/c55/s88/g/g;->m:Landroid/widget/TextView;

    iget-object v4, p0, Le22/c55/s88/g/g;->G:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, 0x1

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v5, 0x10

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/16 v5, 0xa

    invoke-static {p1, v5}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    const v5, -0x464343

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {v1, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/TableLayout;

    invoke-direct {v0, p1}, Landroid/widget/TableLayout;-><init>(Landroid/content/Context;)V

    new-instance v4, Landroid/widget/TableRow;

    invoke-direct {v4, p1}, Landroid/widget/TableRow;-><init>(Landroid/content/Context;)V

    new-instance v5, Landroid/widget/TableLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/widget/TableLayout$LayoutParams;-><init>(II)V

    const/16 v6, 0xa

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v6

    iput v6, v5, Landroid/widget/TableLayout$LayoutParams;->topMargin:I

    new-instance v6, Landroid/widget/TableRow;

    invoke-direct {v6, p1}, Landroid/widget/TableRow;-><init>(Landroid/content/Context;)V

    new-instance v7, Landroid/widget/TableLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v9, -0x2

    invoke-direct {v7, v8, v9}, Landroid/widget/TableLayout$LayoutParams;-><init>(II)V

    const/4 v8, 0x5

    invoke-static {p1, v8}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v8

    iput v8, v7, Landroid/widget/TableLayout$LayoutParams;->topMargin:I

    const/4 v8, 0x5

    invoke-static {p1, v8}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v8

    iput v8, v7, Landroid/widget/TableLayout$LayoutParams;->bottomMargin:I

    new-instance v8, Landroid/widget/TableRow$LayoutParams;

    const/4 v9, -0x2

    const/4 v10, -0x2

    invoke-direct {v8, v9, v10}, Landroid/widget/TableRow$LayoutParams;-><init>(II)V

    const/high16 v9, 0x3f800000    # 1.0f

    iput v9, v8, Landroid/widget/TableRow$LayoutParams;->weight:F

    const/16 v9, 0xf

    invoke-static {p1, v9}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v9

    iput v9, v8, Landroid/widget/TableRow$LayoutParams;->leftMargin:I

    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Le22/c55/s88/g/g;->i:Landroid/widget/TextView;

    iget-object v9, p0, Le22/c55/s88/g/g;->i:Landroid/widget/TextView;

    invoke-virtual {v9}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v9, p0, Le22/c55/s88/g/g;->i:Landroid/widget/TextView;

    const/high16 v10, 0x41400000    # 12.0f

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v9, p0, Le22/c55/s88/g/g;->i:Landroid/widget/TextView;

    const v10, -0x777778

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v9, p0, Le22/c55/s88/g/g;->i:Landroid/widget/TextView;

    invoke-virtual {v9}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v9, p0, Le22/c55/s88/g/g;->i:Landroid/widget/TextView;

    sget-object v10, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Le22/c55/s88/g/g;->j:Landroid/widget/TextView;

    iget-object v9, p0, Le22/c55/s88/g/g;->j:Landroid/widget/TextView;

    invoke-virtual {v9}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v9, p0, Le22/c55/s88/g/g;->j:Landroid/widget/TextView;

    const/high16 v10, 0x41400000    # 12.0f

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v9, p0, Le22/c55/s88/g/g;->j:Landroid/widget/TextView;

    const v10, -0x777778

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v9, p0, Le22/c55/s88/g/g;->j:Landroid/widget/TextView;

    invoke-virtual {v9}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v9, p0, Le22/c55/s88/g/g;->j:Landroid/widget/TextView;

    sget-object v10, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v9, p0, Le22/c55/s88/g/g;->i:Landroid/widget/TextView;

    invoke-virtual {v4, v9, v8}, Landroid/widget/TableRow;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v9, p0, Le22/c55/s88/g/g;->j:Landroid/widget/TextView;

    invoke-virtual {v4, v9, v8}, Landroid/widget/TableRow;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Le22/c55/s88/g/g;->l:Landroid/widget/TextView;

    iget-object v9, p0, Le22/c55/s88/g/g;->l:Landroid/widget/TextView;

    invoke-virtual {v9}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v9, p0, Le22/c55/s88/g/g;->l:Landroid/widget/TextView;

    const/high16 v10, 0x41400000    # 12.0f

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v9, p0, Le22/c55/s88/g/g;->l:Landroid/widget/TextView;

    const v10, -0x777778

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v9, p0, Le22/c55/s88/g/g;->l:Landroid/widget/TextView;

    sget-object v10, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Le22/c55/s88/g/g;->k:Landroid/widget/TextView;

    iget-object v9, p0, Le22/c55/s88/g/g;->k:Landroid/widget/TextView;

    invoke-virtual {v9}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v9, p0, Le22/c55/s88/g/g;->k:Landroid/widget/TextView;

    const/high16 v10, 0x41400000    # 12.0f

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v9, p0, Le22/c55/s88/g/g;->k:Landroid/widget/TextView;

    const v10, -0x777778

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v9, p0, Le22/c55/s88/g/g;->k:Landroid/widget/TextView;

    invoke-virtual {v9}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v9, p0, Le22/c55/s88/g/g;->k:Landroid/widget/TextView;

    sget-object v10, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v9, p0, Le22/c55/s88/g/g;->l:Landroid/widget/TextView;

    invoke-virtual {v6, v9, v8}, Landroid/widget/TableRow;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v9, p0, Le22/c55/s88/g/g;->k:Landroid/widget/TextView;

    invoke-virtual {v6, v9, v8}, Landroid/widget/TableRow;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0, v4, v5}, Landroid/widget/TableLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0, v6, v7}, Landroid/widget/TableLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-virtual {v1, v0, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    new-instance v0, Landroid/webkit/WebView;

    invoke-direct {v0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/g;->C:Landroid/webkit/WebView;

    iget-object v0, p0, Le22/c55/s88/g/g;->C:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    iget-object v0, p0, Le22/c55/s88/g/g;->C:Landroid/webkit/WebView;

    new-instance v4, Le22/c55/s88/g/h;

    invoke-direct {v4, p0}, Le22/c55/s88/g/h;-><init>(Le22/c55/s88/g/g;)V

    invoke-virtual {v0, v4}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v0, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v4, p0, Le22/c55/s88/g/g;->C:Landroid/webkit/WebView;

    invoke-virtual {v1, v4, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, 0x1

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v5, 0x10

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const v5, -0x464343

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {v1, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v5, 0x2

    invoke-static {p1, v5}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v0, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget-object v5, Le22/c55/s88/f/e;->L:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v5, -0x1000000

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v5, 0x41800000    # 16.0f

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v6, -0x2

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v6, 0x13

    iput v6, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {v1, v4, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Landroid/widget/ImageView;

    invoke-direct {v4, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    new-instance v5, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    const/4 v6, 0x1

    new-array v6, v6, [I

    const/4 v7, 0x0

    const v8, 0x10100a7

    aput v8, v6, v7

    const/4 v7, 0x7

    invoke-static {p1, v7}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    const/4 v6, 0x1

    new-array v6, v6, [I

    const/4 v7, 0x0

    const v8, 0x101009e

    aput v8, v6, v7

    const/4 v7, 0x6

    invoke-static {p1, v7}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v6, -0x2

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v6, 0x15

    iput v6, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const/16 v6, 0x8

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v6

    iput v6, v5, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    const/16 v6, 0x17

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v4, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1, v4, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, 0x1

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v5, 0x10

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const v5, -0x464343

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {v0, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/g/g;->D:Landroid/widget/FrameLayout;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v1, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v4, p0, Le22/c55/s88/g/g;->D:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Le22/c55/s88/ui/h;

    invoke-direct {v0, p1}, Le22/c55/s88/ui/h;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/g;->s:Le22/c55/s88/ui/h;

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v4, -0x1

    const/4 v5, 0x1

    invoke-direct {v0, v1, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    const/16 v1, 0x10

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v1, p0, Le22/c55/s88/g/g;->s:Le22/c55/s88/ui/h;

    invoke-virtual {v1, p0}, Le22/c55/s88/ui/h;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v1, p0, Le22/c55/s88/g/g;->s:Le22/c55/s88/ui/h;

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Le22/c55/s88/ui/h;->setVisibility(I)V

    iget-object v1, p0, Le22/c55/s88/g/g;->s:Le22/c55/s88/ui/h;

    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Le22/c55/s88/ui/h;->setFocusable(Z)V

    iget-object v1, p0, Le22/c55/s88/g/g;->s:Le22/c55/s88/ui/h;

    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Le22/c55/s88/ui/h;->setFocusableInTouchMode(Z)V

    iget-object v1, p0, Le22/c55/s88/g/g;->D:Landroid/widget/FrameLayout;

    iget-object v4, p0, Le22/c55/s88/g/g;->s:Le22/c55/s88/ui/h;

    invoke-virtual {v1, v4, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/g;->t:Landroid/widget/FrameLayout;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v4, -0x2

    invoke-direct {v0, v1, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Le22/c55/s88/g/g;->D:Landroid/widget/FrameLayout;

    iget-object v4, p0, Le22/c55/s88/g/g;->t:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v4, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/ProgressBar;

    invoke-direct {v0, p1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x2

    const/4 v5, -0x2

    invoke-direct {v1, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v4, 0x11

    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v4, p0, Le22/c55/s88/g/g;->t:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le22/c55/s88/g/g;->t:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v4, 0x10

    iput v4, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const v4, -0x464343

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v4, p0, Le22/c55/s88/g/g;->d:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const v1, 0xe3e4e6

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v1, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v4, 0x50

    iput v4, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iget-object v4, p0, Le22/c55/s88/g/g;->d:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v6, 0x11

    iput v6, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {v0, v1, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v1, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v6, 0x0

    const v7, 0x10100a7

    aput v7, v5, v6

    const/16 v6, 0x29

    invoke-static {p1, v6}, Le22/c55/s88/f/b;->d(Landroid/content/Context;I)Landroid/graphics/drawable/NinePatchDrawable;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    const/4 v5, 0x1

    new-array v5, v5, [I

    const/4 v6, 0x0

    const v7, 0x101009e

    aput v7, v5, v6

    const/16 v6, 0x28

    invoke-static {p1, v6}, Le22/c55/s88/f/b;->d(Landroid/content/Context;I)Landroid/graphics/drawable/NinePatchDrawable;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    const/4 v6, -0x1

    invoke-direct {v1, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p1}, Le22/c55/s88/e/g;->d(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/4 v6, 0x5

    invoke-static {v5, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    iget-object v6, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/4 v7, 0x5

    invoke-static {v6, v7}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v6

    iget-object v7, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/4 v8, 0x5

    invoke-static {v7, v8}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v7

    iget-object v8, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/4 v9, 0x5

    invoke-static {v8, v9}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v1, v5, v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    :goto_0
    const/high16 v5, 0x3f800000    # 1.0f

    iput v5, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    const/16 v5, 0x11

    iput v5, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-virtual {v4, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/g/g;->v:Landroid/widget/ImageView;

    iget-object v1, p0, Le22/c55/s88/g/g;->v:Landroid/widget/ImageView;

    const/16 v5, 0x2a

    invoke-static {p1, v5}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    const/4 v6, -0x2

    invoke-direct {v1, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v5, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/4 v6, 0x5

    invoke-static {v5, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    iput v5, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iget-object v5, p0, Le22/c55/s88/g/g;->v:Landroid/widget/ImageView;

    invoke-virtual {v0, v5, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/g/g;->u:Landroid/widget/TextView;

    iget-object v1, p0, Le22/c55/s88/g/g;->u:Landroid/widget/TextView;

    sget-object v5, Le22/c55/s88/f/e;->V:Ljava/lang/String;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le22/c55/s88/g/g;->u:Landroid/widget/TextView;

    const/4 v5, -0x1

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, p0, Le22/c55/s88/g/g;->u:Landroid/widget/TextView;

    const/high16 v5, 0x41a00000    # 20.0f

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Le22/c55/s88/g/g;->u:Landroid/widget/TextView;

    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v1, p0, Le22/c55/s88/g/g;->u:Landroid/widget/TextView;

    const/4 v5, -0x2

    const/4 v6, -0x2

    invoke-virtual {v0, v1, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/g;->A:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le22/c55/s88/g/g;->A:Landroid/widget/LinearLayout;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v5, 0x0

    const v6, 0x10100a7

    aput v6, v1, v5

    const/16 v5, 0x29

    invoke-static {p1, v5}, Le22/c55/s88/f/b;->d(Landroid/content/Context;I)Landroid/graphics/drawable/NinePatchDrawable;

    move-result-object v5

    invoke-virtual {v0, v1, v5}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v5, 0x0

    const v6, 0x101009e

    aput v6, v1, v5

    const/16 v5, 0x28

    invoke-static {p1, v5}, Le22/c55/s88/f/b;->d(Landroid/content/Context;I)Landroid/graphics/drawable/NinePatchDrawable;

    move-result-object v5

    invoke-virtual {v0, v1, v5}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Le22/c55/s88/g/g;->A:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Le22/c55/s88/g/g;->A:Landroid/widget/LinearLayout;

    const/16 v1, 0x18

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    iget-object v0, p0, Le22/c55/s88/g/g;->A:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/4 v5, -0x1

    invoke-direct {v0, v1, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/4 v5, 0x5

    invoke-static {v1, v5}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    iget-object v5, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/4 v6, 0x5

    invoke-static {v5, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    iget-object v6, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/4 v7, 0x5

    invoke-static {v6, v7}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v6

    iget-object v7, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/4 v8, 0x5

    invoke-static {v7, v8}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v0, v1, v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    const/16 v1, 0x11

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iget-object v1, p0, Le22/c55/s88/g/g;->A:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/g;->w:Landroid/widget/ImageView;

    iget-object v0, p0, Le22/c55/s88/g/g;->w:Landroid/widget/ImageView;

    const/16 v1, 0x2b

    invoke-static {p1, v1}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/4 v4, -0x2

    invoke-direct {v0, v1, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/4 v4, 0x5

    invoke-static {v1, v4}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iget-object v1, p0, Le22/c55/s88/g/g;->A:Landroid/widget/LinearLayout;

    iget-object v4, p0, Le22/c55/s88/g/g;->w:Landroid/widget/ImageView;

    invoke-virtual {v1, v4, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget-object v1, Le22/c55/s88/f/e;->as:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v1, 0x41a00000    # 20.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v1, p0, Le22/c55/s88/g/g;->A:Landroid/widget/LinearLayout;

    const/4 v4, -0x2

    const/4 v5, -0x2

    invoke-virtual {v1, v0, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    invoke-virtual {p0, p1}, Le22/c55/s88/g/g;->a(Landroid/content/Context;)V

    new-instance v0, Le22/c55/s88/ui/ImageGallery;

    const/4 v1, -0x1

    invoke-direct {v0, p1, v1}, Le22/c55/s88/ui/ImageGallery;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    iget-object v0, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/ImageGallery;->setSpacing(I)V

    iget-object v0, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    const v1, 0x3f8ccccd    # 1.1f

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/ImageGallery;->setUnselectedAlpha(F)V

    iget-object v0, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    const/high16 v1, -0x30000000

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/ImageGallery;->setBackgroundColor(I)V

    iget-object v0, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    const/4 v1, 0x0

    const/16 v4, 0xa

    invoke-static {p1, v4}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v4

    const/4 v5, 0x0

    const/16 v6, 0x14

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v0, v1, v4, v5, v6}, Le22/c55/s88/ui/ImageGallery;->setPadding(IIII)V

    iget-object v0, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    invoke-virtual {v0, v2, v3}, Le22/c55/s88/ui/ImageGallery;->a(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x1

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xa

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v1, 0xc

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v1, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    invoke-virtual {p0, v1, v0}, Le22/c55/s88/g/g;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/ImageGallery;->setVisibility(I)V

    iget-object v0, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/ImageGallery;->setFadingEdgeLength(I)V

    iget-object v0, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    new-instance v1, Le22/c55/s88/g/i;

    invoke-direct {v1, p0}, Le22/c55/s88/g/i;-><init>(Le22/c55/s88/g/g;)V

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/ImageGallery;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Le22/c55/s88/g/g;->f:Le22/c55/s88/ui/ImageGallery;

    new-instance v1, Le22/c55/s88/g/j;

    invoke-direct {v1, p0}, Le22/c55/s88/g/j;-><init>(Le22/c55/s88/g/g;)V

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/ImageGallery;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void

    :cond_2
    iget-object v5, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/4 v6, 0x5

    invoke-static {v5, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    iget-object v6, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/4 v7, 0x5

    invoke-static {v6, v7}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v6

    iget-object v7, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/4 v8, 0x0

    invoke-static {v7, v8}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v7

    iget-object v8, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    const/4 v9, 0x5

    invoke-static {v8, v9}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v1, v5, v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    goto/16 :goto_0
.end method

.method static synthetic a(Le22/c55/s88/g/g;)Le22/c55/s88/ui/ImageGallery;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    return-object v0
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

.method static synthetic a(Le22/c55/s88/g/g;Z)Z
    .locals 0

    iput-boolean p1, p0, Le22/c55/s88/g/g;->F:Z

    return p1
.end method

.method static synthetic b(Le22/c55/s88/g/g;)Le22/c55/s88/ui/ImageGallery;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/g;->f:Le22/c55/s88/ui/ImageGallery;

    return-object v0
.end method

.method static synthetic c(Le22/c55/s88/g/g;)Z
    .locals 1

    iget-boolean v0, p0, Le22/c55/s88/g/g;->F:Z

    return v0
.end method

.method static synthetic d(Le22/c55/s88/g/g;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic e(Le22/c55/s88/g/g;)Landroid/widget/TextView;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/g;->m:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic f(Le22/c55/s88/g/g;)Landroid/widget/ImageView;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/g;->p:Landroid/widget/ImageView;

    return-object v0
.end method

.method public static i(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    const/4 v0, 0x0

    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_2

    aget-char v2, v1, v0

    const/16 v3, 0x3000

    if-ne v2, v3, :cond_1

    const/16 v2, 0x20

    aput-char v2, v1, v0

    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    aget-char v2, v1, v0

    const v3, 0xff00

    if-le v2, v3, :cond_0

    aget-char v2, v1, v0

    const v3, 0xff5f

    if-ge v2, v3, :cond_0

    aget-char v2, v1, v0

    const v3, 0xfee0

    sub-int/2addr v2, v3

    int-to-char v2, v2

    aput-char v2, v1, v0

    goto :goto_1

    :cond_2
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/g;->s:Le22/c55/s88/ui/h;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/h;->setVisibility(I)V

    iget-object v0, p0, Le22/c55/s88/g/g;->t:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    return-void
.end method

.method public a(I)V
    .locals 4

    invoke-virtual {p0}, Le22/c55/s88/g/g;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0xa

    invoke-static {v0, v1}, Le22/c55/s88/f/b;->a(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v1

    new-instance v2, Landroid/util/DisplayMetrics;

    invoke-direct {v2}, Landroid/util/DisplayMetrics;-><init>()V

    iget-object v0, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

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
    invoke-virtual {p0, v2}, Le22/c55/s88/g/g;->a(Ljava/util/List;)V

    return-void
.end method

.method public a(Landroid/content/Context;)V
    .locals 2

    invoke-static {p1}, Le22/c55/s88/e/g;->d(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/g;->A:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Le22/c55/s88/g/g;->A:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method public a(Landroid/graphics/Bitmap;)V
    .locals 2

    invoke-virtual {p0}, Le22/c55/s88/g/g;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Le22/c55/s88/f/b;->a(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/g;->n:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public a(Landroid/graphics/Bitmap;I)V
    .locals 3

    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    iget-object v0, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

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

    iget-object v0, p0, Le22/c55/s88/g/g;->e:Le22/c55/s88/g/m;

    invoke-virtual {v0, p1, p2}, Le22/c55/s88/g/m;->a(Landroid/graphics/Bitmap;I)V

    iget-object v0, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    invoke-virtual {v0, p1, p2}, Le22/c55/s88/ui/ImageGallery;->a(Landroid/graphics/Bitmap;I)V

    return-void
.end method

.method public a(Landroid/view/View$OnClickListener;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/g;->r:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public a(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/g;->H:Landroid/widget/AdapterView$OnItemClickListener;

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/g/g;->h:Landroid/widget/TextView;

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

    iget-object v1, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

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
    iget-object v0, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    invoke-virtual {v0, p1}, Le22/c55/s88/ui/ImageGallery;->a(Ljava/util/List;)V

    iget-object v0, p0, Le22/c55/s88/g/g;->e:Le22/c55/s88/g/m;

    invoke-virtual {v0, p1}, Le22/c55/s88/g/m;->a(Ljava/util/List;)V

    return-void
.end method

.method public a(Z)V
    .locals 3

    const/16 v2, 0x22

    if-eqz p1, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/g;->z:Landroid/widget/ImageView;

    iget-object v1, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    invoke-static {v1, v2}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Le22/c55/s88/g/g;->z:Landroid/widget/ImageView;

    iget-object v1, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    invoke-static {v1, v2}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method public b()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/g;->s:Le22/c55/s88/ui/h;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/h;->setVisibility(I)V

    iget-object v0, p0, Le22/c55/s88/g/g;->t:Landroid/widget/FrameLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    return-void
.end method

.method public b(I)V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/ImageGallery;->setVisibility(I)V

    iget-object v0, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    invoke-virtual {v0, p1}, Le22/c55/s88/ui/ImageGallery;->setSelection(I)V

    const/4 v0, 0x1

    sput-boolean v0, Le22/c55/s88/g/g;->a:Z

    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public b(Ljava/util/List;)V
    .locals 3

    const/4 v2, 0x0

    new-instance v0, Le22/c55/s88/a/g;

    iget-object v1, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Le22/c55/s88/a/g;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v0, p0, Le22/c55/s88/g/g;->x:Le22/c55/s88/a/g;

    iget-object v0, p0, Le22/c55/s88/g/g;->s:Le22/c55/s88/ui/h;

    iget-object v1, p0, Le22/c55/s88/g/g;->x:Le22/c55/s88/a/g;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/h;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v0, p0, Le22/c55/s88/g/g;->x:Le22/c55/s88/a/g;

    invoke-virtual {v0}, Le22/c55/s88/a/g;->notifyDataSetChanged()V

    iget-object v0, p0, Le22/c55/s88/g/g;->s:Le22/c55/s88/ui/h;

    invoke-virtual {v0, v2}, Le22/c55/s88/ui/h;->setFocusable(Z)V

    iget-object v0, p0, Le22/c55/s88/g/g;->s:Le22/c55/s88/ui/h;

    invoke-virtual {v0, v2}, Le22/c55/s88/ui/h;->setVisibility(I)V

    iget-object v0, p0, Le22/c55/s88/g/g;->s:Le22/c55/s88/ui/h;

    invoke-virtual {v0}, Le22/c55/s88/ui/h;->postInvalidate()V

    iget-object v0, p0, Le22/c55/s88/g/g;->t:Landroid/widget/FrameLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/c/e;

    iget-object v2, p0, Le22/c55/s88/g/g;->y:Landroid/content/Context;

    invoke-static {v2}, Le22/c55/s88/e/b;->a(Landroid/content/Context;)Le22/c55/s88/e/b;

    move-result-object v2

    invoke-virtual {v2}, Le22/c55/s88/e/b;->b()I

    move-result v2

    iput v2, v0, Le22/c55/s88/c/e;->C:I

    goto :goto_0

    :cond_0
    return-void
.end method

.method public c()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/g;->u:Landroid/widget/TextView;

    sget-object v1, Le22/c55/s88/f/e;->ac:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Le22/c55/s88/g/g;->v:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void
.end method

.method public c(I)V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/g/g;->j:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->Z:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    int-to-float v2, p1

    invoke-direct {p0, v2}, Le22/c55/s88/g/g;->a(F)Ljava/lang/String;

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

    iget-object v0, p0, Le22/c55/s88/g/g;->i:Landroid/widget/TextView;

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

.method public d(I)V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/g/g;->q:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->bj:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/g/g;->k:Landroid/widget/TextView;

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

    iget-object v1, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    invoke-virtual {v1}, Le22/c55/s88/ui/ImageGallery;->getVisibility()I

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Le22/c55/s88/g/g;->o:Le22/c55/s88/ui/ImageGallery;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Le22/c55/s88/ui/ImageGallery;->setVisibility(I)V

    iget-object v1, p0, Le22/c55/s88/g/g;->d:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    sput-boolean v0, Le22/c55/s88/g/g;->a:Z

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public e(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/g/g;->l:Landroid/widget/TextView;

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
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/g;->m:Landroid/widget/TextView;

    invoke-static {p1}, Le22/c55/s88/g/g;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public g(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/g;->g:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public h(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/g;->u:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public j(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/g;->C:Landroid/webkit/WebView;

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/g;->r:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/g;->r:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6

    iget-object v0, p0, Le22/c55/s88/g/g;->H:Landroid/widget/AdapterView$OnItemClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/g;->H:Landroid/widget/AdapterView$OnItemClickListener;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    :cond_0
    return-void
.end method

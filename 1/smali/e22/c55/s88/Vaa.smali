.class public Le22/c55/s88/Vaa;
.super Landroid/app/Activity;


# static fields
.field public static final a:Ljava/lang/String;

.field private static f:Landroid/app/Activity;


# instance fields
.field public b:Landroid/widget/AdapterView$OnItemClickListener;

.field protected c:Landroid/view/View;

.field protected d:Le22/c55/s88/g/ac;

.field private e:Le22/c55/s88/e/j;

.field private g:Le22/c55/s88/g/a;

.field private h:Le22/c55/s88/g/s;

.field private i:Le22/c55/s88/g/a;

.field private j:Landroid/content/Context;

.field private k:Z

.field private l:Landroid/os/Handler;

.field private m:Le22/c55/s88/ui/c;

.field private n:Le22/c55/s88/ui/d;

.field private o:Le22/c55/s88/ui/n;

.field private p:Z

.field private q:Landroid/view/View$OnClickListener;

.field private r:Ljava/util/Stack;

.field private s:Landroid/view/animation/TranslateAnimation;

.field private t:Landroid/view/animation/TranslateAnimation;

.field private u:Landroid/view/animation/TranslateAnimation;

.field private v:Landroid/view/animation/TranslateAnimation;

.field private w:Ljava/util/Stack;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Le22/c55/s88/f/e;->cz:Ljava/lang/String;

    sput-object v0, Le22/c55/s88/Vaa;->a:Ljava/lang/String;

    const/4 v0, 0x0

    sput-object v0, Le22/c55/s88/Vaa;->f:Landroid/app/Activity;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Le22/c55/s88/Vaa;->l:Landroid/os/Handler;

    const/4 v0, 0x0

    iput-boolean v0, p0, Le22/c55/s88/Vaa;->p:Z

    new-instance v0, Le22/c55/s88/b;

    invoke-direct {v0, p0}, Le22/c55/s88/b;-><init>(Le22/c55/s88/Vaa;)V

    iput-object v0, p0, Le22/c55/s88/Vaa;->q:Landroid/view/View$OnClickListener;

    new-instance v0, Le22/c55/s88/c;

    invoke-direct {v0, p0}, Le22/c55/s88/c;-><init>(Le22/c55/s88/Vaa;)V

    iput-object v0, p0, Le22/c55/s88/Vaa;->b:Landroid/widget/AdapterView$OnItemClickListener;

    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Le22/c55/s88/Vaa;->r:Ljava/util/Stack;

    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Le22/c55/s88/Vaa;->w:Ljava/util/Stack;

    return-void
.end method

.method static synthetic a(Le22/c55/s88/Vaa;Le22/c55/s88/g/a;)Le22/c55/s88/g/a;
    .locals 0

    iput-object p1, p0, Le22/c55/s88/Vaa;->i:Le22/c55/s88/g/a;

    return-object p1
.end method

.method static synthetic a(Le22/c55/s88/Vaa;)Le22/c55/s88/ui/c;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/Vaa;->m:Le22/c55/s88/ui/c;

    return-object v0
.end method

.method public static a(Landroid/content/Context;Le22/c55/s88/e/j;)V
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p1, Le22/c55/s88/e/j;->q:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p1, Le22/c55/s88/e/j;->q:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Le22/c55/s88/Vaa;->b(Landroid/content/Context;Ljava/lang/String;Le22/c55/s88/e/j;)V

    :goto_0
    return-void

    :cond_1
    new-instance v0, Le22/c55/s88/b/f;

    iget-object v1, p1, Le22/c55/s88/e/j;->q:Ljava/lang/String;

    sget-object v2, Le22/c55/s88/f/e;->w:Ljava/lang/String;

    iget v3, p1, Le22/c55/s88/e/j;->h:I

    invoke-static {p0, v2, v3}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v2

    invoke-direct {v0, v1, v2, v4}, Le22/c55/s88/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Le22/c55/s88/b/f;->a(Ljava/lang/Object;)V

    new-instance v1, Le22/c55/s88/a;

    invoke-direct {v1, p0, p1}, Le22/c55/s88/a;-><init>(Landroid/content/Context;Le22/c55/s88/e/j;)V

    invoke-static {p0, v0, v1}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Le22/c55/s88/b/f;Le22/c55/s88/b/a;)V

    goto :goto_0
.end method

.method static synthetic a(Landroid/content/Context;Ljava/lang/String;Le22/c55/s88/e/j;)V
    .locals 0

    invoke-static {p0, p1, p2}, Le22/c55/s88/Vaa;->b(Landroid/content/Context;Ljava/lang/String;Le22/c55/s88/e/j;)V

    return-void
.end method

.method private a(Le22/c55/s88/e/j;ZZ)V
    .locals 9

    const/16 v8, 0xd

    const/4 v7, 0x2

    const/4 v5, 0x0

    if-nez p2, :cond_0

    iget-byte v0, p1, Le22/c55/s88/e/j;->e:B

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    iget v0, p1, Le22/c55/s88/e/j;->s:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    iget-byte v0, p1, Le22/c55/s88/e/j;->e:B

    if-ne v0, v8, :cond_2

    new-instance v0, Le22/c55/s88/g/s;

    iget-object v1, p0, Le22/c55/s88/Vaa;->b:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-direct {v0, p0, p1, v1}, Le22/c55/s88/g/s;-><init>(Landroid/app/Activity;Le22/c55/s88/e/j;Landroid/widget/AdapterView$OnItemClickListener;)V

    iput-object v0, p0, Le22/c55/s88/Vaa;->h:Le22/c55/s88/g/s;

    iget-object v0, p0, Le22/c55/s88/Vaa;->h:Le22/c55/s88/g/s;

    invoke-virtual {v0}, Le22/c55/s88/g/s;->b()V

    :goto_1
    iget-byte v0, p1, Le22/c55/s88/e/j;->e:B

    if-eq v0, v8, :cond_1

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/Vaa;->j:Landroid/content/Context;

    invoke-static {v1}, Le22/c55/s88/VManager;->getMainChildService(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v1, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Le22/c55/s88/Vaa;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_1
    return-void

    :pswitch_1
    if-nez p3, :cond_0

    iget-boolean v0, p0, Le22/c55/s88/Vaa;->k:Z

    if-nez v0, :cond_0

    invoke-static {p0, p1}, Le22/c55/s88/e/b;->b(Landroid/content/Context;Le22/c55/s88/e/j;)Landroid/content/Intent;

    move-result-object v1

    iget v0, p1, Le22/c55/s88/e/j;->F:I

    invoke-static {v0}, Le22/c55/s88/e/b;->a(I)I

    move-result v2

    sget v4, Le22/c55/s88/f/a;->a:I

    move-object v0, p0

    move-object v3, p1

    move v6, v5

    invoke-static/range {v0 .. v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Landroid/content/Intent;ILe22/c55/s88/e/j;IZZ)V

    goto :goto_0

    :cond_2
    new-instance v0, Le22/c55/s88/ui/d;

    invoke-direct {v0, p0}, Le22/c55/s88/ui/d;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/Vaa;->n:Le22/c55/s88/ui/d;

    new-instance v0, Le22/c55/s88/ui/n;

    iget-object v1, p0, Le22/c55/s88/Vaa;->n:Le22/c55/s88/ui/d;

    iget-object v2, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    iget v2, v2, Le22/c55/s88/e/j;->U:I

    invoke-direct {v0, p0, v1, v2}, Le22/c55/s88/ui/n;-><init>(Le22/c55/s88/Vaa;Le22/c55/s88/ui/d;I)V

    iput-object v0, p0, Le22/c55/s88/Vaa;->o:Le22/c55/s88/ui/n;

    new-instance v0, Le22/c55/s88/g/ac;

    iget-object v1, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    invoke-direct {v0, p0, v1, v5}, Le22/c55/s88/g/ac;-><init>(Landroid/app/Activity;Le22/c55/s88/e/j;I)V

    invoke-virtual {p0, v0}, Le22/c55/s88/Vaa;->a(Le22/c55/s88/g/ac;)V

    goto :goto_1

    :cond_3
    iget-byte v0, p1, Le22/c55/s88/e/j;->e:B

    if-ne v0, v7, :cond_4

    iget-object v0, p1, Le22/c55/s88/e/j;->d:Ljava/lang/String;

    invoke-static {p0, v0}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p1, Le22/c55/s88/e/j;->l:Ljava/lang/Integer;

    invoke-static {p0, p1}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Le22/c55/s88/e/j;)Z

    invoke-virtual {p0}, Le22/c55/s88/Vaa;->a()V

    goto :goto_1

    :cond_4
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p1, Le22/c55/s88/e/j;->l:Ljava/lang/Integer;

    invoke-static {p0, p1}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Le22/c55/s88/e/j;)Z

    iget-object v0, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    invoke-static {p0, v0}, Le22/c55/s88/f/a;->c(Landroid/content/Context;Le22/c55/s88/e/j;)V

    invoke-virtual {p0}, Le22/c55/s88/Vaa;->a()V

    goto :goto_1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static b(Landroid/content/Context;Le22/c55/s88/e/j;)Landroid/content/Intent;
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-static {p0}, Le22/c55/s88/VManager;->getMainChildActivity(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bQ:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bP:Ljava/lang/String;

    iget v2, p1, Le22/c55/s88/e/j;->f:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bO:Ljava/lang/String;

    invoke-virtual {p1}, Le22/c55/s88/e/j;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-object v0
.end method

.method static synthetic b(Le22/c55/s88/Vaa;)Le22/c55/s88/e/j;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    return-object v0
.end method

.method private static b(Landroid/content/Context;Ljava/lang/String;Le22/c55/s88/e/j;)V
    .locals 5

    const/4 v4, 0x0

    new-instance v2, Landroid/content/Intent;

    sget-object v0, Le22/c55/s88/f/e;->cu:Ljava/lang/String;

    invoke-direct {v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v0, p2, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p2, Le22/c55/s88/e/j;->m:Ljava/lang/String;

    :cond_0
    const-string v1, "android.intent.extra.shortcut.NAME"

    invoke-virtual {v2, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "duplicate"

    invoke-virtual {v2, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {p0, p2}, Le22/c55/s88/Vaa;->b(Landroid/content/Context;Le22/c55/s88/e/j;)Landroid/content/Intent;

    move-result-object v1

    const-string v3, "android.intent.extra.shortcut.INTENT"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    invoke-static {p0, p1, v4}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Ljava/lang/String;Z)Landroid/graphics/Bitmap;

    move-result-object v1

    :cond_1
    if-nez v1, :cond_2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x1080093

    invoke-static {v1, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    :cond_2
    const-string v3, "android.intent.extra.shortcut.ICON"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {p0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    invoke-static {p0, v0}, Le22/c55/s88/f/a;->q(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic c(Le22/c55/s88/Vaa;)Le22/c55/s88/g/a;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/Vaa;->i:Le22/c55/s88/g/a;

    return-object v0
.end method

.method static synthetic d(Le22/c55/s88/Vaa;)Ljava/util/Stack;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/Vaa;->r:Ljava/util/Stack;

    return-object v0
.end method

.method private d()V
    .locals 9

    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/high16 v4, -0x40800000    # -1.0f

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Le22/c55/s88/Vaa;->s:Landroid/view/animation/TranslateAnimation;

    iget-object v0, p0, Le22/c55/s88/Vaa;->s:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v1, 0x190

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->s:Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->s:Landroid/view/animation/TranslateAnimation;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Le22/c55/s88/Vaa;->t:Landroid/view/animation/TranslateAnimation;

    iget-object v0, p0, Le22/c55/s88/Vaa;->t:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v1, 0x190

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->t:Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->t:Landroid/view/animation/TranslateAnimation;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Le22/c55/s88/Vaa;->u:Landroid/view/animation/TranslateAnimation;

    iget-object v0, p0, Le22/c55/s88/Vaa;->u:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v1, 0x190

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->u:Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->u:Landroid/view/animation/TranslateAnimation;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    const/high16 v2, -0x40800000    # -1.0f

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Le22/c55/s88/Vaa;->v:Landroid/view/animation/TranslateAnimation;

    iget-object v0, p0, Le22/c55/s88/Vaa;->v:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v1, 0x190

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->v:Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->v:Landroid/view/animation/TranslateAnimation;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    return-void
.end method

.method static synthetic e(Le22/c55/s88/Vaa;)Landroid/view/animation/TranslateAnimation;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/Vaa;->s:Landroid/view/animation/TranslateAnimation;

    return-object v0
.end method

.method static synthetic f(Le22/c55/s88/Vaa;)Landroid/view/animation/TranslateAnimation;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/Vaa;->t:Landroid/view/animation/TranslateAnimation;

    return-object v0
.end method

.method static synthetic g(Le22/c55/s88/Vaa;)Ljava/util/Stack;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/Vaa;->w:Ljava/util/Stack;

    return-object v0
.end method

.method static synthetic h(Le22/c55/s88/Vaa;)Le22/c55/s88/ui/d;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/Vaa;->n:Le22/c55/s88/ui/d;

    return-object v0
.end method

.method static synthetic i(Le22/c55/s88/Vaa;)Le22/c55/s88/ui/n;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/Vaa;->o:Le22/c55/s88/ui/n;

    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/Vaa;->r:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    invoke-super {p0}, Landroid/app/Activity;->finish()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Le22/c55/s88/Vaa;->p:Z

    return-void
.end method

.method public a(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/Vaa;->l:Landroid/os/Handler;

    new-instance v1, Le22/c55/s88/d;

    invoke-direct {v1, p0, p1}, Le22/c55/s88/d;-><init>(Le22/c55/s88/Vaa;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public a(Le22/c55/s88/g/ac;)V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/Vaa;->l:Landroid/os/Handler;

    new-instance v1, Le22/c55/s88/e;

    invoke-direct {v1, p0, p1}, Le22/c55/s88/e;-><init>(Le22/c55/s88/Vaa;Le22/c55/s88/g/ac;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public a(Z)V
    .locals 0

    iput-boolean p1, p0, Le22/c55/s88/Vaa;->p:Z

    return-void
.end method

.method public b()Landroid/view/View;
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Le22/c55/s88/Vaa;->r:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    if-le v0, v2, :cond_0

    iget-object v0, p0, Le22/c55/s88/Vaa;->r:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    iget-object v1, p0, Le22/c55/s88/Vaa;->u:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->r:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Le22/c55/s88/Vaa;->c:Landroid/view/View;

    iget-object v0, p0, Le22/c55/s88/Vaa;->c:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setFocusable(Z)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->c:Landroid/view/View;

    invoke-virtual {p0, v0}, Le22/c55/s88/Vaa;->setContentView(Landroid/view/View;)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->c:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    iget-object v0, p0, Le22/c55/s88/Vaa;->c:Landroid/view/View;

    iget-object v1, p0, Le22/c55/s88/Vaa;->v:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->c:Landroid/view/View;

    :goto_0
    return-object v0

    :cond_0
    iget-boolean v0, p0, Le22/c55/s88/Vaa;->p:Z

    if-nez v0, :cond_1

    invoke-virtual {p0}, Le22/c55/s88/Vaa;->finish()V

    :goto_1
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Le22/c55/s88/Vaa;->a()V

    goto :goto_1
.end method

.method public c()Le22/c55/s88/g/ac;
    .locals 4

    const/4 v1, 0x0

    const/4 v3, 0x1

    iget-object v0, p0, Le22/c55/s88/Vaa;->w:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    if-le v0, v3, :cond_0

    iget-object v0, p0, Le22/c55/s88/Vaa;->w:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/g/ac;

    invoke-virtual {v0}, Le22/c55/s88/g/ac;->a()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->clearFocus()V

    invoke-virtual {v0}, Le22/c55/s88/g/ac;->a()Landroid/view/View;

    move-result-object v0

    iget-object v2, p0, Le22/c55/s88/Vaa;->u:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->w:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/g/ac;

    iput-object v0, p0, Le22/c55/s88/Vaa;->d:Le22/c55/s88/g/ac;

    iget-object v0, p0, Le22/c55/s88/Vaa;->d:Le22/c55/s88/g/ac;

    invoke-virtual {v0}, Le22/c55/s88/g/ac;->a()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setFocusable(Z)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->d:Le22/c55/s88/g/ac;

    iget-object v2, p0, Le22/c55/s88/Vaa;->n:Le22/c55/s88/ui/d;

    invoke-virtual {v0, v2}, Le22/c55/s88/g/ac;->a(Le22/c55/s88/ui/d;)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->n:Le22/c55/s88/ui/d;

    iget-object v2, p0, Le22/c55/s88/Vaa;->d:Le22/c55/s88/g/ac;

    const/4 v3, 0x3

    invoke-virtual {v0, v2, v1, v3}, Le22/c55/s88/ui/d;->a(Le22/c55/s88/ui/a;Le22/c55/s88/ui/n;I)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->d:Le22/c55/s88/g/ac;

    invoke-virtual {v0}, Le22/c55/s88/g/ac;->a()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    iget-object v0, p0, Le22/c55/s88/Vaa;->d:Le22/c55/s88/g/ac;

    invoke-virtual {v0}, Le22/c55/s88/g/ac;->a()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/Vaa;->v:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Le22/c55/s88/Vaa;->d:Le22/c55/s88/g/ac;

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Le22/c55/s88/Vaa;->finish()V

    move-object v0, v1

    goto :goto_0
.end method

.method public finish()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Le22/c55/s88/Vaa;->f:Landroid/app/Activity;

    iget-object v0, p0, Le22/c55/s88/Vaa;->r:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    iget-object v0, p0, Le22/c55/s88/Vaa;->w:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    iget-object v0, p0, Le22/c55/s88/Vaa;->n:Le22/c55/s88/ui/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/Vaa;->n:Le22/c55/s88/ui/d;

    invoke-virtual {v0}, Le22/c55/s88/ui/d;->d()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Le22/c55/s88/Vaa;->a()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Le22/c55/s88/Vaa;->a()V

    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 7

    const/4 v6, 0x1

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const v0, 0x186ab

    if-ne p1, v0, :cond_0

    const/16 v0, 0x4b0

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Le22/c55/s88/f/e;->B:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    iget-object v1, v1, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Le22/c55/s88/f/e;->C:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    iget-object v0, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    invoke-static {p0, v0}, Le22/c55/s88/Vaa;->a(Landroid/content/Context;Le22/c55/s88/e/j;)V

    const/4 v1, 0x0

    const/4 v2, -0x1

    iget-object v3, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    sget v4, Le22/c55/s88/f/a;->a:I

    const/4 v5, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Landroid/content/Intent;ILe22/c55/s88/e/j;IZZ)V

    :cond_0
    invoke-virtual {p0}, Le22/c55/s88/Vaa;->a()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

    const/4 v6, 0x1

    const/4 v4, 0x0

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    iput-object p0, p0, Le22/c55/s88/Vaa;->j:Landroid/content/Context;

    invoke-direct {p0}, Le22/c55/s88/Vaa;->d()V

    invoke-static {p0}, Le22/c55/s88/b/b;->a(Landroid/content/Context;)Le22/c55/s88/b/b;

    invoke-virtual {p0, v6}, Le22/c55/s88/Vaa;->requestWindowFeature(I)Z

    invoke-virtual {p0}, Le22/c55/s88/Vaa;->getIntent()Landroid/content/Intent;

    move-result-object v0

    new-instance v1, Le22/c55/s88/e/j;

    invoke-direct {v1}, Le22/c55/s88/e/j;-><init>()V

    iput-object v1, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    iget-object v1, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    sget-object v2, Le22/c55/s88/f/e;->bO:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Le22/c55/s88/e/j;->a(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    sput-object p0, Le22/c55/s88/Vaa;->f:Landroid/app/Activity;

    sget-object v1, Le22/c55/s88/f/e;->ct:Ljava/lang/String;

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    sget-object v2, Le22/c55/s88/f/e;->bQ:Ljava/lang/String;

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v3, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    iget-object v3, v3, Le22/c55/s88/e/j;->i:Ljava/lang/String;

    invoke-static {p0, v3}, Le22/c55/s88/f/a;->r(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v0, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    iget-object v0, v0, Le22/c55/s88/e/j;->i:Ljava/lang/String;

    invoke-static {p0, v0}, Le22/c55/s88/f/a;->e(Landroid/content/Context;Ljava/lang/String;)Z

    invoke-virtual {p0}, Le22/c55/s88/Vaa;->a()V

    :goto_0
    return-void

    :cond_0
    sget-object v3, Le22/c55/s88/f/e;->bR:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Le22/c55/s88/Vaa;->k:Z

    iget-object v3, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    sget-object v4, Le22/c55/s88/f/e;->bP:Ljava/lang/String;

    const/4 v5, -0x1

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, v3, Le22/c55/s88/e/j;->f:I

    iget-object v0, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    iget-byte v0, v0, Le22/c55/s88/e/j;->e:B

    const/16 v3, 0xd

    if-eq v0, v3, :cond_1

    iget-boolean v0, p0, Le22/c55/s88/Vaa;->k:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iput-object v3, v0, Le22/c55/s88/e/j;->l:Ljava/lang/Integer;

    iget-object v0, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    invoke-static {p0, v0}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Le22/c55/s88/e/j;)Z

    :cond_1
    iget-object v0, p0, Le22/c55/s88/Vaa;->e:Le22/c55/s88/e/j;

    invoke-direct {p0, v0, v2, v1}, Le22/c55/s88/Vaa;->a(Le22/c55/s88/e/j;ZZ)V

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Le22/c55/s88/Vaa;->a()V

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 0

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x4

    if-ne p1, v1, :cond_9

    iget-object v1, p0, Le22/c55/s88/Vaa;->h:Le22/c55/s88/g/s;

    if-eqz v1, :cond_1

    iget-object v1, p0, Le22/c55/s88/Vaa;->h:Le22/c55/s88/g/s;

    invoke-virtual {v1}, Le22/c55/s88/g/s;->c()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Le22/c55/s88/Vaa;->g:Le22/c55/s88/g/a;

    if-eqz v1, :cond_2

    iget-object v1, p0, Le22/c55/s88/Vaa;->g:Le22/c55/s88/g/a;

    invoke-virtual {v1}, Le22/c55/s88/g/a;->a()Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    iget-object v1, p0, Le22/c55/s88/Vaa;->i:Le22/c55/s88/g/a;

    if-eqz v1, :cond_3

    iget-object v1, p0, Le22/c55/s88/Vaa;->i:Le22/c55/s88/g/a;

    invoke-virtual {v1}, Le22/c55/s88/g/a;->a()Z

    move-result v1

    if-nez v1, :cond_0

    :cond_3
    iget-object v1, p0, Le22/c55/s88/Vaa;->h:Le22/c55/s88/g/s;

    if-eqz v1, :cond_4

    iget-object v1, p0, Le22/c55/s88/Vaa;->h:Le22/c55/s88/g/s;

    invoke-virtual {v1}, Le22/c55/s88/g/s;->c()Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_4
    iget-object v1, p0, Le22/c55/s88/Vaa;->g:Le22/c55/s88/g/a;

    if-eqz v1, :cond_5

    iget-object v1, p0, Le22/c55/s88/Vaa;->g:Le22/c55/s88/g/a;

    invoke-virtual {v1}, Le22/c55/s88/g/a;->a()Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_5
    iget-object v1, p0, Le22/c55/s88/Vaa;->i:Le22/c55/s88/g/a;

    if-eqz v1, :cond_7

    iget-object v1, p0, Le22/c55/s88/Vaa;->i:Le22/c55/s88/g/a;

    invoke-virtual {v1}, Le22/c55/s88/g/a;->a()Z

    move-result v1

    if-nez v1, :cond_7

    :cond_6
    invoke-virtual {p0}, Le22/c55/s88/Vaa;->b()Landroid/view/View;

    goto :goto_0

    :cond_7
    iget-object v1, p0, Le22/c55/s88/Vaa;->n:Le22/c55/s88/ui/d;

    if-eqz v1, :cond_8

    iget-object v1, p0, Le22/c55/s88/Vaa;->n:Le22/c55/s88/ui/d;

    invoke-virtual {v1}, Le22/c55/s88/ui/d;->c()Z

    move-result v1

    if-nez v1, :cond_0

    :cond_8
    iget-object v1, p0, Le22/c55/s88/Vaa;->n:Le22/c55/s88/ui/d;

    if-eqz v1, :cond_9

    invoke-virtual {p0}, Le22/c55/s88/Vaa;->c()Le22/c55/s88/g/ac;

    goto :goto_0

    :cond_9
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method
